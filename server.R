
library(shiny)

shinyServer(function(input, output) {
  model <- lm(Ozone ~ Temp, data = airquality)
  modelpred <- reactive({
    tempinput <- input$slidertemp
    predict(model, newdata = data.frame(Temp = tempinput))
  })
    output$plot1 <- renderPlot({
    tempinput <- input$slidertemp

    plot (airquality$Temp, airquality$Ozone, xlab = "Temperature (F)", ylab = "Ozone (ppb)",
          xlim = c(50,110), ylim = c(0, 200))
    points(tempinput, modelpred(), col = "red", pch = 16, cex = 2)
    })

    output$pred1 <- renderText({
      modelpred()
    })
})
