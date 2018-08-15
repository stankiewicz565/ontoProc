#' load ontologies that may include non-ascii strings and therefore cannot be in data folder
#' @examples
#' co = getCellOnto()
#' co
#' clo = getCellLineOnto()
#' length(clo$id)
#' che = getChebiLite()
#' length(che$id)
#' efo = getEFOOnto()
#' length(efo$id)
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getCellOnto = function() get(load(system.file(
      "ontoRda/cellOnto.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getCellLineOnto
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getCellLineOnto = function() get(load(system.file(
      "ontoRda/cellLineOnto.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getEFOOnto
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getEFOOnto = function() get(load(system.file(
      "ontoRda/efoOnto.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getChebiLite
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getChebiLite = function() get(load(system.file(
      "ontoRda/chebi_lite.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getCellosaurusOnto
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getCellosaurusOnto = function() get(load(system.file(
      "ontoRda/cellosaurusOnto.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getUBERON_NE
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getUBERON_NE = function() get(load(system.file(
      "ontoRda/ne_uberon.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getChebiOnto
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getChebiOnto = function() get(load(system.file(
      "ontoRda/chebi_full.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getOncotreeOnto
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getOncotreeOnto = function() get(load(system.file(
      "ontoRda/oncotree.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getDiseaseOnto
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getDiseaseOnto = function() get(load(system.file(
      "ontoRda/diseaseOnto.rda", package="ontoProc")))
#' @rdname getCellOnto
#' @aliases getGeneOnto
#' @return instance of ontology_index (S3) from ontologyIndex
#' @export
getGeneOnto = function() get(load(system.file(
      "ontoRda/goOnto.rda", package="ontoProc")))

#' @rdname getCellOnto
#' @aliases getHCAOnto
#' @return instance of ontology_index (S3) from ontologyIndex,
#' @note produced from HCAO.owl at https://github.com/HumanCellAtlas/ontology as of 15 Aug 2018, using python pronto module
#' @export
getHCAOnto = function() get(load(system.file(
      "ontoRda/hcaoOnto.rda", package="ontoProc")))