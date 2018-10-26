#' SEMrush Keywords -
#' This function provides a list of both phrase matches and related keywords to a queried term in a chosen database.
#'
#' @param keyword A keyword or keyword expression you'd like to investigate.
#' @param country A regional database. Eg fr, es, de, us, uk, ru
#' @param nb_of_keywords The number of results returned to a request
#' @param semrush_Api_key An identification key assigned to a user after subscribing to SEMrush that is available via Profile page.
#' @import utils
#'
#' @return Extended list of both related keywords and phrase match to a queried term with data like search volume, CPC or number of results
#' @examples
#'\dontrun{
#' semrush_keywords("asap rocky","fr",20,"xxxxxxxxxxxxxxxxxxx")
#'}
#' @export

semrush_keywords <- function(keyword,country,nb_of_keywords,semrush_Api_key){

  keyword_to_check <- as.character(keyword)


  #Phrase Match
  api_request <- paste("http://api.semrush.com/?type=phrase_fullsearch",
                       "&key=",semrush_Api_key,
                       "&display_limit=",nb_of_keywords,
                       "&export_columns=Ph,Nq,Cp,Co,Nr,Td",
                       "&phrase=",keyword_to_check,
                       "&database=",country,sep="")
  api_request <-URLencode(api_request, repeated = TRUE)#pour encoder en UTF 8

  phrase_match <- read.csv(api_request, sep = ";",encoding = "UTF-8")
  phrase_match$type <- "Phrase Match"

  #Related Keywords
  api_request2 <- paste("http://api.semrush.com/?type=phrase_related",
                        "&key=",semrush_Api_key,
                        "&display_limit=",nb_of_keywords,
                        "&export_columns=Ph,Nq,Cp,Co,Nr,Td",
                        "&phrase=",keyword_to_check,
                        "&database=",country,sep="")

  api_request2 <-URLencode(api_request2, repeated = TRUE)#pour encoder en UTF 8

  related <- read.csv(api_request2, sep = ";",encoding = "UTF-8")
  related$type <- "Related Keywords"

  semrush_keywords_data <- rbind(related, phrase_match)
  semrush_keywords_data <- unique(semrush_keywords_data)

  return(semrush_keywords_data)

}
