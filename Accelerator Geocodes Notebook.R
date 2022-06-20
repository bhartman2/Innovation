# ---
# title: "Accelerator Geocodes Notebook.R"
# output: html_notebook
# ---
  
# Create geometry set as a data frame and save it; reload it and look at it. 
# ```{r}
glimpse(xai)
Accel_df = geocode_OSM(xai$Location, as.data.frame=TRUE)
saveRDS(Accel_df, "Accel_df.RDS")
# ```

# Obtain the geocodes of locations as a shapefile or sf file.
# ```{r}
Accel_sf = geocode_OSM(xai$Location, as.sf=TRUE, return.first.only = FALSE)
sf::st_write(Accel_sf,"Accel_sf.shp")
# ```

# Correct the NAs.
# ```{r}
summary(Accel_sf)
Accel_sf$query=gsub("Unknown[0-9]*","NA",Accel_sf$query)
Accel_sf$query[Accel_sf$query=="NA"] = NA
# ```
# 
# ```{r}
glimpse(Accel_sf)
# ```
