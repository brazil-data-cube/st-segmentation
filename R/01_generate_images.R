interpolate_images <- function(multicores = 1,
                               memsize = 6,
                               output_dir = tempdir(),
                               ...) {

    #
    # Creating a sits data cube
    #
    cube <- sits::sits_cube(
        source = "BDC",
        collection = "S2-RECENT_10_16D_STK-1",
        tiles = "083101",
        bands = c("NDVI", "CLOUD"),
        start_date = "2019-08-29",
        end_date   = "2020-08-12"
    )

    #
    # defining a region of interesting
    #
    roi_bbox <- c(
        lon_min = -54.7418,
        lat_min = -16.5599,
        lon_max = -54.5348,
        lat_max = -16.3860
    )

    #
    # defining the directory where images will be saved
    #
    sits::generate_images(
        cube = cube,
        roi = roi_bbox,
        multicores = multicores,
        memsize = memsize,
        output_dir = output_dir
    )
}

bdc_token <- "change-me"
output_dir <- "change-me"

Sys.setenv("BDC_ACCESS_KEY" = bdc_token)

interpolate_images(
    multicores = 6,
    memsize = 6,
    output_dir = output_dir,
    config = httr::add_headers("x-api-key" = "change-me")
)
