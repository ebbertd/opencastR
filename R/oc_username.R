#' Opencast username
#'
#' This function returns the Opencast username that is set in the environment variable OPENCAST_USERNAME.
#'
#' @return A character string containing the Opencast username.
#' @seealso \code{\link{oc_hostname}} \code{\link{oc_password}}
#' @export
#' @examples
#' Sys.setenv(OPENCAST_USERNAME = "admin")
#'
#' oc_username()
oc_username <- function() {
  # Get Opencast username from system environment variable
  oc_username <- Sys.getenv("OPENCAST_USERNAME")
  # Return an error if the environment variable is not set
  if (identical(oc_username, "")) {
    stop("Please set env var OPENCAST_USERNAME to your Opencast username.",
      call. = FALSE
    )
  }
  # Return the Opencast username
  oc_username
}
