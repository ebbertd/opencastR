#' Request a list of series
#'
#' Returns a list of series.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param filter A comma seperated list of filters to limit the results with. A filter is the filter's name followed by a colon ":" and then the value to filter with so it is the form :.
#' @param sort Sort the results based upon a list of comma seperated sorting criteria. In the comma seperated list each type of sorting is specified as a pair such as: :ASC or :DESC. Adding the suffix ASC or DESC sets the order as ascending or descending order and is mandatory.
#' @param limit The maximum number of results to return for a single request.
#' @param offset Number of results to skip based on the limit. 0 is the first set of results up to the limit, 1 is the second set of results after the first limit, 2 is third set of results after skipping the first two sets of results etc.
#'
#' @export
#' @md

oc_series_list <- function(oc_con, filter = "", sort = "", limit = 0, offset = 0) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/series/?filter=", filter, "&sort=", sort, "&limit=", limit, "&offset=", offset, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L))
  return(response)
}

#' Request a single series
#'
#' Returns a single series.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param seriesid The series id
#' @export
#' @md

oc_series_single <- function(oc_con, seriesid) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/series/", seriesid, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L))
  return(response)
}

#' Request a single series acl
#'
#' Returns a series' access policy.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param seriesid The series id
#' @export
#' @md

oc_series_acl <- function(oc_con, seriesid) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/series/", seriesid, "/acl", sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L))
  return(response)
}

#' Request a single series metadata
#'
#' Returns a series' metadata of all types or returns a series' metadata collection of the given type when the query string parameter type is specified. For each metadata catalog there is a unique property called the flavor such as dublincore/series so the type in this example would be 'dublincore/series'
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param seriesid The series id
#' @param type The type of metadata to return
#' @export
#' @md

oc_series_metadata <- function(oc_con, seriesid, type = "dublincore/series") {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/series/", seriesid, "/metadata?type=", type, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L))
  return(response)
}

#' Request a single series properties
#'
#' Returns a series' properties
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param seriesid The series id
#' @export
#' @md

oc_series_properties <- function(oc_con, seriesid) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/series/", seriesid, "/properties", sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L))
  return(response)
}
