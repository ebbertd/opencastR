#' Query Opencast for a specific events single publication
#'
#' Returns a single publication.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a single publication.
#' @param eventId The event id
#' @param publicationId The publication id
#' @param sign Whether public distribution urls should be signed.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_event_publication("91df4c57-9631-4a84-b814-d8e9b36a3c32",
#'                      "7964bdd6-b027-4bf9-91c1-5dec11af4bd5")
oc_event_publication <- function(eventId = "",
                                  publicationId = "",
                              sign = FALSE) {
  # Check needed arguments
  if (eventId == "") {
    stop("No eventId specified.", call. = FALSE)
  }
  if (publicationId == "") {
    stop("No publicationId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/events/", eventId, "/publications/", publicationId, sep = "")
  query <- list(sign = sign)

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url, query = query)
}

#' Print result of oc_event_publication()
#'
#' Print a structured return of the oc_event_publication() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_event_publication() function.
#' @seealso \code{\link{oc_event_publication}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_event_publication("91df4c57-9631-4a84-b814-d8e9b36a3c32",
#'                              "7964bdd6-b027-4bf9-91c1-5dec11af4bd5")
#'
#' resp
print.oc_event_publication <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}

