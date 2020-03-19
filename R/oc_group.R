#' Query Opencast for a specific group
#'
#' Returns a single group.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a single group.
#' @param groupId The group id
#' @importFrom httr modify_url
#' @export
#' @examples
#' \donttest{
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_group("MH_DEFAULT_ORG_EXTERNAL_APPLICATIONS")
#' }
oc_group <- function(groupId = "") {

  # Check needed arguments
  if (groupId == "") {
    stop("No groupId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/groups/", groupId, sep = "")

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_group()
#'
#' Print a structured return of the oc_group() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_group() function.
#' @seealso \code{\link{oc_group}}
#' @importFrom utils str
#' @export
#' @examples
#' \donttest{
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_group("MH_DEFAULT_ORG_EXTERNAL_APPLICATIONS")
#'
#' resp
#' }
print.oc_group <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
