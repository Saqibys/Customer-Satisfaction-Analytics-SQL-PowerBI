# 📊 Customer Satisfaction Analytics – SQL & Power BI

*Analyzing customer support performance, satisfaction levels, call trends, and customer sentiment using SQL and Power BI to generate actionable business insights.*

---

## 📌 Table of Contents

- [Overview](#overview)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Key Performance Indicators](#key-performance-indicators)
- [Business Questions & Key Findings](#business-questions--key-findings)
- [Dashboard](#dashboard)
- [Key Insights](#key-insights)
- [Final Recommendations](#final-recommendations)
- [How to Run This Project](#how-to-run-this-project)
- [Author](#author)

---

## Overview

The Customer Satisfaction Analytics project focuses on evaluating customer support operations and understanding customer experiences through call center data.

The project uses SQL for data exploration and validation, followed by Power BI for interactive dashboard development and business intelligence reporting.

The objective is to identify customer sentiment patterns, monitor call center performance, analyze customer satisfaction, and evaluate service-level agreement (SLA) performance.

---

## Business Problem

Customer support teams handle thousands of customer interactions, making it important to monitor service quality and customer satisfaction.

This project aims to answer key business questions:

- How satisfied are customers with the support experience?
- What is the distribution of positive, neutral, and negative customer sentiment?
- Which states generate the highest number of customer calls?
- What are the most common reasons customers contact support?
- How effectively are calls handled within SLA targets?
- How does call volume change over different days?
- How do different channels and call centers contribute to customer support operations?

---

## Dataset

The project uses a customer support call center dataset containing **32,942 customer call records**.

The dataset includes the following attributes:

- Customer information
- Customer sentiment
- CSAT score
- Call timestamp and call date
- Call reason
- State and city
- Communication channel
- Response time and SLA status
- Call duration
- Call center information

The dataset was analyzed to understand customer satisfaction, sentiment distribution, call center efficiency, and support performance.

---

## Tools & Technologies

- **MySQL Workbench:** Data exploration, validation, cleaning, and SQL-based business analysis.
- **SQL:** Filtering, aggregation, grouping, data validation, and answering business questions.
- **Power BI:** Interactive dashboards, KPI cards, data visualization, and business reporting.
- **Power Query:** Data transformation, date cleaning, and data type validation.
- **DAX:** KPI calculations and dashboard measures.
- **Microsoft PowerPoint:** Project presentation and findings.

---

## Project Structure

```text
Customer-Satisfaction-Analytics-SQL-PowerBI/
│
├── Dashboard Image/
│   └── Dashboard screenshot.png
│
├── Dashboard/
│   └── CSAT_Dashboard.pbix
│
├── Project_Insights/
│   └── Project_Insights.docx
│
├── SQl_Queries/
│   └── CSAT_Queries.sql
│
├── PRDA_02_CSAT_Analytics_pptx.pptx
│
├── .gitignore
│
└── README.md
```

---

## Data Cleaning & Preparation

Data validation and preparation were performed before dashboard development.

Key activities included:

- Imported the original dataset into MySQL Workbench.
- Checked the dataset for missing values and data inconsistencies.
- Validated the total number of records.
- Examined the date formats in the `call_timestamp` column.
- Identified multiple date formats, including slash-separated and hyphen-separated dates.
- Standardized the date values using SQL date conversion functions.
- Created a cleaned date field named `call_date`.
- Validated the cleaned date values before importing the data into Power BI.
- Used Power Query to verify column data types and check for errors.
- Created a clean reporting dataset while preserving the original source table.

---

## Exploratory Data Analysis

SQL-based analysis was performed to understand different aspects of customer support operations.

The analysis covered:

- Total call volume and call distribution.
- Customer sentiment and satisfaction scores.
- Daily call trends.
- Call reasons and contact categories.
- State-wise call distribution.
- Call duration and response-time analysis.
- SLA performance.
- Call center and communication channel analysis.

These analyses helped identify patterns in customer interactions and service performance.

---

## Key Performance Indicators (KPIs)

The Power BI dashboard includes the following KPIs:

| KPI | Result |
|---|---:|
| Total Calls | 32.941K |
| Average CSAT Score | 2.07 |
| CSAT Satisfaction | 29% |
| Positive sentiment | 11.92% |

These indicators provide a high-level overview of customer satisfaction and call center performance.

---

## Business Questions & Key Findings

### 1. Customer Sentiment Analysis

Analyzed customer sentiment distribution across five categories:

- Negative
- Neutral
- Very Negative
- Positive
- Very Positive

**Finding:** Negative and neutral sentiment represent a substantial share of customer interactions, highlighting opportunities to improve customer support experiences.

### 2. SLA Performance Analysis

Evaluated calls based on their response-time status.

- Within SLA
- Below SLA
- Above SLA

**Finding:** Approximately 62.61% of calls were recorded as within SLA, indicating scope for improving service-level performance.

### 3. Daily Call Trends

Analyzed the distribution of calls across individual dates.

**Finding:** Daily call trends help identify changes in customer support demand and periods with relatively higher call volumes.

### 4. State-wise Call Analysis

Compared customer call volumes across different states.

**Finding:** Geographic analysis helps identify regions generating higher customer support demand.

### 5. Contact Reason Analysis

Analyzed the major reasons customers contacted the support team.

The dashboard highlights categories such as:

- Billing Question
- Payments
- Service Outage

**Finding:** Billing-related questions account for the largest share among the displayed contact reasons.

### 6. Call Center and Channel Analysis

Used interactive filters to explore call performance across different communication channels and call centers.

**Finding:** These filters allow users to investigate customer support patterns across different operational segments.

---

## Dashboard

The Power BI dashboard provides an interactive overview of customer satisfaction and call center performance.

### Dashboard Preview

**Add your Power BI dashboard screenshot below:**

<img width="1381" height="732" alt="Dashboard screenshot" src="https://github.com/user-attachments/assets/120d0bd4-4ae0-4a34-82d5-8bd54692e62e" />



### Dashboard Features

- KPI cards displaying total calls, average call duration, average CSAT, positive sentiment, and SLA performance.
- Daily call trends visualization.
- State-wise call distribution map.
- Customer sentiment distribution using a donut chart.
- SLA status analysis using a horizontal bar chart.
- Contact reason analysis using a column chart.
- Interactive slicers for channel and call center.
- Dashboard filters for interactive data exploration.

---

## Final Recommendations

Based on the analysis, the following actions could help improve customer support performance:

- **Improve Customer Satisfaction:** Investigate negative customer sentiment and identify recurring service issues.
- **Improve SLA Performance:** Review calls outside the SLA target and identify opportunities to improve response handling.
- **Optimize Billing Support:** Analyze recurring billing-related questions and improve customer self-service resources.
- **Monitor Call Trends:** Use daily call patterns to support staffing and workload planning.
- **Evaluate Regional Performance:** Investigate states with higher call volumes to identify location-specific support requirements.
- **Monitor Call Centers:** Compare performance across call centers and communication channels to identify improvement opportunities.

---

## How to Run This Project

### 1. Clone the Repository

Open your terminal or command prompt and execute:

```bash
git clone https://github.com/Saqibys/Customer-Satisfaction-Analytics-SQL-PowerBI.git
```

### 2. Open the Project

Navigate to the project directory:

```bash
cd Customer-Satisfaction-Analytics-SQL-PowerBI
```

### 3. Explore SQL Queries

- Open the `SQl_Queries` folder.
- Review and execute the SQL queries using MySQL Workbench.
- Connect to your MySQL database containing the CSAT dataset.

### 4. Open the Power BI Dashboard

- Navigate to the `Dashboard` folder.
- Open the `.pbix` file using Power BI Desktop.
- If required, configure the data source connection to your local dataset.

### 5. Review Project Insights

- Open the `Project_Insights` folder.
- Review the documented business findings and analysis.

### 6. View the Project Presentation

Open `PRDA_02_CSAT_Analytics_pptx.pptx` to review the project methodology, analysis, and conclusions.

---

## Author

**Saqib**  
Aspiring Data Analyst

Email : mohammedsaqibys@gmail.com
