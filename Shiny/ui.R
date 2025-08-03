libs<-c("shiny", "shinydashboard")
load_libraries<-function(libs){
  new_libs <- libs[!(libs %in% installed.packages()[,"Package"])]
  if(length(new_libs)>0) {install.packages(new_libs)}
  lapply(libs, library, character.only = TRUE)
}
load_libraries(libs)

ui <- dashboardPage(
  dashboardHeader(title = "TUMO Student"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Demographics & Foundations", tabName = "student_demographics", icon = icon("book")),
      menuItem("Dynamics & Learning Patterns", tabName = "student_dynamics", icon = icon("chart-bar")),
      menuItem("Demographics, Attendance, and Course Outcomes", tabName = "attendance_outcomes", icon = icon("project-diagram")),
      menuItem("Engagement and Performance Segmentation", tabName = "engagement_performance", icon = icon("chart-area")) 
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$style(HTML("
      .main-header .navbar {
        width: 100% !important;
        left: 0 !important;
      }
      .main-sidebar {
        width: 300px;
      }
      .content-wrapper, .right-side {
        margin-left: 300px;
      }
      .sidebar-menu > li > a {
        white-space: normal !important;
        height: auto !important;
      }
    "))
    ),
    tabItems(
      tabItem(tabName = "student_demographics",
              tags$iframe(src = "Student_Demographics_and_Foundations.html", width = "100%", height = "800px", frameborder = 0)
      ),
      tabItem(tabName = "student_dynamics",
              tags$iframe(src = "Student_Dynamics_and_Learning_Patterns.html", width = "100%", height = "800px", frameborder = 0)
      ),
      tabItem(tabName = "attendance_outcomes",
              tags$iframe(src = "Student_Demographics_Attendance_and_Course_Outcomes.html", width = "100%", height = "800px", frameborder = 0)
      ),
      tabItem(tabName = "engagement_performance",
              tags$iframe(src = "Student_Engagement_and_Performance_Segmentation.html", width = "100%", height = "800px", frameborder = 0)
      )
    )
  )
)

server <- function(input, output) {
    
}

shinyApp(ui, server)
