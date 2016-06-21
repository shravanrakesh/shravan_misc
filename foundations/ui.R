require(shiny)
library(DT)

shinyUI(
  DT::dataTableOutput('mytable')
)