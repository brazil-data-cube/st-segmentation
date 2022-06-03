#
# loading segmetric and magrittr packages
#
library(segmetric)
library(magrittr)

#
# loading reference and segments object datasets
#
ref_poly <- sf::st_read("./data/raw_data/validation_poly/validation_poly_ref.shp")
seg_poly <- sf::st_read("./data/raw_data/validation_poly/validation_poly_pred.shp")

#
# reading reference and segmentation polygons
#
m <- segmetric::sm_read(ref_sf = ref_poly,
                        seg_sf = seg_poly)
#
# plotting the reference and segment polygons
#
plot(m)

#
# computing metrics
#
segmetric::sm_compute(m, c("F_measure", "recall", "precision", "M")) %>%
    summary()
