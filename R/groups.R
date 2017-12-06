#' Request a list of groups.
#'
#' Returns a list of groups.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param filter A comma seperated list of filters to limit the results with. A filter is the filter's name followed by a colon ":" and then the value to filter with so it is the form :.
#' @param sort Sort the results based upon a list of comma seperated sorting criteria. In the comma seperated list each type of sorting is specified as a pair such as: :ASC or :DESC. Adding the suffix ASC or DESC sets the order as ascending or descending order and is mandatory.
#' @param limit The maximum number of results to return for a single request.
#' @param offset Number of results to skip based on the limit. 0 is the first set of results up to the limit, 1 is the second set of results after the first limit, 2 is third set of results after skipping the first two sets of results etc.
#'
#' @export
#' @md

oc_groups_list <- function(oc_con, filter = "", sort = "", limit = 0, offset = 0) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/groups/?filter=", filter, "&sort=", sort, "&limit=", limit, "&offset=", offset, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L, .encoding = "UTF-8"))
  return(response)
}

#' Request a single group
#'
#' Returns a single group.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param groupid The group id
#'
#' @export
#' @md

oc_groups_single <- function(oc_con, groupid) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/groups/", groupid, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L, .encoding = "UTF-8"))
  return(response)
}
