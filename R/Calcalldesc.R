#' Retrieve a Java instance of VegajavaR.
#'
#' Retrieve a Java instance of VegajavaR, with the training file
#' specified. Language model is trained before the instance is returned.
#' The spell corrector is adapted from Peter Norvig's demonstration.
#'
#' @param list.of.smiles vector of smiles
#' @param addH if true ad hidrogen to structure
#' @param corr.edge.adj if true corrects edge adjacency
#' @param aug.corr.ed if true augments and corrects edge adjacency
#' @return matrix with the calculated descriptors
#' @export
calc.all.desc <- function(list.of.smiles, addH= "false",  corr.edge.adj= "false", aug.corr.ed="true") {
  # codice per calcolare tutti i descrittori da R
  #calcola tutti i descrittori
  args<-.jarray(c(addH,corr.edge.adj,aug.corr.ed))
  provarray<- .jarray(as.character(list.of.smiles))
  descarray <- .jnew("pkg/Descarray" )
  out<-.jcall(obj = descarray, returnSig = "[[Ljava/lang/String;" , method = "CalcArrayDesc",provarray,args,
              evalArray= TRUE, simplify= TRUE, use.true.class = TRUE)
  colnames(out)<- out[1,]
 out <- out[-1,]
  return(out)
}
