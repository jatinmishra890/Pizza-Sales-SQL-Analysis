# 🍕 Pizza Sales SQL Analysis

> SQL Data Analytics Project using MySQL

## 📌 Project Overview


This project analyzes pizza sales data using MySQL.
The analysis uses multiple related CSV datasets to answer business questions related to orders, revenue, pizza prices, sizes, categories, quantities, and sales performance.
The project contains 13 SQL analysis questions covering basic to intermediate SQL concepts.

---

## 🎯 Project Objective

The main objective of this project is to use SQL to analyze pizza sales data and extract meaningful information from the dataset.

The analysis focuses on:

- 📦 Order volume
- 💰 Revenue generation
- 🍕 Pizza sales
- 📏 Pizza size preferences
- 🗂️ Category-wise sales
- ⏰ Order patterns by hour
- 📈 Revenue performance
- 🏆 Top-performing pizza types

---

## 🛠️ Tools & Technologies
| Tool | Purpose |
|---|---|
| **MySQL** | Data analysis and SQL queries |
| **SQL** | Data querying and analysis |
| **CSV** | Source datasets |
| **GitHub** | Project version control and portfolio |

---

## 📂 Dataset
The project contains four related datasets:

- [`orders.csv`](Data/orders.csv) – Order date and time information
- [`order_details.csv`](Data/order_details.csv) – Order details and pizza quantities
- [`pizzas.csv`](Data/pizzas.csv) – Pizza size and price information
- [`pizza_types.csv`](Data/pizza_types.csv) – Pizza names, categories, and ingredients

## 🔍 SQL Analysis

The project answers questions such as:

1. What is the total number of orders?
2. What is the total revenue generated?
3. Which pizza has the highest price?
4. What is the most common pizza size ordered?
5. What are the top 5 most ordered pizza types?
6. What is the total quantity ordered by pizza category?
7. How are orders distributed by hour?
8. What is the distribution of pizzas by category?
9. What is the average number of pizzas ordered per day?
10. What are the top 3 pizza types based on revenue?
11. What is the revenue contribution of each category?
12. How does cumulative revenue change over time?
13. What are the top 3 pizza types by revenue within each category?

## 🧠 SQL Concepts Used

- SELECT
- WHERE
- COUNT()
- SUM()
- AVG()
- ROUND()
- GROUP BY
- ORDER BY
- LIMIT
- INNER JOIN
- Subqueries
- Aggregate Functions
- Window Functions
- RANK()
- PARTITION BY

## 📸  Some SQL Analysis Results

### 1. SQL Queries

The project contains multiple SQL queries covering order analysis, revenue analysis, pizza pricing, and pizza size analysis.

![SQL Queries](Screenshots/Screenshot%202026-09-16%20213731.png)


### 2. Cumulative Revenue Analysis

Analyzed the cumulative revenue generated over time using SQL window functions.

![Cumulative Revenue Analysis](Screenshots/Screenshot%202026-09-16%20213932.png))


### 3. Top Pizza Types by Revenue

Identified the top 3 pizza types by revenue within each pizza category using the `RANK()` window function.

![Top Pizza Types by Revenue](Screenshots/Screenshot%202026-09-16%20213952.png)


### 🔗 Dataset Relationships
orders
   │
   │ order_id
   ↓
order_details
   │
   │ pizza_id
   ↓
pizzas
   │
   │ pizza_type_id
   ↓
pizza_types

---
## Author

Jatin Mohan Mishra

---
## License
This project is licensed under the MIT Lisence.
