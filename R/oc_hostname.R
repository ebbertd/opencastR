#' Opencast hostname
#'
#' This function returns the Opencast hostname that is set in the environment variable OPENCAST_HOST.
#'
#' @return A character string containing the Opencast hostname.
#' @seealso \code{\link{oc_username}} \code{\link{oc_password}}
#' @export
#' @examples
#' Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
#'
#' oc_hostname()
oc_hostname <- function() {
  # Get Opencast host from system environment variable
  oc_hostname <- Sys.getenv("OPENCAST_HOST")
  # Return an error if the environment variable is not set
  if (identical(oc_hostname, "")) {
    stop("Please set env var OPENCAST_HOST to your Opencast host.",
      call. = FALSE
    )
  }
  # Return the Opencast host
  oc_hostname
}
