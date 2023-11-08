# SQL-x-Digital-Health

## Digital Health SQL Showcase

This repository showcases SQL skills with a focus on digital health databases and data analytics. The SQL scripts provided herein demonstrate proficiency in database design, data manipulation, complex querying, and optimization techniques in the context of health data.

## Contents

- `database/`: Contains scripts to set up a sample digital health database, including table creation and data insertion.
- `analysis/`: Includes SQL scripts for data analysis within the health domain and a Jupyter Notebook for visualizing this data.
- `optimization/`: Showcases SQL scripts that have been optimized for performance in a health data context.

## Getting Started

To use these scripts, you will need access to an SQL server where you can create databases and execute queries. The scripts are written in a way that should be compatible with most relational database management systems (RDBMS), but examples are given in MySQL syntax.

### Setting Up the Database

1. Run the `create_database.sql` script to set up the database schema.
2. Execute the `insert_data.sql` script to populate the database with sample data.

### Running Analysis

1. Use the `data_analysis.sql` to perform various analytical operations on the health data.
2. Open the `data_visualization.ipynb` in Jupyter to see visualizations of the data.

### Query Optimization

Review the `query_optimization.sql` script to see examples of SQL queries that have been optimized for better performance.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

#Explanation of the Queries:
Query 1 retrieves a list of all patients along with their upcoming appointments, including the name and specialty of the physician they will be seeing.
Query 2 finds out how many appointments each physician has in the next 7 days, which is useful for scheduling and workload management.
Query 3 generates a list of patients who have not had any appointments in the last year, which can help identify patients who may need follow-up.
Query 4 counts the number of treatments per type, giving an overview of the most common treatments provided.
Query 5 identifies patients who have received a specific treatment and how often, which is useful for tracking treatment efficacy and follow-up care.
