library(shiny)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  

  output$predict<- renderPrint({
    fit <- lm(weight ~ Time + Diet, data = ChickWeight)
    new_data <- data.frame(Time = input$days, Diet = as.factor(input$diet))
    predict(fit,new_data)[[1]]
  })
  
  output$plot <- renderPlot({
    subset_idx <- which(ChickWeight$Diet == input$diet)
    subset <- ChickWeight[subset_idx,]
    title <- c('Weight Vs. Time for Chicks Receiving Diet ',input$diet)
    plot(subset$Time,subset$weight,main=title,ylab='Weight in Grams',xlab='Days Since Birth')
  })
})