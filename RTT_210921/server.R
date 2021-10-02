library(tidyverse)
library(data.table)
library(plotly)
pkgload::load_all(path="waffle-master")
source("front/doubleBarPlot.R")
source("front/wafflesPlot.R")
source("front/linecharts.R")
source("backend/filters.R")
source("backend/dataCharts.R")

# # Read the data
tuesdata <- tidytuesdayR::tt_load('2021-09-21')
tuesdata <- tidytuesdayR::tt_load(2021, week = 39)
nominees <- as.data.table(tuesdata$nominees)

# ETL Stage
nominees[, `:=`(
  clean_category = tolower(gsub('.{7}$', '', category)),
  title = tolower(title),
  distributor = tolower(distributor)
)]

nom90 <- nominees %>% filter(year >= 1990)

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
    
    # Chart 2
    top_shows <- df_c1[order(df_c1$totalType, decreasing = TRUE),]
    top_show <- first(top_shows)$title
    print(df_c1)
    print('TOP SHOW')
    print(top_show)
    
    df_c2 <- generateData_chart2(df_filter, top_show)
    chart2Viz <- viz_waffles(df_c2)
    output$chart2 <- renderPlot(chart2Viz)
    
    # Chart 3
      output$chart3 <- renderImage({
      # outfile <- tempfile(fileext = '.gif')
      list(src = "showsRace.gif", contentType = 'image/gif')}, deleteFile = FALSE)
  })
  
  # Chart 4
  df_c4 <- generateData_chart4(nom90)
  chart4Viz <- distLineViz(df_c4)
  output$chart4 <- renderPlot(chart4Viz)
}