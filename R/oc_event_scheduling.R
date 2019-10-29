#' Query Opencast for a specific events scheduling
#'
#' Returns an event's scheduling information.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns an event's scheduling information.
#' @param eventId The event id
#' @importFrom httr modify_url
#' @export
#' @examples
#' \donttest{
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' oc_event_scheduling(events$content$identifier[1])
#' }
oc_event_scheduling <- function(eventId = "") {

  # Check needed arguments
  if (eventId == "") {
    stop("No eventId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/events/", eventId, "/scheduling", sep = "")

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_event_scheduling()
#'
#' Print a structured return of the oc_event_scheduling() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_event_scheduling() function.
#' @seealso \code{\link{oc_event_scheduling}}
#' @importFrom utils str
#' @export
#' @examples
#' \donttest{
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' resp <- oc_event_scheduling(events$content$identifier[1])
#'
#' resp
#' }
print.oc_event_scheduling <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
