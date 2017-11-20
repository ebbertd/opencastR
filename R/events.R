#' Request a single event
#'
#' Returns a single event. By setting the optional sign parameter to true, the method will pre-sign distribution urls if signing is turned on in Opencast. Remember to consider the maximum validity of signed URLs when caching this response.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param eventid The event id
#' @param sign Whether public distribution urls should be signed.
#' @param withacl Whether the acl metadata should be included in the response.
#' @param withmetadata Whether the metadata catalogs should be included in the response.
#' @param withpublications Whether the publication ids and urls should be included in the response.
#'
#' @export
#' @md

oc_event_single <- function(oc_con, eventid, sign = FALSE, withacl = FALSE, withmetadata = FALSE, withpublications = FALSE) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/events/", eventid, "?sign=", sign, "&withacl=", withacl, "&withmetadata=", withmetadata, "&withpublications=", withpublications, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd=userpwd, httpauth = 1L))
  return(response)
}

#' Request an event's access policy
#'
#' Returns an event's access policy.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param eventid The event id
#'
#' @export
#' @md

oc_event_acl <- function(oc_con, eventid) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/events/", eventid, "/acl", sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd=userpwd, httpauth = 1L))
  return(response)
}

#' Request an event's metadata
#'
#' Returns the event's metadata of the specified type. For a metadata catalog there is the flavor such as 'dublincore/episode' and this is the unique type.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param eventid The event id
#' @param type The type of metadata to get
#'
#' @export
#' @md

oc_event_metadata <- function(oc_con, eventid, type = "dublincore/episode") {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/events/", eventid, "/metadata?type=", type, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd=userpwd, httpauth = 1L))
  return(response)
}

#' Request an event's list of publications.
#'
#' Returns an event's list of publications.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param eventid The event id
#'
#' @export
#' @md

oc_event_publications_list <- function(oc_con, eventid, type = "dublincore/episode") {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/events/", eventid, "/publications", sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd=userpwd, httpauth = 1L))
  return(response)
}

#' Request a single publication of an event
#'
#' Returns a single publication.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param eventid The event id
#' @param publicationid The publication id
#'
#' @export
#' @md

oc_event_publication <- function(oc_con, eventid, publicationid) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/events/", eventid, "/publications/", publicationid, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd=userpwd, httpauth = 1L))
  return(response)
}

#' Request a list of events
#'
#' Returns a list of events. By setting the optional sign parameter to true, the method will pre-sign distribution urls if signing is turned on in Opencast. Remember to consider the maximum validity of signed URLs when caching this response.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#' @param sign Whether public distribution urls should be signed.
#' @param withacl Whether the acl metadata should be included in the response.
#' @param withmetadata Whether the metadata catalogs should be included in the response.
#' @param withpublications Whether the publication ids and urls should be included in the response.
#' @param filter A comma seperated list of filters to limit the results with. A filter is the filter's name followed by a colon ":" and then the value to filter with so it is the form :.
#' @param sort Sort the results based upon a list of comma seperated sorting criteria. In the comma seperated list each type of sorting is specified as a pair such as: :ASC or :DESC. Adding the suffix ASC or DESC sets the order as ascending or descending order and is mandatory.
#' @param limit The maximum number of results to return for a single request.
#' @param offset Number of results to skip based on the limit. 0 is the first set of results up to the limit, 1 is the second set of results after the first limit, 2 is third set of results after skipping the first two sets of results etc.
#'
#' @export
#' @md

oc_event_list <- function(oc_con, sign = FALSE, withacl = FALSE, withmetadata = FALSE, withpublications = FALSE, filter = "", sort = "", limit = 0, offset = 0) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- paste("/api/events/", "?sign=", sign, "&withacl=", withacl, "&withmetadata=", withmetadata, "&withpublications=", withpublications, "&filter=", filter, "&sort=", sort, "&limit=", limit, "&offset=", offset, sep = "")
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd=userpwd, httpauth = 1L))
  return(response)
}
