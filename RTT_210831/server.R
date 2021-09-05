library(tidyverse)




function(input, output, session) {
  
  tuesdata <- tidytuesdayR::tt_load('2021-08-31')
  tuesdata <- tidytuesdayR::tt_load(2021, week = 36)
  bird_baths <- tuesdata$bird_baths
  df <- na.omit(bird_baths)
  # ========================================
  # First chart about rural vs urban by year
  # ========================================
  urbanrural <- df %>%
    group_by(survey_year, urban_rural) %>%
    summarise(count = n()) %>%
    spread(urban_rural, count)
  
  urbanrural$survey_year <- as.factor(urbanrural$survey_year)
  
  fig <- plot_ly(urbanrural, x = ~Rural, y = ~survey_year, type = 'bar', orientation = 'h', name = 'Rural',
                 marker = list(color = 'rgba(181, 101, 118, 0.6)',
                               line = list(color = 'rgba(181, 101, 118, 1.0)', width = 3)))
  
  fig <- fig %>% add_trace(x = ~Urban, name = 'Urban',
                           marker = list(color = 'rgba(53, 80, 112, 0.6)',
                                         line = list(color = 'rgba(53, 80, 112, 1.0)', width = 3)))
  
  fig <- fig %>% layout(barmode = 'stack',
                        xaxis = list(title = "Birds sighted"),
                        yaxis = list(title ="Survey Year"),
                        paper_bgcolor='rgba(0,0,0,0)',
                        plot_bgcolor='rgba(0,0,0,0)'
                        )
  
  
  
  output$birdsbar1 <- renderPlotly(fig)
  output$birdsbar2 <- renderPlotly(fig)
}