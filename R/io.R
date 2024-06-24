
#' setdr 
#' 
#' setdr  
#' @param sp 
#' @param dr 
#' @examples 
#' setdr(sp =  , dr = ~/Desktop/temp/)
#' @export 

setdr <- function(sp, dr = "~/Desktop/temp/") {

  path = glue("{dr}{sp}")
  unlink(path, recursive = TRUE)

  dir.create(path, recursive = TRUE)
  
}
