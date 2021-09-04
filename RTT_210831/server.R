library(dplyr)
library(tidyr)  




function(input, output, session) {

  
  y <- c('giraffes', 'orangutans', 'monkeys')
  SF_Zoo <- c(20, 14, 23)
  LA_Zoo <- c(12, 18, 29)
  data <- data.frame(y, SF_Zoo, LA_Zoo)
  
  fig <- plot_ly(data, x = ~SF_Zoo, y = ~y, type = 'bar', orientation = 'h', name = 'SF Zoo',
                 marker = list(color = 'rgba(246, 78, 139, 0.6)',
                               line = list(color = 'rgba(246, 78, 139, 1.0)',
                                           width = 3)))
  fig <- fig %>% add_trace(x = ~LA_Zoo, name = 'LA Zoo',
                           marker = list(color = 'rgba(58, 71, 80, 0.6)',
                                         line = list(color = 'rgba(58, 71, 80, 1.0)',
                                                     width = 3)))
  fig <- fig %>% layout(barmode = 'stack',
                        xaxis = list(title = ""),
                        yaxis = list(title =""))
  
  fig <- fig %>% layout(plot_bgcolor  = "rgba(0, 0, 0, 0)",
                        paper_bgcolor = "rgba(0, 0, 0, 0)",
                        fig_bgcolor   = "rgba(0, 0, 0, 0)")
  
  
  output$birdsbar1 <- renderPlotly(fig)

}