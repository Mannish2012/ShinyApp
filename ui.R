#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

ui <- shinyUI(fluidPage(
  
  titlePanel(title = h4("Distributions", align = "centre")), 
  sidebarLayout(
    sidebarPanel(
      selectInput("Dataset", "1. Select the Dataset you want to display", 
                  choices = list("mtcars", "iris", "faithful")), 
      br(),
      
      radioButtons("Plot_Type", "2. Select the Plot type", 
                   choices = list("xy-plot", "histogram")),
      br(),
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