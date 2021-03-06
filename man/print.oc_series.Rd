% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oc_series.R
\name{print.oc_series}
\alias{print.oc_series}
\title{Print result of oc_series()}
\usage{
\method{print}{oc_series}(x, ...)
}
\arguments{
\item{x}{The return of the function this print function relates to.}

\item{...}{Possible further options to the print function.}
}
\value{
A structured print of the return by the oc_series() function.
}
\description{
Print a structured return of the oc_series() function.
}
\examples{
Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
Sys.setenv(OPENCAST_USERNAME = "admin")
Sys.setenv(OPENCAST_PASSWORD = "opencast")

series <- oc_list_series()

resp <- oc_series(series$content$identifier[1])

resp
}
\seealso{
\code{\link{oc_series}}
}
