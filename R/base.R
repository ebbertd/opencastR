#' Request information on the logged in user
#'
#' Returns information on the logged in user.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#'
#' @export
#' @md

oc_user <- function(oc_con) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- "/api/info/me"
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L, .encoding = "UTF-8"))
  return(response)
}

#' Request the roles of the logged in user
#'
#' Returns current user's roles.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#'
#' @export
#' @md

oc_user_roles <- function(oc_con) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- "/api/info/me/roles"
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L, .encoding = "UTF-8"))
  return(response)
}

#' Request the available version as well as the default version
#'
#' Returns a list of available version as well as the default version.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#'
#' @export
#' @md

oc_api_version <- function(oc_con) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- "/api/version"
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L, .encoding = "UTF-8"))
  return(response)
}

#' Request the default version
#'
#' Returns the default version.
#'
#' @param oc_con A vector consiting of the elements: Opencast URL, user and password.
#'
#' @export
#' @md

oc_api_version_default <- function(oc_con) {
  userpwd <- paste(oc_con[2], ":", oc_con[3], sep = "")
  endpoint <- "/api/version/default"
  response <- jsonlite::fromJSON(RCurl::getURL(paste(oc_con[1], endpoint, sep = ""), userpwd = userpwd, httpauth = 1L, .encoding = "UTF-8"))
  return(response)
}
