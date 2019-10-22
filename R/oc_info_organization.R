#' Query Opencast current organization
#'
#' Returns the current organization.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing the settings for the anonymous role, the name, the admin role and the id.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_info_organization()
oc_info_organization <- function() {
  # Set the url path
  path <- "/api/info/organization"

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_info_organization()
#'
#' Print a structured return of the oc_info_organization() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_info_organization() function.
#' @seealso \code{\link{oc_info_organization}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_info_organization()
#'
#' resp
print.oc_info_organization <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
