library(shiny)

server <- shinyServer(
  
  function(input,output,session){
    
    #get dataset from user
    data_choice <- reactive({
      get(input$Dataset)
    })
    #outputs for structure of dataset chosen
    output$str <- renderPrint({
      str(data_choice())
    })   
    #outputs for entire data chosen
    output$data <- renderTable({
      data_choice()
    }) 
    #outputs for summary of data chosen
    output$summarize <- renderPrint({
      summary(data_choice())
    }) 
    #plot choice for plot type (xy plot, histogram chosen by user)
    plot_choice <- reactive({
      get(input$Plot_Type)
    })
    
    #switch plottype based on user input
    plotInput <- reactive({
      switch(input$Plot_Type, 
             "xy-plot" = plot1(),
             "histogram" = plot2())
    })
    #output for plot that is selected
    output$Selected_Plot <- renderPlot({
      plotInput()
    })
    
    #xy plot if user so chooses it
    # x axis is first column of dataset chosen
    # y axis is second column of dataset chosen
    # title, x axis, y axis labels, abline provided
    plot1 <- reactive({
      plot(data_choice()[,c(1)], data_choice()[,c(2)],
           title(main = paste("The plot of", names(data_choice()[c(1)]), "vs", 
                              names(data_choice()[c(2)]) )),
           xlab = names(data_choice()[c(1)]),
           ylab = names(data_choice()[c(2)])
      )
      abline(v = mean(data_choice()[,c(1)]), col="red", lwd=3, lty=2)
      
    })
    
    #histogram is user so chooses it
    #x axis is first column of dataset chosen, y axis is frequency
    # title, x axis labels, abline provided
    plot2 <- reactive({
      hist(data_choice()[,c(1)],
           main = paste("Histo of", names(data_choice()[c(1)])),
           xlab = names(data_choice()[c(1)]), 
           breaks = input$bins)
      abline(v = mean(data_choice()[,c(1)]), col="red", lwd=3, lty=2)
      
    })
    
    
    
    
  }
  
)
