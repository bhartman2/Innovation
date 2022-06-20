# title Accelerator Geocode Country.R
gc=geocode_OSM(xai$Country, keep.unfound=TRUE, as.data.frame = TRUE)
nrow(gc)

# Save the gc object in a file.
saveRDS(gc, file = "xai_gc.RDS") 
