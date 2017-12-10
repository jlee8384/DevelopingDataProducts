library(shiny)

shinyUI(fluidPage(
  titlePanel("Correlation of Temperature and Air Quality During the Summer in NY"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slidertemp", "What is the Temp (F) in NY?", 50, 110, value = 70)
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Ozone Level"),
      textOutput("pred1")
    )
  )
))
