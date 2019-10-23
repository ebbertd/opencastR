test_that("the username is read correctly", {
  Sys.setenv(OPENCAST_USERNAME = "admin")
  expect_equal(oc_username(), "admin")
})

test_that("an error is thrown when the username is not set", {
  Sys.unsetenv("OPENCAST_USERNAME")
  expect_error(oc_username())
})
