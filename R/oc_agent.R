#' Query Opencast for a single capture agent
#'
#' Returns a single capture agent.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return A list containing details of a single capture agent.
#' @param agentId The maximum number of results to return for a single request.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' agents <- oc_list_agents()
#'
#' oc_agent(agents$content$agent_id)
oc_agent <- function(agentId = "") {
  # Check needed arguments
  if (agentId == "") {
    stop("No agentId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/agents/", agentId, sep = "")

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_agent()
#'
#' Print a structured return of the oc_agent() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_agent() function.
#' @seealso \code{\link{oc_agent}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' agents <- oc_list_agents()
#'
#' resp <- oc_agent(agents$content$agent_id)
#'
#' resp
print.oc_agent <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
