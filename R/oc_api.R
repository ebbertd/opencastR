#' Query Opencast base api
#'
#' Returns key characteristics of the API such as the server name and the default version.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing the default api version and server url.
#' @import httr jsonlite
#' @export
#' @examples
#' # Set the environment variables
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' # Get the API key characteristics
#' oc_api()
oc_api <- function() {
  # Set the url path
  path <- "/api/"

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

#' Print result of oc_api()
#'
#' Print a structured return of the oc_api() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_api() function.
#' @seealso \code{\link{oc_api}}
#' @importFrom utils str
#' @export
#' @examples
#' # Set the environment variables
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' # Get the API key characteristics
#' resp <- oc_api()
#'
#' # Print out the key characteristics
#' resp
print.oc_api <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
