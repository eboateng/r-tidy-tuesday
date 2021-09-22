library(tidyverse)
library(data.table)
library(plotly)
source("doubleBarPlot.R")

# # # Read the data
# tuesdata <- tidytuesdayR::tt_load('2021-09-21')
# tuesdata <- tidytuesdayR::tt_load(2021, week = 39)
# nominees <- as.data.table(tuesdata$nominees)
# 
# # ETL Stage
# nominees[, `:=`(
#   clean_category = tolower(gsub('.{7}$', '', category)),
#   title = tolower(title),
#   producer = tolower(producer),
#   distributor = tolower(distributor)
# 
# )]
# 
# nom90 <- nominees %>% filter(year >= 1990)



server = function(input, output, session) {
  
  tolisten <- reactive({
    list(
      input$sbyear,
      input$sbproducer,
      input$sbshow

    )
  })

  observeEvent(tolisten(), {
    sbyear <- input$sbyear
    sbproducer <- input$sbproducer
    sbshow <- input$sbshow
    
    print(sbyear)
    print(sbproducer)
    print(sbshow)
  })
  # shows <-
  #   nom90 %>%
  #   group_by(title, type) %>%
  #   summarise(no = n()) %>%
  #   spread (type, no)
  # 
  # shows[is.na(shows)] <- 0
  # shows$totalType <- shows$Nominee + shows$Winner
  # shows$totalTypeRatio <- shows$Winner/shows$Nominee
  # 
  # # Top 20 shows by:
  # # Winners
  # WStop20 <-  shows[order(-shows$Winner), ][1:10, ]
  # WStop20Sort <- WStop20[order(WStop20$totalType), ]
  # WStop20Sort$title <- as.factor(WStop20Sort$title)
  # 
  # 
  # chart1 <- viz_dbar(
  #   WStop20Sort,
  #   WStop20Sort$Nominee,
  #   WStop20Sort$Winner,
  #   WStop20Sort$title,
  #   "Nominee",
  #   "Winner"
  # )
  # output$chart1 <- renderPlotly(chart1)
  # output$chart2 <- renderPlotly(chart1)
  # output$chart3 <- renderPlotly(chart1)
}