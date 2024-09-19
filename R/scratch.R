#' use owlready2 ontology search facility on term labels
#' @param oents owlents instance
#' @param regexp character(1) simple regular expression
#' @param case_sensitive logical(1) should case be respected in search?
#' @return A named list: term labels are elements, tags are names of elements.
#' Will return NULL if nothing is found.
#' @examples
#' pa = get_ordo_owl_path()
#' orde = setup_entities(pa)
#' ol = search_labels(orde, "*Immunog*")
#' plot(orde, names(ol))
#' @export
search_labels_work = function (oents, regexp, case_sensitive=TRUE) 
{
  #
  #search(_use_str_as_loc_str=True, _case_sensitive=True, _bm25=False, **kargs)
  # 
  proc = basilisk::basiliskStart(bsklenv)
  on.exit(basilisk::basiliskStop(proc))
  basilisk::basiliskRun(proc, function(oents ) {
  stopifnot(inherits(oents, "owlents"))
  thecall = match.call()
  o2 = reticulate::import("owlready2")
  ont = o2$get_ontology(oents$owlfn)$load()
  ans = ont$search(`_case_sensitive`=case_sensitive, label = regexp)
  lans = reticulate::iterate(ans, force)
  if (length(lans)<=0) return(NULL)
  allv = lapply(lans, function(x) x$label[0])
  alln = lapply(lans, function(x) x$name)
  names(allv) = unlist(alln)
  allv},oents=oents)
}

pa = get_ordo_owl_path()
orde = setup_entities(pa)
ol = search_labels_work(orde, "*Immunog*")
setdiff(orde,ol)
