library(shiny)
library(shinyWidgets)

# Dashboard properties
dash_title = 'Emmy Awards and Nominees'
dash_project = 'RTidyTuesday'
dash_date = 'September - 2021'
dash_background = '#f3f3f3ff'

ui <- shinyUI(fluidPage(
  titlePanel(dash_title),
  setBackgroundColor(dash_background),
  p(dash_project)
))
