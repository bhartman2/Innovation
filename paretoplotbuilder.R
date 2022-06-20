#' pareto_data_structure
#' 
#' Creates a set of Pareto plot data for a given year.
#'
#' @param x data frame containing columns called Year (integer), Industry (character), and TotVal or Count (numeric)
#' @param i integer year to be selected
#' @param which character name of column of x to be accumulated for Pareto analysis, usually "TotVal" or "Count", default "TotVal"
#'
#' @return a data frame containing 5 columns: TotVal, CumTotVal, Pct, CumPct
#'
#' @export
#' @seealso \link{pareto_plot_object}
#'
#' @example
#' \dontrun{
#' out = pareto_data_structure(x, 2016, which="Count")
#' }
#' 
pareto_data_structure = function (x, i, which="TotVal") {
  require(qcc)
  w = x %>% filter(Year==i) %>% pull(which, name=IndShort)
  v = pareto.chart(w, plot=FALSE)
  vv=data.frame(Industry=row.names(v), TotVal=v[,1], CumTotVal=v[,2], Pct=v[,3], CumPct=v[,4]) %>%
    arrange(desc(TotVal))
  vv = vv[order(vv$TotVal, decreasing=T),]
  vv$Industry <- factor(vv$Industry, levels=vv$Industry)
  invisible(vv)
}

#' pareto_plot_object
#'
#' Makes a ggplot object using a pareto data valuation structure created by pareto_data_validation().
#'
#' @param vv data frame prepared by pareto_data_structure
#' @param i integer year
#' @which character name of column to appear in title, default "TotVal"
#' @main character text to appear in chart title, default "Pareto Chart"
#'
#' @return a ggplot object
#' @export
#' @seealso \link{pareto_data_structure}
#'
#' @examples
#' \dontrun{
#' out = pareto_data_valuation(x, 2016)
#' pareto_plot_valuation(out)
#' }
pareto_plot_object = function (vv,i, which="TotVal", main="Pareto Chart") {
  require(ggQC)
    p = ggplot(vv, aes(x = Industry, y = TotVal, color=Class)) +
      ggQC::stat_pareto(point.color = "blue",
                        point.size = 3,
                        line.color = "black",
                        bars.fill = c("red", "white")) +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust=0.5)) +
      labs(title=paste0(main, " of ", which, " for year ", i),
           y = which) +
      geom_hline(aes(yintercept=.80*sum(TotVal)), color="red2", linetype=3)
  return(p)
}
