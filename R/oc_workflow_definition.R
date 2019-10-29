#' Query Opencast for a specific workflow definition
#'
#' Returns a single workflow definition.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a single workflow definition.
#' @param workflowDefinitionId The workflow definition id
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_workflow_definition("schedule-and-upload")
oc_workflow_definition <- function(workflowDefinitionId = "") {
  # Check needed arguments
  if (workflowDefinitionId == "") {
    stop("No workflowDefinitionId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/workflow-definitions/", workflowDefinitionId, sep = "")

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_workflow_definition()
#'
#' Print a structured return of the oc_workflow_definition() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_workflow_definition() function.
#' @seealso \code{\link{oc_workflow_definition}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_workflow_definition("schedule-and-upload")
#'
#' resp
print.oc_workflow_definition <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
