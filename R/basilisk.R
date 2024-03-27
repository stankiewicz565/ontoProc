#' @importFrom basilisk BasiliskEnvironment
bsklenv <- basilisk::BasiliskEnvironment(envname="bsklenv",
                              pkgname="ontoProc",
                              packages="python=3.9",
                              pip="owlready2==0.45"
)

#Python 3.10.12