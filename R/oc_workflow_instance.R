#' Query Opencast for a specific workflow instance
#'
#'  	Returns a single workflow instance.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a single workflow instance.
#' @param workflowInstanceId The workflow instance id
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' workflow_instances <- oc_list_workflow_instances()
#'
#' oc_workflow_instance(workflow_instances$content$identifier[1])
oc_workflow_instance <- function(workflowInstanceId = 0) {
  # Check needed arguments
  if (workflowInstanceId == 0) {
    stop("No workflowInstanceId specified.", call. = FALSE)
  }

  # Set the url path
  path <- paste("/api/workflows/", workflowInstanceId, sep = "")

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url)
}

#' Print result of oc_workflow_instance()
#'
#' Print a structured return of the oc_workflow_instance() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_workflow_instance() function.
#' @seealso \code{\link{oc_workflow_instance}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' workflow_instances <- oc_list_workflow_instances()
#'
#' resp <- oc_workflow_instance(workflow_instances$content$identifier[1])
#'
#' resp
print.oc_workflow_instance <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
