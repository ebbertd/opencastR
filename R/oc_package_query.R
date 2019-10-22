#' opencastR query function
#'
#' This is an internal function of the opencastR package to query the api.
#'
#' @return The response of the api call.
#' @param url The URL for the api call.
#' @import httr
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' oc_package_query()
oc_package_query <- function(url = "https://legacy.opencast.org/api/") {
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
    url = url,
    response = resp
  ),
  class = "opencast_api")
}
