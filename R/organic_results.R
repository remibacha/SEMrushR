#' Organic Results -
#' This function lists domains that are ranking in Google top 20 organic search results with a requested keyword.
#'
#' @param keyword A keyword or keyword expression you'd like to investigate.
#' @param country A regional database. Eg fr, es, de, us, uk, ru
#' @param limit The number of results returned to a request; if this parameter is not specified or equal to 0, the default value will be 10,000 lines.
#' @param semrush_Api_key An identification key assigned to a user after subscribing to SEMrush that is available via Profile page.
#'
#'
#' @return organic_results lists domains that are ranking in Google top 20 organic search results with a requested keyword.

#' @examples
#'\dontrun{
#'organic_results("travis scott","fr",100,"xxxxxxxxxxxxxxxxxxx")
#'}
#'
#' @export
organic_results <- function(keyword,country,limit,semrush_Api_key){

  keyword_to_check <- as.character(keyword)

  api_request <- paste("http://api.semrush.com/?type=phrase_organic&key=",semrush_Api_key,"&display_limit=",limit,
                       "&export_columns=Dn,Ur&phrase=",keyword,"&database=",country,sep="")

  api_request <-URLencode(api_request, repeated = TRUE)#pour encoder en UTF 8

  return(read.csv(api_request, sep = ";",encoding = "UTF-8"))
}
