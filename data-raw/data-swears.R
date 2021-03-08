## code to prepare `swears` dataset goes here

swears <- utils::read.table(
  "data-raw/swears.txt",
  header = TRUE,
  sep = "|",
  quote = "",
  row.names = NULL,
  col.names = c("explicit", "alternative"),
  na.strings = c("NA", "", "<None>"),
  colClasses = c("character", "character"),
  nrows = -1L,
  skip = 0,
  check.names = FALSE,
  fill = FALSE,
  strip.white = TRUE,
  blank.lines.skip = TRUE,
  stringsAsFactors = FALSE,
  fileEncoding = "UTF-8",
  encoding = "UTF-8",
  skipNul = FALSE
)


nas <- is.na(swears$alternative)
swears$alternative[nas] <- swears$explicit[nas]
usethis::use_data(swears, overwrite = TRUE)
