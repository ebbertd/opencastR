#' Query Opencast for a specific event
#'
#' Returns a single event.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a single event.
#' @param eventId The event id
#' @param sign Whether public distribution urls should be signed.
#' @param withacl Whether the acl metadata should be included in the response.
#' @param withmetadata Whether the metadata catalogs should be included in the response.
#' @param withscheduling Whether the scheduling information should be included in the response.
#' @param withpublications Whether the publication ids and urls should be included in the response.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' oc_event(events$content$identifier[1])
oc_event <- function(eventId = "",
                     sign = FALSE,
                     withacl = FALSE,
                     withmetadata = FALSE,
                     withscheduling = FALSE,
                     withpublications = FALSE) {

  # Check needed arguments
  if (eventId == "") {
    stop("No eventId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/events/", eventId, sep = "")
  query <- list(
    sign = sign,
    withacl = withacl,
    withmetadata = withmetadata,
    withscheduling = withscheduling
  )

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url, query = query)
}

#' Print result of oc_event()
#'
#' Print a structured return of the oc_event() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_event() function.
#' @seealso \code{\link{oc_event}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' events <- oc_list_events()
#'
#' resp <- oc_event(events$content$identifier[1])
#'
#' resp
print.oc_event <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
