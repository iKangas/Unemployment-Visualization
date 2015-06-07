library(shiny)
shinyUI(fluidPage(theme = "bootstrap2.css",
#     tags$head(
#         tags$style(HTML("
#                         @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
#                         
#                         h1 {
#                         font-family: 'Lobster', cursive;
#                         font-weight: 500;
#                         line-height: 1.1;
#                         color: #4d3a7d;
#                         }
#                         "))
#         ),
    headerPanel("Unemployment Rate"),
    sidebarLayout(position = "right",
        sidebarPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel("Description",
                                 h5('This visualization highlights how unemployment rate rockets up in Greece after 2008! The visualization can be shown through a bubble chart, a bar chart or a line chart. Please choose accordingly on the top right of the plot.'),
                                 h5('For more emphasis choose to size based on "Rate" instead of "same size", and check Greece, or/and any other country, from the drop down list of countries.'),
                                 h5('There is also an option to choose different variable on the x-axis, such as Time, and on the y-axis, as well as their scale, i.e. linear or log. Finally, tick the trail option on the lower right if you wish to see the trail of the chosen countries throughout the visualization.')
                                 ),        
                        tabPanel("License",
                                 h5('Data Source:',a("Reference Link", href="https://data.oecd.org/unemp/unemployment-rate.htm")),
                                     h5('Bootstrap "Darkly" theme:',a("Reference Link", href="http://bootswatch.com/darkly/")),                                     
                                 HTML('<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">Unemployment Visualization</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.'),
                                 br()
                        ) 
            )),
        mainPanel(
            htmlOutput("view")
            , width = 7
    ))
        ))