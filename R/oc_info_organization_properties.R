#' Query Opencast current organization's properties
#'
#' Returns the current organization's properties.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing the current organization's properties.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_info_organization_properties()
oc_info_organization_properties <- function() {
  # Set the url path
  path <- "/api/info/organization/properties"

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_info_organization_properties()
#'
#' Print a structured return of the oc_info_organization_properties() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_info_organization_properties() function.
#' @seealso \code{\link{oc_info_organization_properties}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_info_organization_properties()
#'
#' resp
print.oc_info_organization_properties <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
