#' opencastR user agent
#'
#' This function returns the user agent used in api calls of the opencastR package.
#'
#' @return A character string containing the user agent used in api calls generate with the opencastR package.
#' @import httr
#' @export
#' @examples
#' oc_package_useragent()
oc_package_useragent <- function() {
  ua <- user_agent("http://github.com/ebbertd/opencastR")
  ua
}
