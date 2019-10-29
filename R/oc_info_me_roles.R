#' Query Opencast current user's role.
#'
#' Returns current user's roles.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing the current user's roles.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_info_me_roles()
oc_info_me_roles <- function() {
  # Set the url path
  path <- "/api/info/me/roles"

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_info_me_roles()
#'
#' Print a structured return of the oc_info_me_roles() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_info_me_roles() function.
#' @seealso \code{\link{oc_info_me_roles}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_info_me_roles()
#'
#' resp
print.oc_info_me_roles <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
