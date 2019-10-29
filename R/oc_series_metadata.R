#' Query Opencast for a specific series metadata
#'
#' Returns a series' metadata of all types or returns a series' metadata collection of the given type when the query string parameter type is specified.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a series' metadata of all types or returns a series' metadata collection of the given type when the query string parameter type is specified.
#' @param seriesId The event id
#' @param type The type of metadata to get
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' series <- oc_list_series()
#'
#' oc_series_metadata(series$content$identifier[1])
oc_series_metadata <- function(seriesId = "",
                               type = "") {
  # Check needed arguments
  if (seriesId == "") {
    stop("No seriesId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/series/", seriesId, "/metadata", sep = "")
  query <- list(type = type)

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url, query = query)
}

#' Print result of oc_series_metadata()
#'
#' Print a structured return of the oc_series_metadata() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_series_metadata() function.
#' @seealso \code{\link{oc_series_metadata}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' series <- oc_list_series()
#'
#' resp <- oc_series_metadata(series$content$identifier[1])
#'
#' resp
print.oc_series_metadata <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
