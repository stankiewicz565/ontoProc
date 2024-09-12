#' @import reticulate basilisk
#' @export
check = function() {
 proc = basilisk::basiliskStart(bsklenv)
 on.exit(basilisk::basiliskStop(proc))
 basilisk::basiliskRun(proc, function() {
     owr = reticulate::import("owlready2")
     reticulate::py_help(owr)
   })
}


