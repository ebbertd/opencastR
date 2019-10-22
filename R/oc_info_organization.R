#' Query Opencast current organization
#'
#' Returns the current organization.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing the settings for the anonymous role, the name, the admin role and the id.
#' @import httr
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_info_organization()
oc_info_organization <- function() {
  # Set the url path
  path <- "/api/info/organization"

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Save api call to variable
  resp <-
    GET(url,
        authenticate(oc_username(), oc_password()),
        oc_package_useragent())

  # Check if api returned json, otherwise return an error
  if (http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  # Parse the response
  parsed <-
    fromJSON(content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)

  # Turn an API error into an R error
  if (http_error(resp)) {
    stop(
      sprintf(
        "Opencast API request failed [%s]\n%s\n<%s>",
        status_code(resp),
        parsed$message,
        parsed$documentation_url
      ),
      call. = FALSE
    )
  }

  # Structure the return
  structure(list(
    content = parsed,
    path = path,
    response = resp
  ),
  class = "opencast_api")
}

#' Print result of oc_info_organization()
#'
#' Print a structured return of the oc_info_organization() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_info_organization() function.
#' @seealso \code{\link{oc_info_organization}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_info_organization()
#'
#' resp
print.oc_info_organization <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
