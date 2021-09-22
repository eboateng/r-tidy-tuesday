generateData_chart1 <- function(df) {
  # Emmys group by show: Winner vs Nominnes
  
  shows <-
    df %>%
    group_by(title, type) %>%
    summarise(no = n()) %>%
    spread (type, no)

  
  shows[is.na(shows)] <- 0
  shows$totalType <- shows$Nominee + shows$Winner
  shows$totalTypeRatio <- shows$Winner / shows$Nominee
  
  # Top 20 shows by:
  # Winners
  print(shows)
  if (nrow(shows>=10)){
    WStop10 <-  shows[order(-shows$Winner),][1:10,]
  }else{
    WStop10 <-  shows[order(-shows$Winner),]
  }
 
  WStop10Sort <- WStop10[order(WStop10$totalType),]
  WStop10Sort$title <- as.factor(WStop10Sort$title)
  
  return(WStop10Sort)
}