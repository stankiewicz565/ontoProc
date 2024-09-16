#' the functions  starts the basilisk enviroment to load owlready2
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

#' return a vector of class names in an ontology
#' @param owlfile reference to OWL file, can be URL, will be processed
#' by owlready2.get_ontology
#' @return vector
#' @examples
#' pa = get_ordo_owl_path()
#' cls = get_classnames(pa)
#' head(cls)
#' @export
get_classnames = function(owlfile) {
  proc = basilisk::basiliskStart(bsklenv)
  on.exit(basilisk::basiliskStop(proc))
  basilisk::basiliskRun(proc, function(owlfile) {
    o2 = reticulate::import("owlready2") # 'cached' by reticulate?
    cl = o2$get_ontology(owlfile)$load()$classes()
    iterate(cl, function(x) x$name) # easy because name element present always
  },owlfile=owlfile)
}

#' return a vector of class labels in an ontology
#' @param owlfile reference to OWL file, can be URL, will be processed
#' by owlready2.get_ontology
#' @return vector
#' @examples
#' pa = get_ordo_owl_path()
#' labs = get_classlabs(pa)
#' head(labs)
#' @export
get_classlabs = function(owlfile) {
  proc = basilisk::basiliskStart(bsklenv)
  on.exit(basilisk::basiliskStop(proc))
  basilisk::basiliskRun(proc, function(owlfile) {
    o2 = reticulate::import("owlready2") # 'cached' by reticulate?
    cl = o2$get_ontology(owlfile)$load()$classes()
    ll = iterate(cl, function(x) {
      z = try(x$label[0], silent=TRUE)
      if (inherits(z, "try-error")) return(NA)
      z
    })
    unlist(ll)
  },owlfile=owlfile)
}
