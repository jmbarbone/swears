`%||%` <- function(x, y) if (is.null(x)) y else x

has_crayon <- function() requireNamespace("crayon", quietly = TRUE) && crayon::has_color()

red <- function(x) if (has_crayon()) crayon::red(x) else x
