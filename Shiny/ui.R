#libs <- c("shiny", "shinydashboard", "dplyr", "ggplot2", "readr", "tidyr", "stringr", "forcats", "lubridate", "broom", "janitor")

#load_libraries <- function(libs){
  #sapply(libs, function(pkg){
  #  if (!require(pkg, character.only = TRUE)) {
   #   stop(paste("Package not found:", pkg))  
  #  }
 # })
#}
#load_libraries(libs)

library("shiny")
library("shinydashboard")
library("dplyr")
library("ggplot2")
library("readr")
library("tidyr")
library("stringr")
library("forcats")
library("lubridate")
library("broom")
library("janitor")


ui <- dashboardPage(
  dashboardHeader(title = "TUMO Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem(" Home: Overview", tabName = "home", icon = icon("home")),
      menuItem(" Demographics & Foundations", tabName = "student_demographics", icon = icon("user-graduate")),
      menuItem(" Dynamics & Learning Patterns", tabName = "student_dynamics", icon = icon("chart-line")),
      menuItem(" Attendance & Course Outcomes", tabName = "attendance_outcomes", icon = icon("calendar-check")),
      menuItem(" Engagement & Performance", tabName = "engagement_performance", icon = icon("layer-group"))
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$style(HTML(
      "
            html, body, .wrapper, .content-wrapper {
        height: 100% !important;
        min-height: 100% !important;
      }
      .content {
        height: 100% !important;
      }}
      "))
  ),
  
    tabItems(
      tabItem(tabName = "home",  
              h1("Welcome to the TUMO Student Analytics Dashboard"),
              HTML("
        <h4><strong>📌 Purpose Statement</strong></h4>
        <p>This dashboard presents a comprehensive <em>learning analytics framework</em> designed to evaluate and visualize student behavior, engagement, and academic trajectories at the <strong>TUMO Center for Creative Technologies</strong>. By leveraging rich, multidimensional data—ranging from demographics to course completion patterns—this project delivers actionable insights to enhance student support and program quality.</p>
    
        <ul>
          <li> Identify performance trends across <strong>gender and age groups</strong></li>
          <li> Analyze <strong>temporal patterns</strong> in course popularity and dropout rates</li>
          <li> Understand engagement styles using <strong>clustering and segmentation</strong></li>
          <li> Inform data-driven decision-making to optimize educational delivery</li>
        </ul>
    
        <h4><strong> Dashboard Sections Overview</strong></h4>
        <ul>
          <li><strong> Demographics & Foundations:</strong> Explore foundational student attributes such as gender distribution, age patterns, and initial program classification.</li>
          <li><strong> Dynamics & Learning Patterns:</strong> Track how students navigate through various courses over time, examining module sequences and learning preferences.</li>
          <li><strong> Attendance & Course Outcomes:</strong> Analyze attendance behaviors, participation frequency, and completions to assess consistency and commitment.</li>
          <li><strong> Engagement & Performance:</strong> Dive into retention trends and performance metrics segmented by age, gender, and workshops.</li>
          <li><strong> Performance Trends & Insights:</strong> Discover high-level summaries and key drivers of success or early dropout.</li>
        </ul>
      ")

      ),
      
      tabItem(tabName = "student_demographics",
              h1("Demographics & Foundations"),
              h5("Visual analysis of student age, gender, and classification patterns."),
              
              h3("Student Classifcation & Age"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("classification_boxplot", height = "300px")),
              h3("Age Distribution"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("age_distribution", height = "300px"))
      ),
      
      tabItem(tabName = "student_dynamics",
              h1("Dynamics & Learning Patterns"),
              h5("Trends in skill popularity, withdrawals, and student participation over time."),
              
              h3("Workshop Enrollments"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("workshop_enrollments", height = "300px")),  
              
              h3("Skill Popularity"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("skill_popularity", height = "300px")),
              
              h3("Workshop Outcomes"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("course_outcomes_piechart", height = "300px"))
      ),
      
      tabItem(tabName = "attendance_outcomes",
              h1("Attendance & Course Outcomes"),
              h5("Insights into student attendance, engagement, and course outcomes by age and gender."),
              
              h3("Attendance & Gender"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("attendance_double_chart", height = "300px")),
              
              h3("Failure Rates"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("failure_rates_age_gender", height = "300px"))),
      
      # THEME 4 - Engagement & Performance
      tabItem(tabName = "engagement_performance",
              h1("Student Engagement & Performance"),
              h5("Analyzes student engagement and performance through attendance, task completion, and course outcomes. 
                 Identifies behavioral patterns and key factors associated with success, failure, and withdrawal using statistical and visual methods."),
              
              h3("Attendance & Perfromance"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("scatterplot_presence_ratio", height = "300px")),
              
              h3("Task Rating & Presence"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("corr_matrix_presence_taskrating", height = "300px")),

      
              h3("Linear Dependency and Monotonicty"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("linearity_monotonicty_test_double", height = "300px")),
      
              h3("Course Outcomes & Courses Taken"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("course_outcomes_bars_ratios", height = "300px")),
  
              h3("PCA: Behavior-Based Clustering"),
              tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
                       plotOutput("pca_analytics", height = "300px")),
              

      
      
      # THEME 5 — Performance Trends & Insights
      #tabItem(tabName = "performance_trends_insights",
          #    h1("Performance Trends & Insights"),
          #    h3("Preformance Trends"),
              #tags$div(style = "height: 350px; overflow-y: auto; padding-top: 20px;",
              #         plotOutput("part4", height = "300px")),
              
      )
    )
  )
)

server <- function(input, output) {
  # Demographics & Foundations
  
  
  
  output$age_distribution <- renderPlot({
    ws <- read.csv("Data/TUMO Armenia Center Report_Workshops Statistics_Table.csv",
                 stringsAsFactors=FALSE, na.strings=c("","NA")) %>%
    rename(Age=AgeTillStartDate) %>%
    mutate(TumoID=as.character(TumoID),
           Gender=factor(Gender),
           Age=as.numeric(Age))
  
  si <- read.csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv",
                 stringsAsFactors=FALSE, na.strings=c("","NA")) %>%
    mutate(TumoID=as.character(TumoID),
           Classification=ifelse(is.na(Classification),"null",Classification),
           Classification=factor(Classification,levels=c("null","T","U","M","O"))) %>%
    select(TumoID,Classification)
  
  demo <- ws %>%
    group_by(TumoID) %>%
    summarise(Gender=first(Gender),
              Age=round(median(Age,na.rm=TRUE)),
              .groups="drop") %>%
    left_join(si,by="TumoID") %>%
    filter(!is.na(Gender),!is.na(Age),!is.na(Classification))
    
    ggplot(demo, aes(x=Age)) +
      geom_histogram(binwidth=1, fill="#619CFF", color="white") +
      labs(title="Age Distribution of TUMO Students",
           x="Age (years)", y="Count") +
      theme_minimal()  
  }) 
  
  output$classification_boxplot <- renderPlot({
    
    ws <- read.csv("Data/TUMO Armenia Center Report_Workshops Statistics_Table.csv",
                   stringsAsFactors=FALSE, na.strings=c("","NA")) %>%
      rename(Age = AgeTillStartDate) %>%
      mutate(TumoID = as.character(TumoID),
             Gender = factor(Gender),
             Age = as.numeric(Age))
    
    si <- read.csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv",
                   stringsAsFactors=FALSE, na.strings=c("","NA")) %>%
      mutate(TumoID = as.character(TumoID),
             Classification = ifelse(is.na(Classification), "null", Classification),
             Classification = factor(Classification, levels = c("null", "T", "U", "M", "O"))) %>%
      select(TumoID, Classification)
    
    demo <- ws %>%
      group_by(TumoID) %>%
      summarise(Gender = first(Gender),
                Age = round(median(Age, na.rm = TRUE)),
                .groups = "drop") %>%
      left_join(si, by = "TumoID") %>%
      filter(!is.na(Gender), !is.na(Age), !is.na(Classification))
    
    ggplot(demo, aes(x = Classification, y = Age, fill = Classification)) +
      geom_boxplot(outlier.shape = 21, outlier.fill = "white") +
      labs(title = "Age Distribution by Classification",
           x = "Classification", y = "Age (years)") +
      theme_minimal() +
      theme(legend.position = "none")
  })
  
  # Dynamics and Learning Patterns
  output$workshop_enrollments <- renderPlot({
    perf <- read_csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    who <- read_csv("Data/TUMO Yerevan Center Report_Who Passed What_Table - Sheet1.csv")
    list_df <- read_csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv")
    workshops <- read_csv("Data/TUMO Armenia Center Report_Workshops Statistics_Table.csv")
    
    perf <- perf %>% mutate(TumoID = as.character(TumoID))
    who <- who %>% mutate(TumoID = as.character(TumoID))
    list_df <- list_df %>% mutate(TumoID = as.character(TumoID))
    workshops <- workshops %>% mutate(TumoID = as.character(TumoID))
    
    
    merged_df <- workshops %>%
      left_join(perf %>% distinct(TumoID, .keep_all = TRUE), by = "TumoID") %>%
      left_join(list_df %>% distinct(TumoID, .keep_all = TRUE), by = "TumoID")    
    
    merged_df %>%
      filter(!is.na(StartDate)) %>%
      mutate(
        StartDate = as.Date(StartDate, format = "%d-%b-%y"),
        MonthYear = format(StartDate, "%b %Y"),
        MonthYear = factor(MonthYear, levels = unique(format(sort(StartDate), "%b %Y")))
      ) %>%
      group_by(MonthYear) %>%
      summarise(TotalEnrollments = n(), .groups = "drop") %>%
      ggplot(aes(x = MonthYear, y = TotalEnrollments)) +
      geom_col(fill = "#41a987") +
      scale_y_continuous(
        breaks = seq(0, 6000, by = 1000),
        labels = scales::comma_format()
      ) +
      labs(
        title = "Total Workshop Enrollments per Month",
        x = "Month",
        y = "Total Enrollments"
      ) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  output$skill_popularity <- renderPlot({
    perf <- read_csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    who <- read_csv("Data/TUMO Yerevan Center Report_Who Passed What_Table - Sheet1.csv")
    list_df <- read_csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv")
    workshops <- read_csv("Data/TUMO Armenia Center Report_Workshops Statistics_Table.csv")
    
    perf <- perf %>% mutate(TumoID = as.character(TumoID))
    who <- who %>% mutate(TumoID = as.character(TumoID))
    list_df <- list_df %>% mutate(TumoID = as.character(TumoID))
    workshops <- workshops %>% mutate(TumoID = as.character(TumoID))
    
    
    merged_df <- workshops %>%
      left_join(perf %>% distinct(TumoID, .keep_all = TRUE), by = "TumoID") %>%
      left_join(list_df %>% distinct(TumoID, .keep_all = TRUE), by = "TumoID")    
    
      merged_df %>%
      filter(!is.na(StartDate), !is.na(Skill)) %>%
      mutate(
        StartDate = as.Date(StartDate, format = "%d-%b-%y"),
        MonthYear = format(StartDate, "%b %Y"),
        MonthYear = factor(MonthYear, levels = unique(format(sort(StartDate), "%b %Y")))
      ) %>%
      group_by(MonthYear, Skill) %>%
      summarise(Enrollments = n(), .groups = "drop") %>%
      ggplot(aes(x = MonthYear, y = Enrollments, color = Skill, group = Skill)) +
      geom_line(linewidth = 0.7) + 
      scale_y_continuous(
        breaks = seq(0, 900, by = 100),
        labels = scales::comma_format()
      ) +
      labs(
        title = "Skill Popularity Over Time",
        x = "Month",
        y = "Number of Enrollments per Skill"
      ) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(angle = 45, hjust = 1, size = 7),
        legend.position = "right",
        panel.grid.major = element_blank()
      )
  })
  
  output$course_outcomes_piechart <- renderPlot({
    perf <- read_csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    who <- read_csv("Data/TUMO Yerevan Center Report_Who Passed What_Table - Sheet1.csv")
    list_df <- read_csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv")
    workshops <- read_csv("Data/TUMO Armenia Center Report_Workshops Statistics_Table.csv")
    
    perf <- perf %>% mutate(TumoID = as.character(TumoID))
    who <- who %>% mutate(TumoID = as.character(TumoID))
    list_df <- list_df %>% mutate(TumoID = as.character(TumoID))
    workshops <- workshops %>% mutate(TumoID = as.character(TumoID))
    
    
    merged_df <- workshops %>%
      left_join(perf %>% distinct(TumoID, .keep_all = TRUE), by = "TumoID") %>%
      left_join(list_df %>% distinct(TumoID, .keep_all = TRUE), by = "TumoID")    
    
    merged_df %>%
      filter(!is.na(StartDate)) %>%
      mutate(
        StartDate = as.Date(StartDate, format = "%d-%b-%y"),
        MonthYear = format(StartDate, "%b %Y"),
        MonthYear = factor(MonthYear, levels = unique(format(sort(StartDate), "%b %Y")))
      ) %>%
      group_by(MonthYear) %>%
      summarise(TotalEnrollments = n(), .groups = "drop") %>%
      ggplot(aes(x = MonthYear, y = TotalEnrollments)) +
      geom_col(fill = "#41a987") +
      scale_y_continuous(
        breaks = seq(0, 6000, by = 1000),
        labels = scales::comma_format()
      ) +
      labs(
        title = "Total Workshop Enrollments per Month",
        x = "Month",
        y = "Total Enrollments"
      ) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    status_summary <- merged_df %>%
      filter(!is.na(PassStatus)) %>%
      mutate(
        OutcomeGroup = case_when(
          PassStatus == "Completed" ~ "Completed",
          PassStatus == "Participated" ~ "Participated",
          PassStatus == "Incomplete" ~ "Incomplete",
          TRUE ~ "Withdrawn"
        )
      ) %>%
      count(OutcomeGroup) %>%
      mutate(
        Percentage = round(100 * n / sum(n), 1),
        Label = paste0(OutcomeGroup, " (", Percentage, "%)")
      )
    
    status_summary <- status_summary %>%
      mutate(Label = paste0(Percentage, "%"))
    
    ggplot(status_summary, aes(x = "", y = n, fill = OutcomeGroup)) +
      geom_bar(stat = "identity", width = 1) +
      coord_polar(theta = "y") +
      geom_text(aes(label = Label), position = position_stack(vjust = 0.5), size = 3) +
      labs(
        title = "Student Outcomes in TUMO Workshops",
        x = NULL, y = NULL,
        fill = 'Outcome Type'
      ) +
      theme_minimal() +
      theme(
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank()
      )
  })
  
  output$attendance_double_chart <- renderPlot({
    list <- read_csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv")
    perf <- read_csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    work <- read_csv("Data/TUMO Armenia Center Report_Workshops Statistics_Table.csv")
    
    list <- list %>% mutate(TumoID = as.character(TumoID))
    perf <- perf %>% mutate(TumoID = as.character(TumoID))
    work <- work %>% mutate(TumoID = as.character(TumoID))
    
    gender_info <- work %>%
      select(TumoID, Gender) %>%
      distinct(TumoID, .keep_all = TRUE)
    
    main_df <- list %>%
      select(TumoID, Age, PresenceRatio) %>%
      left_join(gender_info, by = "TumoID") %>%
      left_join(perf %>% select(TumoID, Completed, Incomplete, Withdrawn, Participated), by = "TumoID") %>%
      mutate(
        PresenceRatio = str_replace_all(PresenceRatio, ",", "."),
        PresenceRatio = as.numeric(str_extract(PresenceRatio, "\\d+(\\.\\d+)?")) / 100
      ) %>%
      select(TumoID, Gender, Age, PresenceRatio, Completed, Incomplete, Withdrawn, Participated)
    
    box_plot <- main_df %>%
      filter(!is.na(Gender), !is.na(PresenceRatio), PresenceRatio <= 1) %>%
      mutate(Gender = case_when(
        str_to_lower(str_trim(Gender)) %in% c("male", "m") ~ "Male",
        str_to_lower(str_trim(Gender)) %in% c("female", "f") ~ "Female"
      )) %>%
      ggplot(aes(x = Gender, y = PresenceRatio, fill = Gender)) +
      geom_boxplot(alpha = 0.8, color = "black") +
      scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
      scale_fill_manual(values = c("Male" = "#1f77b4", "Female" = "#e15759")) +
      labs(title = "Attendance by Gender", x = "Gender", y = "Attendance (%)") +
      theme_minimal(base_size = 14) +
      theme(plot.title = element_text(face = "bold", hjust = 0.5), legend.position = "none")
    
    dot_plot <- main_df %>%
      filter(!is.na(Gender), !is.na(PresenceRatio), PresenceRatio <= 1) %>%
      mutate(Gender = case_when(
        str_to_lower(str_trim(Gender)) %in% c("male", "m") ~ "Male",
        str_to_lower(str_trim(Gender)) %in% c("female", "f") ~ "Female"
      )) %>%
      ggplot(aes(x = Gender, y = PresenceRatio, color = Gender)) +
      geom_jitter(width = 0.2, size = 1.5, alpha = 0.1) +
      scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
      scale_color_manual(values = c("Male" = "#1f77b4", "Female" = "#e15759")) +
      labs(title = "Individual Attendance Rates", x = "Gender", y = "Attendance (%)") +
      theme_minimal(base_size = 14) +
      theme(plot.title = element_text(face = "bold", hjust = 0.5), legend.position = "none")
    
    box_plot + dot_plot
  })
  
  output$failure_rates_age_gender <- renderPlot({
    list <- read_csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv")
    perf <- read_csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    work <- read_csv("Data/TUMO Armenia Center Report_Workshops Statistics_Table.csv")
    
    list <- list %>% mutate(TumoID = as.character(TumoID))
    perf <- perf %>% mutate(TumoID = as.character(TumoID))
    work <- work %>% mutate(TumoID = as.character(TumoID))
    
    gender_info <- work %>%
      select(TumoID, Gender) %>%
      distinct(TumoID, .keep_all = TRUE)
    
    main_df <- list %>%
      select(TumoID, Age, PresenceRatio) %>%
      left_join(gender_info, by = "TumoID") %>%
      left_join(perf %>% select(TumoID, Completed, Incomplete, Withdrawn, Participated), by = "TumoID") %>%
      mutate(
        PresenceRatio = str_replace_all(PresenceRatio, ",", "."),
        PresenceRatio = as.numeric(str_extract(PresenceRatio, "\\d+(\\.\\d+)?")) / 100
      ) %>%
      select(TumoID, Gender, Age, PresenceRatio, Completed, Incomplete, Withdrawn, Participated)
    
    failure_df <- main_df %>%
      filter(!is.na(Gender), !is.na(Age), !is.na(Participated), Participated > 0) %>%
      filter((Incomplete + Withdrawn) <= Participated) %>%
      mutate(failure_rate = (Incomplete + Withdrawn) / Participated) %>%
      group_by(Gender, Age) %>%
      summarise(mean_failure = mean(failure_rate, na.rm = TRUE), .groups = "drop")
    
    ggplot(failure_df, aes(x = Age, y = mean_failure, color = Gender)) +
      geom_line(size = 1.2) +
      geom_point(size = 2) +
      scale_y_continuous(labels = scales::percent_format(accuracy = 1), limits = c(0, 1)) +
      scale_color_manual(values = c("Male" = "#1f77b4", "Female" = "#e15759")) +
      labs(
        title = "Failure Rates by Age and Gender",
        x = "Age",
        y = "Average Failure Rate"
      ) +
      theme_minimal(base_size = 14) +
      theme(
        plot.title = element_text(face = "bold", hjust = 0.5),
        legend.title = element_blank()
      )
  })
  
  # Student Engagement & Perfromance
  output$scatterplot_presence_ratio <- renderPlot({
    student_performance <- read.csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    student_info <- read.csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv", colClasses = c("TumoID" = "character"))

    student_info$TumoID <- as.numeric(student_info$TumoID)
    options(scipen = 999) 

    student_performance$task_rating <- round(student_performance$Awarded / 
                                               (student_performance$Awarded + student_performance$Rejected), 2)
    student_performance$training_rating <- round(student_performance$Completed / 
                                                   (student_performance$Incomplete + student_performance$Participated +       
                                                      student_performance$Withdrawn + student_performance$Completed), 2)
    
    merged_df <- inner_join(student_info, student_performance, by = "TumoID")
    merged_df$PresenceRatio <- round(as.integer(merged_df$PresenceRatio) / 100, 2)
    
    ggplot(merged_df, aes(x = PresenceRatio, y = task_rating)) +
      geom_point(color = "steelblue", size = 2, alpha = 0.7) +                        # points
      geom_smooth(method = "lm", se = TRUE, color = "darkred", linewidth = 1) +       # trend line with CI
      labs(
        title = "Attendance vs Task Rating with Regression Trend Line",
        x = "Attendance Ratio",
        y = "Task Rating"
      ) +
      scale_x_continuous(breaks = seq(0, 1, 0.1)) +                                  # ticks every 0.1
      theme_minimal() +
      theme(
        plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
        axis.title = element_text(face = "bold", size = 12),
        axis.text = element_text(size = 10)
      )
  })
  
  output$corr_matrix_presence_taskrating <- renderPlot({
    student_performance <- read.csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    student_info <- read.csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv", colClasses = c("TumoID" = "character"))
    
    student_info$TumoID <- as.numeric(student_info$TumoID)
    options(scipen = 999) 
    
    student_performance$task_rating <- round(student_performance$Awarded / 
                                               (student_performance$Awarded + student_performance$Rejected), 2)
    student_performance$training_rating <- round(student_performance$Completed / 
                                                   (student_performance$Incomplete + student_performance$Participated +       
                                                      student_performance$Withdrawn + student_performance$Completed), 2)
    
    merged_df <- inner_join(student_info, student_performance, by = "TumoID")
    merged_df$PresenceRatio <- round(as.integer(merged_df$PresenceRatio) / 100, 2)
    
    pairs(merged_df[, c("PresenceRatio", "task_rating")],
          main = "Scatterplot Matrix")
  })
  
  output$linearity_monotonicty_test_double <- renderPlot({
    student_performance <- read.csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    student_info <- read.csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv", colClasses = c("TumoID" = "character"))

    student_info$TumoID <- as.numeric(student_info$TumoID)
    options(scipen = 999) 

    student_performance$task_rating <- round(student_performance$Awarded / 
                                               (student_performance$Awarded + student_performance$Rejected), 2)
    
    student_performance$training_rating <- round(student_performance$Completed / 
                                                   (student_performance$Incomplete + student_performance$Participated +       
                                                      student_performance$Withdrawn + student_performance$Completed), 2)

    merged_df <- inner_join(student_info, student_performance, by = "TumoID")

    merged_df$PresenceRatio <- round(as.integer(merged_df$PresenceRatio) / 100, 2)
    
    
    p1 <- ggplot(merged_df, aes(x = PresenceRatio, y = task_rating)) +
      geom_point(alpha = 0.6, color = "steelblue") +
      geom_smooth(method = "lm", se = TRUE, color = "darkred") +
      labs(title = "Pearson Correlation (Linear)",
           x = "Attendance Ratio",
           y = "Task Rating") +
      theme_minimal()
    
    # Spearman scatterplot with loess smooth (captures monotonic relationship)
    p2 <- ggplot(merged_df, aes(x = PresenceRatio, y = task_rating)) +
      geom_point(alpha = 0.6, color = "darkgreen") +
      geom_smooth(method = "loess", se = TRUE, color = "forestgreen") +
      labs(title = "Spearman Correlation (Monotonic)",
           x = "Attendance Ratio",
           y = "Task Rating") +
      theme_minimal()
    
    p1 + p2
  })
  
  output$course_outcomes_bars_ratios <- renderPlot({
    student_performance <- read.csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    student_info <- read.csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv", colClasses = c("TumoID" = "character"))
    
    student_info$TumoID <- as.numeric(student_info$TumoID)
    options(scipen = 999) 
    
    student_performance$task_rating <- round(student_performance$Awarded / 
                                               (student_performance$Awarded + student_performance$Rejected), 2)
    
    student_performance$training_rating <- round(student_performance$Completed / 
                                                   (student_performance$Incomplete + student_performance$Participated +       
                                                      student_performance$Withdrawn + student_performance$Completed), 2)
    
    merged_df <- inner_join(student_info, student_performance, by = "TumoID")
    
    merged_df$PresenceRatio <- round(as.integer(merged_df$PresenceRatio) / 100, 2)
    
    course_outcomes <- merged_df %>%
      mutate(total_courses = Completed + Incomplete + Participated + Withdrawn) %>%
      pivot_longer(
        cols = c(Completed, Incomplete, Participated, Withdrawn),
        names_to = "Outcome",
        values_to = "Count"
      )

        course_outcomes <- course_outcomes %>%
      mutate(total_bin = cut(total_courses, breaks = c(0, 2, 5, 10, Inf),
                             labels = c("1-2", "3-5", "6-10", "10+"), right = FALSE))
    
    ggplot(course_outcomes, aes(x = total_bin, y = Count, fill = Outcome)) +
      geom_bar(stat = "identity", position = "fill") +
      scale_y_continuous(labels = percent_format()) +
      labs(
        title = "Proportion of Course Outcomes by Number of Courses Started",
        x = "Total Number of Courses Started (Binned)",
        y = "Proportion of Outcomes",
        fill = "Outcome"
      ) +
      theme_minimal()
  })
  
  output$pca_analytics <- renderPlot({
    student_performance <- read.csv("Data/TUMO Yerevan_Students Performance_Table - Sheet1.csv")
    student_info <- read.csv("Data/TUMO Yerevan Center Report_Students List_Table - Sheet1.csv", colClasses = c("TumoID" = "character"))

    student_info$TumoID <- as.numeric(student_info$TumoID)
    options(scipen = 999) 

    student_performance$task_rating <- round(student_performance$Awarded / 
                                               (student_performance$Awarded + student_performance$Rejected), 2)
    
    student_performance$training_rating <- round(student_performance$Completed / 
                                                   (student_performance$Incomplete + student_performance$Participated +       
                                                      student_performance$Withdrawn + student_performance$Completed), 2)

    merged_df <- inner_join(student_info, student_performance, by = "TumoID")
    merged_df$PresenceRatio <- round(as.integer(merged_df$PresenceRatio) / 100, 2)
    
    merged_df$main_outcome_group <- case_when(
      merged_df$Withdrawn > 0 ~ "Withdrawn",
      merged_df$Completed > 0 ~ "Completed",
      merged_df$Rejected > 0 ~ "Failed",
      TRUE ~ "Other"
    )
    
    df_numeric <- merged_df %>%
      select(where(is.numeric)) %>%
      na.omit()
    
    groups <- merged_df %>%
      filter(complete.cases(select(., where(is.numeric)))) %>%
      pull(main_outcome_group)

    # We  prcomp() with centering and scaling to ensure equal weighting across features.

    pca_result <- prcomp(df_numeric, center = TRUE, scale. = TRUE)
    
    pca_df <- as.data.frame(pca_result$x)
    pca_df$Group <- groups
   
    ggplot(pca_df, aes(x = PC1, y = PC2, color = Group)) +
      geom_point(alpha = 0.6, size = 1.5) +
      labs(title = "PCA: First Two Principal Components",
           color = "Outcome Group") +
      theme_minimal() +
      theme(legend.position = "bottom")
    
  })
  
  
  
}

shinyApp(ui, server)
