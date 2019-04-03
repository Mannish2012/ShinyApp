# ShinyApp
This is the code for the Shiny App that I created for the Coursera course 'Developing Data Products'

About the App

This app is multifunctional. It takes 3 inbuilt datasets (iris, mtcars, eruptions)
and displays the data in various forms, depening on user input. 

Various shiny capabilities are demonstrated by this app, which are: 

- Dropdown menu
- Radio Buttons
- Slider
- Tabset

More about the App:

Dropdown menu: The user is given the choice of datasets for which data will be displayed or 
  manipulated. He/she can choose either iris, mtcars or eruptions
- Radio Buttons: Once the user has chosen the dataset, he/she can display aspects of the data either in     xy-plot form or histogram form. If xy-plot is selected, a plot of the first columns vs the second column   of the corresponding dataset is chosen. If histogram is chosen, only frequency of first column is         displayed. An abline corresponding to the mean of the x-axis is displayed for each
- Slider: If, and only if, histogram is chosen, the user is asked to specify the number of bins
- Tabset: The user can use the tabset to get what aspect of the data he/she wants -- summary, structure,
  the entire data, or the plot. If plot is chosen, the user is again directed to the choices faced in the   radio buttons section

Further details

- App availability

 --  SHINY SERVER 
     The App is available on shiny server. Please visit the following site to see the app in action            https://manishgyawali.shinyapps.io/final_coursera_project/

 --  RPUBS: The App is also available on RPubs, together with the entire code. Please visit the following
     RPubs page to see the full code and use the App
     http://127.0.0.1:6504/Coursera_Shiny_Project_Final.Rmd
 
 --  GITHUB: The code is available on GitHub. Please visit the following GitHub site for the code
     https://github.com/Mannish2012/ShinyApp
