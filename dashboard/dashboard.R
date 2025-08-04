libs<-c("shinydashboard", "ggplot2")
load_libraries<-function(libs){
  new_libs <- libs[!(libs %in% installed.packages()[,"Package"])]
  if(length(new_libs)>0) {install.packages(new_libs)}
  lapply(libs, library, character.only = TRUE)
}
load_libraries(libs)

ui <- dashboardPage(
  dashboardHeader(title ="This is my dashboard"),
  dashboardSidebar(sliderInput(inputId = "mu",
                               label = "Mean for distribution:",
                               min = 1,max = 100, value = 50),
                   sliderInput(inputId = "sd",
                               label = "Standard deviation for distribution:",
                               min = 5,max = 50, value = 40),
                   numericInput(inputId="sample", 
                                label = "Sample size",
                                min=100, max=10000, value=1000)),
  dashboardBody(plotOutput("histogram"))
)

server <- function(input, output){
  output$histogram <- renderPlot({
    rn <- rnorm(n=input$sample, mean=input$mu, sd=input$sd)
    ggplot()+geom_histogram(aes(x=rn), bins=50)
  })
}

shinyApp(ui, server)
