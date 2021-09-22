library(tidyverse)
library(data.table)
library(plotly)
source("doubleBarPlot.R")
source("filters.R")
source("dataCharts.R")

# # # Read the data
# tuesdata <- tidytuesdayR::tt_load('2021-09-21')
# tuesdata <- tidytuesdayR::tt_load(2021, week = 39)
# nominees <- as.data.table(tuesdata$nominees)
# 
# # ETL Stage
# nominees[, `:=`(
#   clean_category = tolower(gsub('.{7}$', '', category)),
#   title = tolower(title),
#   distributor = tolower(distributor),
#   distributor = tolower(distributor)
# 
# )]
# 
# nom90 <- nominees %>% filter(year >= 1990)



server = function(input, output, session) {
  
  tolisten <- reactive({
    list(
      input$sbyear,
      input$sbdistributor,
      input$sbshow

    )
  })
  # Update selectizes
  listdistributors <-  sort(unique(nom90$distributor))
  updateSelectizeInput(session = session, inputId = "sbdistributor", selected = 'All', choices = c('All',listdistributors))
  
  observeEvent(tolisten(), {
    sbyear <- input$sbyear
    sbdistributor <- input$sbdistributor
    sbshow <- input$sbshow
    print(sbdistributor)
    
    if
    if((sbdistributor[1]!='All')& ('All' %in% sbdistributor)){
      updateSelectizeInput(session = session, inputId = "sbdistributor", selected = 'All', choices = c('All',listdistributors))
    }else{
      newlist <- sbdistributor[sbdistributor!='All']
      print('else')
      print(newlist)
      updateSelectizeInput(session = session, inputId = "sbdistributor", selected = sbdistributor, choices = c('All',listdistributors))
    }
    
    # df_filter <- applyfilters(nom90, sbyear, sbdistributor, sbshow)
    # df_c1 <- generateData_chart1(df_filter)
   
    # 
    # chart1Viz <- viz_dbar(df_c1, df_c1$Nominee, df_c1$Winner,df_c1$title, "Nominee", "Winner")
    # 
    # output$chart1 <- renderPlotly(chart1Viz)
    # output$chart2 <- renderPlotly(chart1Viz)
    # output$chart3 <- renderPlotly(chart1Viz)
  })
  
  


}