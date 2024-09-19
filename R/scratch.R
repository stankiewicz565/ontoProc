
#' construct owlents instance from an owl file
#' @importFrom reticulate import iterate
#' @param owlfn character(1) path to valid owl ontology
#' @return instance of owlents, which is a list with clnames (
#' a vector of term names in form `[namespace]_[tag]`), allents
#' (a list with python references to owlready2 entities, that
#' can be operated on using owlready2.EntityClass methods),
#' owlfn (filename), iri (IRI), call (record of call producing
#' the entity.)
#' @examples
#' pa = get_ordo_owl_path()
#' orde = setup_entities(pa)
#' orde
#' ancestors(orde[1000:1001])
#' labels(orde[1000:1001])
#' @export 
setup_entities = function(owlfn) {
  thecall = match.call()
  o2 = reticulate::import("owlready2")
  ont = o2$get_ontology(owlfn)$load()
  cl = ont$classes()
  clnames = iterate(cl, function(x) x$name) # exhausts cl
  ents = ont$classes()  # new iterator
  allents = iterate(ents)
  ans = list(clnames=clnames, allents=allents, owlfn=owlfn, 
             iri=ont$base_iri, call=thecall)
  class(ans) = c("owlents", "list")
  ans
}

#' retrieve ancestor 'sets'
#' @param oe owlents instance
#' @return a list of sets
#' @examples
#' pa = get_ordo_owl_path()
#' orde = setup_entities(pa)
#' orde
#' ancestors(orde[1:5])
#' labels(orde[1:5])
#' @export
ancestors_work = function(pa) {
  #proc = basilisk::basiliskStart(bsklenv)
  #on.exit(basilisk::basiliskStop(proc))
  #basilisk::basiliskRun(proc, function(pa) {
  o2 = reticulate::import("owlready2")
  ont = o2$get_ontology(owlfn)$load()
  cl = ont$classes()
  clnames = iterate(cl, function(x) x$name) # exhausts cl
  ents = ont$classes()  # new iterator
  allents = iterate(ents)
  oe = list(clnames=clnames, allents=allents, owlfn=owlfn, 
             iri=ont$base_iri, call=thecall)
  class(oe) = c("owlents", "list")
  ans = lapply(oe$allents, o2$EntityClass$ancestors)
  names(ans) = oe$clnames
  ans
}





#' obtain list of names of a set of ancestors
#' @param anclist output of `ancestors`
#' @note non-entities are removed and names are extracted
#' @return list of vectors of character()
#' @examples
#' pa = get_ordo_owl_path()
#' orde = setup_entities(pa)
#' al = ancestors(orde[1001:1002])
#' ancestors_names(al)
#' @export
ancestors_names = function(anclist) {
  lapply(anclist, .ancestor_element_names)
}