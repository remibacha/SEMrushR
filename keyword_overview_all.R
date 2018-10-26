#' Keyword Overview All Databases -
#' This function provides a summary of a keyword, including its volume, CPC, competition, and the number of results in all regional databases.
#'
#' @param keyword A keyword or keyword expression you'd like to investigate.
#' @param country A regional database. Eg fr, es, de, us, uk, ru
#' @param semrush_Api_key An identification key assigned to a user after subscribing to SEMrush that is available via Profile page.
#'
#'
#' @return related_keywords provides an extended list of related keywords, synonyms, and variations relevant to a queried
#' @examples
#'\dontrun{
#' keyword_overview_all("tyler the creator","fr","xxxxxxxxxxxxxxxxxxx")
#'}
#' @export

keyword_overview_all <- function(keyword,country,semrush_Api_key){

  keyword_to_check <- as.character(keyword)

  api_request <- paste("http://api.semrush.com/?type=phrase_all",
                       "&key=",semrush_Api_key,
                       "&export_columns=Db,Ph,Nq,Cp,Co",
                       "&phrase=",keyword_to_check,
                       "&database=",country,sep="")

  api_request <-URLencode(api_request, repeated = TRUE)#pour encoder en UTF 8

  return(read.csv(api_request, sep = ";",encoding = "UTF-8"))
}
