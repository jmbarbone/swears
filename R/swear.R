#' Swear
#'
#' Say some sh*t
#'
#' @param method A method of swearing
#' @param n The number of swears
#' @param id The integer identification of a curse
#' @export
swear <- function(method = getOption("swear.method", "explicit"), n = 1L, id = NULL) {
  stopifnot(n >= 1L)
  method <- match.arg(method, c("explicit", "censored", "alternative"))

  if (is.null(id)) {
    id <- sample(1:nrow(swears), n)
  }

  if (method == "alternative") {
    swear <- swears[id, ][[2]]
  } else{
    swear <- swears[id, ][[1]]
    if (method == "censored") {
      swear <- censor(swear)
    }
  }

  class(swear) <- c("swear", "character")
  swear
}

#' @export
print.swear <- function(x, file = stdout(), ...) {
  cat(red(paste0(x, collapse = "\n")), file = file, sep = "\n")
  jar$add()
  invisible(x)
}

#' swear on stop
#'
#' Adds some color to stop messages
#'
#' @description
#' This changes the global
#'
#' @export
swear_on_stop <- function() {
  op <- options(show.error.message = TRUE, error = swear_on_stop_fun)

  if (is.null(getOption("swears.error_original"))) {
    op$show.error.message <- op$show.error.message
    op$error <- op$error
    options(swears.error_original = op)
  }

  invisible()
}

#' @rdname swear_on_stop
#' @export
swear_on_stop_append <- function() {
  swear_on_stop()
  options(error = function() {
    o <- getOption("swears.error_original")
    if (is.function(o)) {
      do.call(o, list())
    } else {
      force(o)
    }
    swear_on_stop_fun()
  })

  invisible()
}

#' @rdname swear_on_stop
#' @export
swear_on_stop_reset <- function() {
  options(getOption("swears.error_original"))
  options(swears.error_original = NULL)
  invisible()
}

swear_on_stop_fun <- function() {
  em <- geterrmessage()
  if (grepl("object of type 'closure' is not subsettable", em, fixed = TRUE)) {
    sw <- swear(id = 11)
  } else {
    sw <- swear()
  }
  print(sw, file = stderr())
}

#' Swears
#'
#' A data frame of swears with the explicit and alternative swears.
#'
#' @format A data frame with xx rows and 2 variables
#' \describe{
#'   \item{explicit}{Swearing phrases}
#'   \item{alternative}{Alternative phrases}
#' }
#'
#' @name swears
"swears"

utils::globalVariables(c("swears"))
