library(ggvis)

shinyUI(fluidPage(
  titlePanel("Paid Search Report"),
  fluidRow(
    column(3,
           wellPanel(
             h2("Metrics"),
             selectInput("xvar", "X-Axis Variable", axis_vars, selected = "Clicks"),
             selectInput("yvar", "Y-Axis Variable", axis_vars, selected = "Cost")
           )),
    column(9,
           ggvisOutput("plot1")
    )
  )))
