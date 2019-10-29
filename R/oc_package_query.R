#' opencastR query function
#'
#' This is an internal function of the opencastR package to query the api.
#'
#' @return The response of the api call.
#' @param url The URL for the api call.
#' @param query A list of query parameters.
#' @import httr
#' @importFrom jsonlite fromJSON
#' @export
#' @examples
#' oc_package_query()
oc_package_query <-
  function(url = "https://legacy.opencast.org/api/", query = NULL) {
    # Save api call to variable
    resp <-
      GET(url,
        query = query,
        authenticate(oc_username(), oc_password()),
        oc_package_useragent()
      )

    # Parse the response
    parsed <-
      fromJSON(content(resp, "text", encoding = "UTF-8"), simplifyDataFrame = TRUE)

    # Structure the return
    structure(list(
      content = parsed,
      url = url,
      response = resp
    ),
    class = "opencast_api"
    )
  }
