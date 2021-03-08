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
print.swear <- function(x, ...) {
  cat(red(paste0(x, collapse = "\n")), sep = "\n")
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
  options(error = function() {
    em <- geterrmessage()
    if (grepl("object of type 'closure' is not subsettable", em)) {
      sw <- swear(id = 11)
    } else {
      sw <- swear()
    }
    cat(red(sw), sep = "\n")
  })
  message("successfully updated error option")
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
