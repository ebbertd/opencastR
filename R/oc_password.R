#' Opencast password
#'
#' This function returns the users Opencast password that is set in the environment variable OPENCAST_PASSWORD.
#'
#' @return A character string containing the users Opencast password.
#' @seealso \code{\link{oc_hostname}} \code{\link{oc_username}}
#' @export
#' @examples
#' Sys.setenv(OPENCAST_PASSWORD = "opencast")
#'
#' oc_password()
oc_password <- function() {
  # Get Opencast password from system environment variable
  oc_password <- Sys.getenv("OPENCAST_PASSWORD")
  # Return an error if the environment variable is not set
  if (identical(oc_password, "")) {
    stop("Please set env var OPENCAST_PASSWORD to your users Opencast password.",
      call. = FALSE
    )
  }
  # Return the opencast password
  oc_password
}
