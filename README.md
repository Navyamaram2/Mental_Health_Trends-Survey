# Mining the Mind: Mental Health in the Modern Workplace

## Overview

This project focuses on analyzing mental health trends in workplace environments using a **KDD (Knowledge Discovery in Databases)** framework. It integrates data warehousing, OLAP cube modeling, and machine learning classification to identify and predict mental health risk levels in employees based on behavioral, workplace, and demographic factors.

---

## 📁 Project Directory Structure
MultidimensionalProject27/
├── Fact Mental Health.dim # Dimension file for mental health measures
├── Mentalhealthtrends DB star.cube # Star schema cube definition
├── Mentalhealthtrends DB snow.dsv # Data Source View (Snowflake)
├── Mentalhealthtrends DB star1.partitions # Cube partitions file
├── Mentalhealthtrends DB snow1.ds # Data source definition (Snowflake)
├── Mentalhealthtrends DB star.ds # Data source for Star schema
├── MentalhealthtrendsDB.dwschema # Data warehouse schema file
├── MultidimensionalProject27.dwproj # Visual Studio project file for SSAS
├── MultidimensionalProject27.database # Metadata file for SSAS database
└── ... # Additional cube/DSV/DS files
---

## 📌 KDD-Based Workplace Mental Health Analysis

### 🧠 Problem Statement

To detect early signs of **mental health risk** in employees using data mining, OLAP analysis, and multidimensional modeling.

> Predict burnout, stress, anxiety levels using workplace-related survey data.

---

### 🔧 Tools & Technologies Used

- SQL Server Management Studio (SSMS)
- SQL Server Analysis Services (SSAS)
- SQL Server Data Tools (SSDT)
- Visual Studio (OLAP Cube Modeling)
- MDX Query Language
- Orange Data Mining Tool
- Microsoft Excel (for OLAP result visualization)

---

### 🔄 KDD Methodology

#### 1. Data Collection
- Workplace-related surveys with attributes like:
  - Work hours, burnout level, anxiety, salary satisfaction
  - Lifestyle factors: sleep, exercise, substance use

#### 2. Preprocessing
- Handled missing values (mean/mode)
- Encoded categorical values
- Normalized and cleaned data
- Performed feature selection and dimensionality reduction

#### 3. OLAP Schema Construction
- **Star Schema**: Direct fact-dimension linkage
- **Snowflake Schema**: Normalized dimensions
- **Fact Constellation Schema**: Multiple fact tables (Fact_Work, Fact_Mental_Health)

#### 4. Cube Modeling & OLAP
- Created and deployed cubes in Visual Studio
- Dimensions: Employee, Health, Job, Location, Job Details
- Measures: Anxiety Level, Stress Level, Salary Satisfaction

#### 5. OLAP Queries (MDX)
- **ROLL-UP**: Avg anxiety per country
- **SLICE**: Anxiety by gender and substance use
- **DICE**: Salary satisfaction by workload/state
- **DRILL DOWN**: City-wise anxiety patterns
- **PIVOT**: Job role-wise anxiety variation by state

#### 6. Data Mining
- Models: Decision Tree, Random Forest, SVM, SGD
- Evaluation Metrics:
  - Accuracy, F1-Score, Precision, Recall, ROC AUC
- Best Model: **Decision Tree** (97.7% for Moderate Burnout)

#### 7. Visualization
- Tree viewer in Orange Tool
- Bar charts, scatter plots
- Pythagorean forest for Random Forest model

---

### ✅ Key Insights

- Remote female workers showed higher stress levels
- India had the highest average anxiety
- Low exercise + high workload = more burnout
- OLAP helped visualize city/state/job-specific patterns

---


