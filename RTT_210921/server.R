library(tidyverse)
library(data.table)
library(plotly)
source("front/doubleBarPlot.R")


source("backend/filters.R")
source("backend/dataCharts.R")

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

dash_years = seq(1990, 2021)
dash_distributors <-  sort(unique(nom90$distributor))
dash_shows <-  sort(unique(nom90$title))
server = function(input, output, session) {
  
  tolisten <- reactive({
    list(
      input$sbyear,
      input$sbdistributor,
      input$sbshow
    
    )
  })
  
  observeEvent(tolisten(), {
    sbyear <- input$sbyear
    sbdistributor <- input$sbdistributor
    sbshow <- input$sbshow
    
    if (is.null(sbyear)){
      sbyear = 'All'
    }
    if(is.null(sbdistributor)){
      sbdistributor = 'All'
    }
    if(is.null(sbshow)){
      sbshow = 'All'
    }
    
    df_filter <- applyfilters(nom90, sbyear, sbdistributor, sbshow)
    
    checkFilters(sbyear, session, "sbyear", dash_years)
    checkFilters(sbdistributor, session, "sbdistributor", dash_distributors)
    checkFilters(sbshow, session, "sbshow", dash_shows)

    df_filter <- applyfilters(nom90, sbyear, sbdistributor, sbshow)
    
    # Chart 1
    df_c1 <- generateData_chart1(df_filter)
    chart1Viz <- viz_dbar(df_c1, df_c1$Nominee, df_c1$Winner,df_c1$titleW, "Nominee", "Winner")
    output$chart1 <- renderPlotly(chart1Viz)
    
    # Chart 3
      output$chart3 <- renderImage({
      # outfile <- tempfile(fileext = '.gif')
      list(src = "showsRace.gif", contentType = 'image/gif')}, deleteFile = FALSE)
  })
}