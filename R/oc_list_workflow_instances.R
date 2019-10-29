#' Query Opencast for the list of workflow instances
#'
#' Returns a list of workflow instances.
#'
#' This function expects the hostname, username and password to be set as environment variables.
#'
#' @return Returns a list of workflow instances.
#' @param withoperations Whether the workflow operations should be included in the response.
#' @param withconfigurationpanel Whether the workflow configuration panel should be included in the response.
#' @param filter A comma seperated list of filters to limit the results with. A filter is the filter's name followed by a colon ":" and then the value to filter with so it is the form :.
#' @param sort Sort the results based upon a list of comma seperated sorting criteria. In the comma seperated list each type of sorting is specified as a pair such as: :ASC or :DESC. Adding the suffix ASC or DESC sets the order as ascending or descending order and is mandatory.
#' @param limit The maximum number of results to return for a single request.
#' @param offset The index of the first result to return.
#' @importFrom httr modify_url
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_list_workflow_instances()
oc_list_workflow_instances <- function(withoperations = FALSE,
                                       withconfigurationpanel = FALSE,
                                       filter = "",
                                       sort = "",
                                       limit = 0,
                                       offset = 0) {
  # Set the url path
  path <- "/api/workflows/"
  query <- list(
    withoperations = withoperations,
    withconfigurationpanel = withconfigurationpanel,
    filter = filter,
    sort = sort,
    limit = limit,
    offset = offset
  )

  # Construct the url for the api call
  url <- modify_url(oc_hostname(), path = path)

  # Query the api and return the response
  oc_package_query(url, query = query)
}

#' Print result of oc_list_workflow_instances()
#'
#' Print a structured return of the oc_list_workflow_instances() function.
#'
#' @param x The return of the function this print function relates to.
#' @param ... Possible further options to the print function.
#' @return A structured print of the return by the oc_list_workflow_instances() function.
#' @seealso \code{\link{oc_list_workflow_instances}}
#' @importFrom utils str
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' resp <- oc_list_workflow_instances()
#'
#' resp
print.oc_list_workflow_instances <- function(x, ...) {
  cat("<Opencast ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
