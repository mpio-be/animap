

setdr <- function(sp, dr = "~/Desktop/temp/") {

  path = glue("{dr}{sp}")
  unlink(path, recursive = TRUE)

  dir.create(path, recursive = TRUE)
  
}
