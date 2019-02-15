#' Retrieve a Java instance of VegajavaR.

#' @return a Java instance of VegajavaR.
#' @export
get_vegajavaR <- function(){

.jaddClassPath('inst/java/DescjavaRfull.jar')
}
