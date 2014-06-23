library(shiny)


# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Fun with Probability Distributions"),
  
  # Sidebar with controls to select a number of observations, 
  # distribution type and mean. Note that changes made
  # to the caption in the textInput control are updated in the text below
  # area immediately as you type. Graph update is controlled by Go button
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "# of Observations to Plot:", min = 10, max = 1000, value = 200,
                  step = 10),
      selectInput("dist", "Choose a distribution type:", 
                  choices = c("StandardNormal", "Uniform", "LogNormal", "Cauchy")),
      sliderInput("mu", "Adder to mean of the Plot:", min = 0, max = 10, value = 0,
                  step = 1),

      actionButton("goButton", "Go!"),
      
      # Reactive reminder text to hit Go button for update
      
      verbatimTextOutput("caption1"),
      verbatimTextOutput("caption2")
    ),
    
    
    # Show the caption, and chart with
    # the requested number of observations, distribution type and mean
    mainPanel(
      plotOutput("plot1")
    )
  )
))
