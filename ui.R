library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Chick Weight Predictor"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    
    h3('Introduction'),
    
    h6 ('This system predicts the weight of a baby chick based the diet it has recieved and it\'s age'),
    h6('The source data for this prediction is the ChickWeight dataset included in R'),
    h6('The predictions are based on a simple linear model predicting the weight based on Age and Diet'),
    
    h3('Inputs'),
    
    selectInput("diet", "Choose a Diet:", 
                choices = c(1,2,3,4)),
    
    numericInput("days", "Number of Days Since Birth (0-21):", 10)
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    h3('Predicted Weight (in Grams):'),
    verbatimTextOutput("predict"),
    plotOutput("plot")
  )
))