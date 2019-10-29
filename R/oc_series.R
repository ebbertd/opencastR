#' Query Opencast for a specific series
#'
#' Returns a single series.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a single series.
#' @param seriesId The series id
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' series <- oc_list_series()
#'
#' oc_series(series$content$identifier[1])
oc_series <- function(seriesId = "") {
  # Check needed arguments
  if (seriesId == "") {
    stop("No seriesId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/series/", seriesId, sep = "")

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_series()
#'
#' Print a structured return of the oc_series() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_series() function.
#' @seealso \code{\link{oc_series}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' series <- oc_list_series()
#'
#' resp <- oc_series(series$content$identifier[1])
#'
#' resp
print.oc_series <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
