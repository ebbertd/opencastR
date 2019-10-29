#' Query Opencast for a specific events publications
#'
#' Returns an event's list of publications.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns an event's list of publications.
#' @param eventId The event id
#' @param sign Whether public distribution urls should be signed.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' oc_event_list_publications(events$content$identifier[1])
oc_event_list_publications <- function(eventId = "",
                                       sign = FALSE) {
  # Check needed arguments
  if (eventId == "") {
    stop("No eventId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/events/", eventId, "/publications", sep = "")
  query <- list(sign = sign)

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url, query = query)
}

#' Print result of oc_event_list_publications()
#'
#' Print a structured return of the oc_event_list_publications() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_event_list_publications() function.
#' @seealso \code{\link{oc_event_list_publications}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' resp <- oc_event_list_publications(events$content$identifier[1])
#'
#' resp
print.oc_event_list_publications <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
