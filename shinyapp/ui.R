# setwd("C:/Users/User/Desktop/devDataProd")
library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Motor Trend Car Road Tests - Prediction on Miles Per Gallon (MPG)"),
    
    sidebarPanel(
      numericInput("wt", "Weight (in lb)", value=1000, min = 1, max = 9999, step = 0.01),
      selectInput('cylinder', "Number of Cylinder:", choices=c(4, 6, 8)),
      radioButtons('transmission', "Type of Transmission:", choices=c("Automatic"=0 , "Manual"=1)),
      submitButton('Submit')
    ),
    
    mainPanel(  
      tabsetPanel(
        # Data 
        tabPanel('Main',
                 h4('You entered:'),
                 p('Weight (in lb): '), verbatimTextOutput("inputValue_wt"),
                 p('Number of Cylinder: '), verbatimTextOutput("inputValue_cylinder"),
                 p('Transmission (0 - Automatic; 1 - Manual) : '), verbatimTextOutput("inputValue_transmission"),
                 h4('The estimated MPG:'),
                 verbatimTextOutput("prediction")
        ),
        # Data 
        tabPanel('Information',
                 p('In this project, we adopted motor trend car toad tests (mtcars) dataset to create a model for predicting Miles Per Gallon (MPG) usage of a car.'),
                 p('User needs to input three pieces of information and then press the "Submit" button. Then, the estimated MPG value will then be shown on the page.'),
                 p('Three pieces of information are:'),
                 tags$div(
                   tags$ul(
                     tags$li('Weight in Pound (lb): range from 1000 lb to 9999 lb'),          
                     tags$li('Number of Cylinder: 4, 6, 8'),
                     tags$li('Type of Transmission: Automatic (0), Manaul (1)')
                   )
                 ),
                 HTML('We created the linear model: <b>mpg ~ wt + cyl + am</b> where wt is weight in 10<sup>3</sup> lb, cyl is number of cylinders, am is the type of transmission (0-automatic; 1-manual) and mpg is miles per gallon.'),
                 HTML('<br><br><b>Note:</b> The user input of the weight is in pound (lb). The weight is then converted to 10<sup>3</sup> pound in the backend for estimating the MPG.')
        )
      
      )
    )        
  )
)