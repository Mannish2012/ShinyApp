#
# This is the user-interface definition of the app.
#


ui <- shinyUI(fluidPage(
  
  titlePanel(title = h4("Distributions", align = "centre")), 
  sidebarLayout(
    sidebarPanel(
      # Input panel for dataset chosen
      selectInput("Dataset", "1. Select the Dataset you want to display", 
                  choices = list("mtcars", "iris", "faithful")), 
      br(),
      
      # Radio buttons for plot type (histogram, xy-plot)
      radioButtons("Plot_Type", "2. Select the Plot type", 
                   choices = list("xy-plot", "histogram")),
      br(),
      
      # Slider for selecting number of bins in histogram if that is plot chosen by user
      sliderInput("bins", "3.Select the number of bins for the histogram", 
                  min = 5, max = 25, value = 15),
      br()
      
      
    ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Summary", verbatimTextOutput("summarize")),
                  tabPanel("Data", tableOutput("data")),
                  tabPanel("Structure", verbatimTextOutput("str")),
                  tabPanel("Plot View", plotOutput("Selected_Plot"))
      )
    )
    
    
  )
  
  
))
