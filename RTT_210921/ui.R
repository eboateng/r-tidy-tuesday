library(shiny)
library(shinyWidgets)
library(plotly)
library(shinydashboard)


# Dashboard properties
dash_title = 'Emmy Awards and Nominees'
dash_project = 'RTidyTuesday'
dash_date = 'September - 2021'
dash_background = '#f3f3f3ff'


ui <- dashboardPage(
  skin = "yellow",
  dashboardHeader(
    title = "Emmy Awards"
  ),
  dashboardSidebar(
    selectizeInput("sbyear", label="Year", choices=c("2021"), selected="2021", width="100%", multiple = TRUE),
    selectizeInput("sbdistributor", label="Distributor", choices=c("All"), selected="All", width="100%", multiple = TRUE),
    selectizeInput("sbshow", label="Show", choices=c("All", dash_years), selected="All", width="100%", multiple = TRUE)
    
  ),
  dashboardBody(
    fluidRow(
      column(
        width = 4,
        plotlyOutput("chart1")
      ),
      column(
        width = 5,
        plotlyOutput("chart2")
      ),
      column(
        width = 3,
        plotlyOutput("chart3")
      )
    )
  )
)
