#' Query Opencast api versions
#'
#' Returns a list of available version as well as the default version.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing the available api versions
#' @import httr
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_version()
oc_version <- function() {
  # Set the url path
  path <- "/api/version"

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

#' Print result of oc_version()
#'
#' Print a structured return of the oc_version() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_version() function.
#' @seealso \code{\link{oc_version}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_version()
#'
#' resp
print.oc_version <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
