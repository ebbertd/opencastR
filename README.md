# Overview

opencastR is a R package that is designed to read information from the external API of an [Opencast](http://www.opencast.org/) server.

## Installation

```R
# The easiest way to get opencastR is to install it using the devtools:

install.packages("devtools")
devtools::install_github("tidyverse/haven")
```

## Usage

Every function requires a vector with the Opencast connection details. For example:

```R
ocapi <- c("URL", "USER", "PASSWORD")
oc_user(ocapi)
```
