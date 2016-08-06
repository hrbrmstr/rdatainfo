#' @export
get_info <- function(path) {
  path <- gsub("file://", "", path)
  denv <- new.env()
  load(path, denv)
  for (x in names(denv)) {
    cat(x, "\n", paste0(rep("-", nchar(x)), collapse=""), "\n", paste0(capture.output(str(denv[[x]])), collapse="\n"), "\n\n", sep="")
  }
}
