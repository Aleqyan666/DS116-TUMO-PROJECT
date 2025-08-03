# Project Metadata: TUMO Student Datasets

This document provides metadata descriptions for the 4 datasets used in the project related to student engagement and performance at TUMO.

------------------------------------------------------------------------

## Dataset 1: Workshop Participation - ***TUMO Armenia Center Report_Workshops Statistics_Table.csv***

| Column Name | Description |
|--------------------|----------------------------------------------------|
| `TumoID` | Unique identifier for each student |
| `Gender` | Gender of the student |
| `AgeTillStartDate` | Age of the student at the time of the workshop's start |
| `StudentSchedule` | The day and time the student attends TUMO |
| `Year` | Year of workshop participation |
| `Month` | Month of participation |
| `Skill` | One of the skills in which the workshop was held |
| `TitleABC` | Name/title of the workshop |
| `StartDate` | Start date of the workshop |
| `EndDate` | End date of the workshop |
| `PassStatus` | Final status of the student (`Complete`, `Incomplete`, `Withdrawn`, `Participated`) |
| `Star` | Boolean (`TRUE` / `FALSE`) – if student performed exceptionally well |
| `WithdrawDate` | Date the student withdrew from the workshop (if applicable) |

------------------------------------------------------------------------

## Dataset 2: Student Selections - ***TUMO Yerevan Center Report_Who Passed What_Table - Sheet1.csv***

| Column Name | Description |
|-------------------|-----------------------------------------------------|
| `TumoID` | Unique identifier for each student |
| `UserStatus` | Current user status (`Active`, `Freeze`, `Preclosed`, `Suspend`) |
| `Age` | Student's age |
| `Session` | Current session info |
| `AllSelection` | List of 4 selected skill areas chosen for deep learning |
| `Selection_1` | Selected skill area 1 (order doesn't matter) |
| `Selection_2` | Selected skill area 2 |
| `Selection_3` | Selected skill area 3 |
| `Selection_4` | Selected skill area 4 |

------------------------------------------------------------------------

## Dataset 3: Attendance & Retention - ***TUMO Yerevan Center Report_Students List_Table - Sheet1.csv***

| Column Name | Description |
|--------------------|----------------------------------------------------|
| `TumoID` | Unique identifier for each student |
| `BirthDate` | Date of birth |
| `Classification` | Student classification (`T`, `U`, `M`, `O`) based on number of courses completed |
| `Status` | Attendance status (`Active`, `Freeze`, `Preclosed`, `Suspend`) |
| `StudentSchedule` | Student's class schedule |
| `AttendingSince` | Date when the student started attending TUMO |
| `RetentionByMonths` | Number of months the student has attended |
| `RetentionGrouped` | Grouped retention categories based on months attended |
| `Age` | Current age |
| `Present` | Number of classes attended |
| `PresenceRatio` | Attendance ratio (%) – e.g., attended 80 out of 100 classes → `80%` |

------------------------------------------------------------------------

## Dataset 4: Learning Progress - ***TUMO Yerevan_Students Performance_Table - Sheet1.csv***

| Column Name | Description |
|---------------------|---------------------------------------------------|
| `TumoID` | Unique identifier for each student |
| `Age` | Age of the student |
| `Classification` | Classification based on completed courses |
| `Schedule` | Student's class schedule |
| `Status` | Attendance status (`Active`, `Freeze`, `Preclosed`, `Suspend`) |
| `RetentionGrouped` | Grouped retention value |
| `Awarded` | Number of exercises completed successfully |
| `Rejected` | Number of exercises completed incorrectly |
| `Completed` | Number of completed self-learning courses |
| `Incomplete` | Number of self-learning courses not completed |
| `Participated` | Number of courses attended without completion |
| `Withdrawn` | Number of courses dropped before finishing |
| `LearningLabs Completed` | Number of learning labs (workshops) completed |
| `AttendingSince` | Date of first attendance at TUMO |

------------------------------------------------------------------------
