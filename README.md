<!-- badges: start -->
  [![Build Status](https://travis-ci.org/ebbertd/opencastR.svg?branch=master)](https://travis-ci.org/ebbertd/opencastR)
  [![CRAN status](https://www.r-pkg.org/badges/version/opencastR)](https://CRAN.R-project.org/package=opencastR)
  <!-- badges: end -->

# Overview

opencastR is a R package that is designed to read information from the external API of an [Opencast](http://www.opencast.org/) server.

## Status

At the moment only the GET functions are implemented.

## Installation

The easiest way to get opencastR is to install it using the devtools:

```R
install.packages("devtools")
devtools::install_github("ebbertd/opencastR")
```

## Usage

Every function requires the hostname, username and password to be set as environment variables. For example:

```R
Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
Sys.setenv(OPENCAST_USERNAME = "admin")
Sys.setenv(OPENCAST_PASSWORD = "opencast")

oc_api()
```
