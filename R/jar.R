# capture your shame in an environment

jar <- new.env()
jar$count <- 0L
class(jar) <- c("swear_jar", "environment")

jar$add <- function() {
  jar$count <- jar$count + 1L
  invisible(jar)
}

jar$reset <- function() {
  jar$count <- 0L
  invisible(jar)
}

lockEnvironment(jar)

#' @export
print.swear_jar <- function(x, ...) {
  cat("You have sworn", jar$count, "times.\n")
  invisible(x)
}
