library(ggrepel)
library(ggtext)

distLineViz <- function(df){
  showPlot <- showPlot %>% 
    mutate(label = if_else(year == max(year), as.character(logo), NA_character_))
  
  ggplot(showPlot, aes(x=year, y=Winner, group=distributor)) +
    geom_line(aes(color=distributor))+
    geom_point(aes(color=distributor))+
    geom_richtext(aes(label = label), nudge_x = 1, na.rm = TRUE, fill = alpha(c("white"),0), color= alpha(c("white"),0))+
    theme_minimal() + theme(
      panel.grid = element_blank(), 
      legend.position = "top",
      legend.title= element_blank(),
      axis.ticks.y = element_blank(),
      axis.title.y = element_blank(),
      axis.text.y = element_blank(),
      panel.background = element_rect(fill = backgroundcolor, color = NA),
      plot.background = element_rect(fill = backgroundcolor, color = NA),
      
    ) 
}

