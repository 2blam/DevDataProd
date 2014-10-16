library(shiny)
library(datasets)

#create the model
mtcars$cyl = factor(mtcars$cyl)
mtcars$am = factor(mtcars$am)
model = lm(mpg ~  wt + cyl+ am, data=mtcars )

getMPG = function(wt, cyl, am){
  newdata = data.frame(wt=wt/1000.0, cyl=as.factor(cyl), am=am)
  mpg = predict(model, newdata)
  mpg
}


shinyServer(
  function(input, output){
    output$inputValue_wt <- renderPrint({input$wt})
    output$inputValue_cylinder <- renderPrint({input$cylinder})
    output$inputValue_transmission <- renderPrint({input$transmission})
    output$prediction <- renderPrint(getMPG({input$wt}, {input$cylinder}, {input$transmission}))   
  }
)