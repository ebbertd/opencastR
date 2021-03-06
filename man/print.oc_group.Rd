% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oc_group.R
\name{print.oc_group}
\alias{print.oc_group}
\title{Print result of oc_group()}
\usage{
\method{print}{oc_group}(x, ...)
}
\arguments{
\item{x}{The return of the function this print function relates to.}

\item{...}{Possible further options to the print function.}
}
\value{
A structured print of the return by the oc_group() function.
}
\description{
Print a structured return of the oc_group() function.
}
\examples{
\donttest{
Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
Sys.setenv(OPENCAST_USERNAME = "admin")
Sys.setenv(OPENCAST_PASSWORD = "opencast")

resp <- oc_group("MH_DEFAULT_ORG_EXTERNAL_APPLICATIONS")

resp
}
}
\seealso{
\code{\link{oc_group}}
}
