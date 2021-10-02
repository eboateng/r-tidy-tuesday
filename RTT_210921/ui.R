library(shiny)
library(shinyWidgets)
library(plotly)
library(shinydashboard)

# Dashboard properties
dash_title = 'Emmy Awards and Nominees'
dash_project = 'RTidyTuesday'
dash_date = 'September - 2021'
dash_background = c('#262626')


ui <- dashboardPage(
  
  dashboardHeader(
    title = "Emmy Awards"
  ),
  dashboardSidebar(
    selectizeInput("sbyear", label="Year", choices=c("2021"), selected="2021", width="100%", multiple = TRUE),
    selectizeInput("sbdistributor", label="Distributor", choices=c("All"), selected="All", width="100%", multiple = TRUE),
    selectizeInput("sbshow", label="Show", choices=c("All"), selected="All", width="100%", multiple = TRUE)
    
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$link(rel="preconnect", href="https://fonts.googleapis.com"),
      
      tags$link(href="https://fonts.googleapis.com/css2?family=Nunito&display=swap", rel="stylesheet")
    ),
    fluidRow(
      column(
        width = 4,
        plotlyOutput("chart1")
      ),
      column(
        width = 8,
        style = "background-color:#ECF0F5;",
        plotOutput("chart2")

      )
    ),
    hr(),
    fluidRow(
      column(
        width = 6,
        imageOutput("chart3")
      ),
      column(
        width = 6,
        imageOutput("chart4")
      )
    )
  )
)
