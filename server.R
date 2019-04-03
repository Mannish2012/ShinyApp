#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

server <- shinyServer(
  
  function(input,output,session){
    
    data_choice <- reactive({
      get(input$Dataset)
    })
    
    output$str <- renderPrint({
      str(data_choice())
    })   
    
    output$data <- renderTable({
      data_choice()
    }) 
    
    output$summarize <- renderPrint({
      summary(data_choice())
    }) 
    
    plot_choice <- reactive({
      get(input$Plot_Type)
    })
    
    
    plotInput <- reactive({
      switch(input$Plot_Type, 
             "xy-plot" = plot1(),
             "histogram" = plot2())
    })
    
    output$Selected_Plot <- renderPlot({
      plotInput()
    })
    
    plot1 <- reactive({
      plot(data_choice()[,c(1)], data_choice()[,c(2)],
           title(main = paste("The plot of", names(data_choice()[c(1)]), "vs", 
                              names(data_choice()[c(2)]) )),
           xlab = names(data_choice()[c(1)]),
           ylab = names(data_choice()[c(2)])
      )
      abline(v = mean(data_choice()[,c(1)]), col="red", lwd=3, lty=2)
      
    })
    
    plot2 <- reactive({
      hist(data_choice()[,c(1)],
           main = paste("Histo of", names(data_choice()[c(1)])),
           xlab = names(data_choice()[c(1)]), 
           breaks = input$bins)
      abline(v = mean(data_choice()[,c(1)]), col="red", lwd=3, lty=2)
      
    })
    
    
    
    
  }
  
)