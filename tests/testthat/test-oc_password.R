test_that("the password is read correctly", {
  Sys.setenv(OPENCAST_PASSWORD = "opencast")
  expect_equal(oc_password(), "opencast")
})

test_that("an error is thrown when the password is not set", {
  Sys.unsetenv("OPENCAST_PASSWORD")
  expect_error(oc_password())
})
