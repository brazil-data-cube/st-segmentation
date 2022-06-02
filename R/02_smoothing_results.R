#
# loading raster package
#
library(raster)

#
# creating a vector with the images paths
#
path_map_clust <- c(
    "./data/raw_data/results_ndvi/s2_12x12_20_4clust_NDVI.tif",
    "./data/raw_data/results_ndvi/s2_12x12_20_12clust_NDVI.tif"
)

#
# defining the window size for smooth
#
w <- matrix(data = rep(1, 49), nrow = 7, ncol = 7)

for (map_clust in path_map_clust) {

    # reading map clust
    rast_clust <- raster::raster(map_clust)

    # creating a output file name
    posfix_name <- "smoothed_test"
    output_rast <- paste0(
        tools::file_path_sans_ext(map_clust), "_", posfix_name, ".tif"
    )

    # applying a modal smooth
    raster::focal(x = rast_clust,
                  w = w,
                  fun = raster::modal,
                  filename = output_rast,
                  options = c("COMPRESS=LZW", "TFW=YES"),
                  datatype = "INT1U")
}
