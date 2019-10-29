#' Query Opencast list of capture agent
#'
#' Returns a list of agents.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing the capture agents
#' @param limit The maximum number of results to return for a single request.
#' @param offset The index of the first result to return.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_list_agents()
oc_list_agents <- function(limit = 0, offset = 0) {
  # Set the url path
  path <- "/api/agents/"
  query <- list(
    limit = limit,
    offset = offset
  )

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url, query = query)
}

#' Print result of oc_list_agents()
#'
#' Print a structured return of the oc_list_agents() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_list_agents() function.
#' @seealso \code{\link{oc_list_agents}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_list_agents()
#'
#' resp
print.oc_list_agents <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
