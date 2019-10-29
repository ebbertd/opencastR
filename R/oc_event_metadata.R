#' Query Opencast for a specific events metadata
#'
#' Returns the event's metadata of the specified type.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns the event's metadata of the specified type.
#' @param eventId The event id
#' @param type The type of metadata to get
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' oc_event_metadata(events$content$identifier[1])
oc_event_metadata <- function(eventId = "",
                              type = "") {
  # Check needed arguments
  if (eventId == "") {
    stop("No eventId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/events/", eventId, "/metadata", sep = "")
  query <- list(type = type)

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url, query = query)
}

#' Print result of oc_event_metadata()
#'
#' Print a structured return of the oc_event_metadata() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_event_metadata() function.
#' @seealso \code{\link{oc_event_metadata}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' resp <- oc_event_metadata(events$content$identifier[1])
#'
#' resp
print.oc_event_metadata <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
