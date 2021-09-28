generateData_chart1 <- function(df) {
  # Emmys group by show: Winner vs Nominnes
  res <- data.frame(
    title=character(),
    Nominee=integer(),
    Winner=integer(),
    totalType=integer()
  )
  
  shows <-
    df %>%
    group_by(title, type) %>%
    summarise(no = n()) %>%
    spread (type, no)
  
  if (nrow(shows)>=1){
    shows[is.na(shows)] <- 0
    shows$totalType <- shows$Nominee + shows$Winner

    if (nrow(shows>=10)){
      WStop10 <-  shows[order(-shows$Winner),][1:5,]
    }else{
      WStop10 <-  shows[order(-shows$Winner),]
    }
    
    res <- WStop10[order(WStop10$totalType),]
    res$titleW <- sapply(res$title, 
                          FUN = function(x) {paste(strwrap(x, width = 20), collapse = " <br>")})
  }
  return(res)
}


generateData_chart2 <- function(df, show){
  showsYear <-
    df %>%
    filter(title==show)%>%
    group_by(year, title, type) %>%
    summarise(no = n()) %>%
    spread (type, no)
  showsYear[is.na(showsYear)] <- 0
  
  print(showsYear)
  df_melt <- reshape2::melt(showsYear, id.vars=c('year','title'))
  return(df_melt)
}