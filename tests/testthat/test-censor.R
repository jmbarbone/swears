expect_censored <- function(x) {
  testthat::expect_identical(censor(names(x)), unname(x))
}

test_that("censoring works", {
  expect_censored(c(
    fuck          = "f**k",
    ass           = "*ss",
    dumbass       = "dum**ss",
    harass        = "harass",
    god           = "g*d",
    godamn        = "g*d*mn",
    goddamnit     = "g*dd*mnit",
    pussy         = "p***y",
    pussyfooting  = "pussyfooting",
    motherfucking = "motherf**king",
    motherfucker  = "motherf**ker",
    mothafuck     = "mothaf**k"
  ))
})
