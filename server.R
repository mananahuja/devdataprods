library(shiny)
library(datasets)
library(stats)


# Define server logic to view the type of distribution

shinyServer(function(input,output){

  x <- reactive({(input$mu)}) # Used to isolate effect of changing the mean
  
  output$plot1 <- renderPlot({
    input$goButton
    
    isolate({
      
      # Select the random sampling distribution type based on input
      
      switch(input$dist,
             
             StandardNormal = hist(rnorm(input$n), mean = x, main = paste(input$n, "observations from", input$dist, "distribution with mean", input$mu)),
             Uniform = hist(runif(input$n), mean = x, main = paste(input$n, "observations from", input$dist, "distribution with mean", input$mu)),
             LogNormal = hist(rlnorm(input$n), mean = x, main = paste(input$n, "observations from", input$dist, "distribution with mean", input$mu)),
             Cauchy = hist(rcauchy(input$n), mean = x, main = paste(input$n, "observations from", input$dist, "distribution with mean", input$mu))
             )
      
      # Reactive reminder for user to hit go button to update as needed for distribution type, number of sample observations or mean
      
      output$caption1 <- renderText(paste("Distribution selected is", input$dist,"for mean",
                                           input$mu, "with", input$n, "sample observations.")
      )
      
      output$caption2 <- renderText({"Hit Go button to update."
      })
      
    })
    
  })
  
    
})
