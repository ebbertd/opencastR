% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/series.R
\name{oc_series_metadata}
\alias{oc_series_metadata}
\title{Request a single series metadata}
\usage{
oc_series_metadata(oc_con, seriesid, type = "dublincore/series")
}
\arguments{
\item{oc_con}{A vector consiting of the elements: Opencast URL, user and password.}

\item{seriesid}{The series id}

\item{type}{The type of metadata to return}
}
\description{
Returns a series' metadata of all types or returns a series' metadata collection of the given type when the query string parameter type is specified. For each metadata catalog there is a unique property called the flavor such as dublincore/series so the type in this example would be 'dublincore/series'
}