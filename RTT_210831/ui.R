library(shiny)
library(shinyWidgets)
library(plotly)

shinyUI(fluidPage(
  setBackgroundColor(
    color = c("#f3f3f3ff"),
  ),
  titlePanel("Birds Baths Analysis"),
  fluidRow(
    column(
      width = 6,
      plotlyOutput("birdsbar1")
    )
  ),
  fluidRow(
    column(
      width = 6,
      plotlyOutput("birdsbar2")
    )
  )
))