# 🍽️ Restaurant Sales Analysis - SQL Fundamentals

## 📊 Project Overview
A practical SQL analysis of restaurant sales data from the Maven Analytics Challenge. Using MySQL Workbench, I performed a complete business analysis using **fundamental SQL queries** to extract actionable insights for menu optimization and customer strategy.

---

## 🛠️ Technologies Used
- **Database:** MySQL
- **Tool:** MySQL Workbench 8.0
- **SQL Level:** Foundational to Intermediate
- **Techniques:** Basic Joins, Aggregate Functions, Subqueries, Filtering
- **Data:** Two-table relational structure (menu_items, order_details)

---

## 📁 Project Structure

### **Database Schema:**
```sql
menu_items
├── menu_item_id (INT) - Primary Key
├── item_name (VARCHAR)
├── category (VARCHAR) - Italian, American, Asian, Mexican
└── price (DECIMAL)

order_details
├── order_details_id (INT) - Primary Key
├── order_id (INT)
├── order_date (DATE)
├── order_time (TIME)
└── item_id (INT) - Foreign Key to menu_items
```
## 📁 Repo Structure
```text
restaurant-sales-sql/
├── 📄 restaurant_db.sql              # Database creation script
├── 📊 restaurant_orders_analysis.sql # 25+ practical SQL queries
├── 📋 database_dictionary.md         # Data documentation
└── README.md                         # This file
```
---

## 📬 Connect With Me

<p align="center">
  <!-- LinkedIn -->
  <a href="https://www.linkedin.com/in/mohamed-ayman-data/" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" />
  </a>
  <!-- GitHub -->
  <a href="https://github.com/mohamed-ayman-data" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" />
  </a>
  <!-- Email -->
  <a href="mailto:mohmedaymn2025@gmail.com" target="_blank">
    <img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email" />
  </a>
</p>

<p align="center">
  <i>Let's collaborate on data-driven solutions!</i>
</p>

<hr>
<p align="center">
  <sub>📊 Data Analyst | 📈 Business Intelligence | 🎯 SQL Expert</sub>
</p>
