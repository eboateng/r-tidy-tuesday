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


generateData_chart4 <- function(df){
  showPlot <-
    df %>%
    filter(distributor%in% c('netflix', 'hbo', 'prime video', 'apple tv', 'disney+'))%>%
    group_by(distributor, type, year) %>%
    summarise(no = n()) %>%
    spread (type, no)
  
  showPlot[is.na(showPlot)] <- 0
  showPlot$logo <- NA
  showPlot$logo[showPlot$distributor=='netflix'] <- "<img width=20 src='https://i.pinimg.com/originals/8c/51/0e/8c510ee7de078ac4eaafdb9d15a810dd.png'>"
  showPlot$logo[showPlot$distributor=='apple tv'] <- "<img width=20 src='https://wiseplaylistasiptv.com/wp-content/uploads/2020/11/1269701_ico.png'>"
  showPlot$logo[showPlot$distributor=='hbo'] <- "<img width=20 src='https://img.apksum.com/e2/com.hbo.android.app/3.6.1/icon.png'>"
  showPlot$logo[showPlot$distributor=='disney+'] <- "<img width=20 src='https://cdn.iconscout.com/icon/free/png-256/disney-282116.png'>"
  showPlot$logo[showPlot$distributor=='prime video'] <- "<img width=20 src='https://m.media-amazon.com/images/G/01/digital/video/acquisition/amazon_video_light_on_dark.png'>"
  return(showPlot)
}