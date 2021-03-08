test_that("swearing", {
  expect_visible(swear())
})


test_that("swearing on stop", {
  op <- options()
  options(swear.method = "explicit")
  on.exit(options(op, add = TRUE))
  swear_on_stop()

  # I suppose it simply doesn't prevent errors?
  df <- stats::df
  expect_error(df[1])
})
