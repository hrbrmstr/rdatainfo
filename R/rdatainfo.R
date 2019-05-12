#' @export
get_info <- function(path) {

  path <- gsub("file://", "", path)
  denv <- new.env()

  ext <- tolower(tools::file_ext(path))

  if (ext == "rds") {

    tmp <- readRDS(path)

    cat(
      paste0(
        capture.output(str(tmp, width = 120)),
        collapse = "\n"
      ), "\n\n", sep=""
    )

  } else if (ext %in% c("rda", "rdata")) {

    load(path, denv)

    for (x in names(denv)) {
      cat(
        x, "\n",
        paste0(rep("-", nchar(x)), collapse=""), "\n",
        paste0(
          capture.output(str(denv[[x]])),
          collapse="\n"
        ), "\n\n", sep=""
      )
    }

  }

}
