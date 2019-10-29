#' Query Opencast for a specific series acl
#'
#' Returns a series' access policy.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a series' access policy.
#' @param seriesId The event id
#' @importFrom httr modify_url
#' @export
#' @examples
#' \donttest{
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' series <- oc_list_series()
#'
#' oc_series_acl(series$content$identifier[1])
#' }
oc_series_acl <- function(seriesId = "") {
  # Check needed arguments
  if (seriesId == "") {
    stop("No seriesId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/series/", seriesId, "/acl", sep = "")

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_series_acl()
#'
#' Print a structured return of the oc_series_acl() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_series_acl() function.
#' @seealso \code{\link{oc_series_acl}}
#' @importFrom utils str
#' @export
#' @examples
#' \donttest{
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' series <- oc_list_series()
#'
#' resp <- oc_series_acl(series$content$identifier[1])
#'
#' resp
#' }
print.oc_series_acl <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
