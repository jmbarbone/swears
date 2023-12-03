#' Censor
#'
#' Censor swear words
#'
#' @param x A character vector to sensor
#' @examples
#' censor(swear("explicit", n = 3))
#' @export
censor <- function(x) {
  # maybe not the best but eh...
  x <- .censor(x, "(f)uc(k)")
  x <- .censor(x, "(cr)a(p)")
  x <- .censor(x, "(sh)i(t)")
  x <- .censor(x, "(h)e(ll)")
  x <- .censor(x, "(dum)ba(ss)")
  x <- .censor(x, "(god+)a(nm)")
  x <- .censor(x, "(d)a(mn)")
  x <- .censor(x, "^ass$", "*ss")
  x <- .censor(x, "(g)o(d)")
  x <- .censor(x, "(b)a(ll)")
  x <- .censor(x, "(c)u(nt)")
  x <- .censor(x, "(d)i(ck)")
  x <- .censor(x, "(c)oc(k)")
  x <- .censor(x, "(p)uss(y)$")
  x <- .censor(x, "(b)i(tch)")
  x <- .censor(x, "(wh)or(e)")
  x <- .censor(x, "(sl)u(t)")
  x <- .censor(x, "moth(er|a)-?fuck(er)?", "motherf**k\\2")
  x
}

.censor <- function(x, pattern, replace = NULL) {
  if (is.null(replace)) {
    n <- .n_asterick(pattern)
    replace <- sprintf("\\1%s\\2", paste0(rep("*", n), collapse = ""))
  }

  vapply(
    strsplit(x, "[[:space:]]+"),
    function(i) {
      paste0(gsub(pattern, replace, i, ignore.case = TRUE), collapse = " ")
    },
    NA_character_,
    USE.NAMES = FALSE
  )
}

.n_asterick <- function(x) {
  splits <- strsplit(x, "()")[[1]]
  max(which(splits == "(")) - min(which(splits == ")")) - 1L
}
