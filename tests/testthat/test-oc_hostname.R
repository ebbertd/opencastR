test_that("the hostname is read correctly", {
  Sys.setenv(OPENCAST_HOST = "https://legacy.opencast.org")
  expect_equal(oc_hostname(), "https://legacy.opencast.org")
})

test_that("an error is thrown when the hostname is not set", {
  Sys.unsetenv("OPENCAST_HOST")
  expect_error(oc_hostname())
})
