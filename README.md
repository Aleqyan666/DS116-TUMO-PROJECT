# Data-Driven Insights into Student Behavior and Performance at TUMO

This project presents a **learning analytics framework** to explore student behavior, performance, and engagement at the [TUMO Center for Creative Technologies](https://tumo.org/). By integrating and analyzing multiple sources of student data, we aim to uncover meaningful patterns that can support evidence-based decisions to improve student outcomes.

## Project Objective

To evaluate and visualize **how TUMO students engage with workshops**, how their performance varies across different groups, and what behavioral patterns can be detected through data analysis. Our work focuses on identifying:

- Performance trends by **age** and **gender**
- Changes in **course popularity** and **withdrawal/failure rates** over time
- How **attendance** and **course participation** cluster students into different engagement profiles
- Whether **interests vary by location**, and what factors influence **longer engagement**

## Team Members

- Gor Harutunyan
- Rita Chamiyan
- Hayk Grigoryan
- Hayk Alekyan
- Aram Barkhudaryan

## Data Sources

Data is based on internal reports from TUMO’s Yerevan Center, including:

- [`Students Performance`](./Data/TUMO%20Yerevan_Students%20Performance_Table%20-%20Sheet1.csv)
- [`Students List`](./Data/TUMO%20Yerevan%20Center%20Report_Students%20List_Table%20-%20Sheet1.csv)
- [`Workshop Outcomes`](./Data/TUMO%20Yerevan%20Center%20Report_Who%20Passed%20What_Table%20-%20Sheet1.csv)
- [`Workshop Attendance`](./Data/TUMO%20Armenia%20Center%20Report_Workshops%20Statistics_Table.csv)

Each dataset captures important aspects such as student age, gender, attendance ratios, completed/incomplete/withdrawn courses, and workshop start/end dates.

## Analytical Sections

The analysis is structured across five main modules:

### 1. Student Demographics & Foundations
Explores the **age** and **classification** (student types) distributions. This section asks:
> Who are the TUMO students?

Includes bar charts and histograms of:
- Age groups
- Enrollment classification types

---

### 2. Historical & Temporal Trends
Focuses on **how student behaviors change over time**.

Key tasks:
- Monthly and seasonal **course popularity**
- **Failure and withdrawal trends**

Visualizations:
- Time series plots
- Stacked bars by date
- Line graphs with seasonal overlays

---

### 3. Behavioral Analysis by Gender & Age
Analyzes how **different demographic groups** engage with TUMO courses.

Key questions:
- Do boys and girls take different courses?
- Who fails more? Who attends more regularly?

Includes:
- Faceted bar plots for enrollments by gender
- Failure rate comparisons across age groups
- Presence ratio distribution (boxplots and jitter)

---

### 4. Performance Trends & Insights
Compares **learning outcomes** across subgroups.

Includes:
- Success, failure, and withdrawal ratios per age/gender group
- Cross-tabulations and plots to summarize key disparities

---

### 5. Student Segmentation & Clustering
Identifies distinct **student profiles** based on behavior.

Clustering is done using:
- Attendance ratios
- Number of workshops completed, failed, withdrawn
- Total number of started modules

Methods:
- PCA
- k-means clustering
- Radar charts / silhouette plots

---

## Additional Hypotheses Explored

- **Do interests vary by location?**
  > Cities like Yerevan and Gyumri may prefer different topics (e.g., Animation vs Robotics)

- **What keeps students engaged longer?**
  > Starting topic, entry age, or city may affect workshop completion and attendance

These hypotheses were investigated with:
- Diverging bar plots (topic preference deviation by center)
- Violin/box plots (engagement length by topic)
- Heatmaps (topic popularity across regions)

---

## Technologies Used

- **R, RStudio**
- **RMarkdown** (reporting)
- **Shiny** (interactive dashboard)
- Core packages: `ggplot2`, `dplyr`, `tidyr`, `patchwork`, `cluster`, `factoextra`, `corrplot`, `scales`

---

## Reproducing the Project

To run the project:

1. Clone the repo:
```bash
git clone https://github.com/Aleqyan666/DS116-TUMO-PROJECT.git
```
2. Run `Shiny/app.R` file. OR
3. Visit the shinyapps.io Dashboard [here](https://aleqyan666.shinyapps.io/TUMO_Dashbaord_final/)
