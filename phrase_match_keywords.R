#' Phrase Match Keywords -
#' This function provides a list of phrase matches and alternate search queries, including particular keywords or keyword expressions.provides an extended list of related keywords, synonyms, and variations relevant to a queried term in a chosen database.
#'
#' @param keyword A keyword or keyword expression you'd like to investigate.
#' @param country A regional database. Eg fr, es, de, us, uk, ru
#' @param nb_of_keywords The number of results returned to a request
#' @param semrush_Api_key An identification key assigned to a user after subscribing to SEMrush that is available via Profile page.
#'
#'
#' @return phrase_match_keywords provides an extended list of related keywords, synonyms, and variations relevant to a queried
#' @examples
#'\dontrun{
#' phrase_match_keywords("kanye west","fr",10,"xxxxxxxxxxxxxxxxxxx")
#'}
#' @export
phrase_match_keywords <- function(keyword,country,nb_of_keywords,semrush_Api_key){

  keyword_to_check <- as.character(keyword)

  api_request <- paste("http://api.semrush.com/?type=phrase_fullsearch",
                       "&key=",semrush_Api_key,
                       "&display_limit=",nb_of_keywords,
                       "&export_columns=Ph,Nq,Cp,Co,Nr,Td",
                       "&phrase=",keyword_to_check,
                       "&database=",country,sep="")

  api_request <-URLencode(api_request, repeated = TRUE)#pour encoder en UTF 8

  return(read.csv(api_request, sep = ";",encoding = "UTF-8"))
}
