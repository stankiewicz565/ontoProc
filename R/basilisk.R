#' @importFrom basilisk BasiliskEnvironment
ontoProc_env <- basilisk::BasiliskEnvironment(envname="ontoProc_env",
                              pkgname="ontoProc",
                              packages=c("owlready2==0.45")
)

#Python 3.10.12