library(shiny)

ui <- navbarPage("TUMO EDA Dashboard",
                 
                 tabPanel("Introduction",
                          fluidPage(
                            h2("Introduction"),
                            p("This tab will show your Introduction content.")
                          )
                 ),
                 
                 tabPanel("Exploration",
                          fluidPage(
                            h2("Exploratory Data Analysis"),
                            p("This tab will show your EDA visualizations and summaries.")
                          )
                 ),
                 
                 tabPanel("Clustering",
                          fluidPage(
                            h2("Clustering Analysis"),
                            p("This tab will show your clustering results and plots.")
                          )
                 ),
                 
                 tabPanel("Conclusion",
                          fluidPage(
                            h2("Conclusion"),
                            p("This tab will show your final insights and recommendations.")
                          )
                 )
)
