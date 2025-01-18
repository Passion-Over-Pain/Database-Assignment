# Database Design and Implementation Assignment

## Table of Contents
1. [Introduction](#introduction)
2. [Objective](#objective)
3. [Scenario Overview](#scenario-overview)
4. [Tasks and Requirements](#tasks-and-requirements)
   - [Task 1: Physical ERD](#task-1-physical-erd)
   - [Task 2: SQL Script for Database and Tables](#task-2-sql-script-for-database-and-tables)
   - [Task 3: SQL Queries](#task-3-sql-queries)
   - [Task 4: Stored Procedures](#task-4-stored-procedures)
   - [Task 5: Triggers](#task-5-triggers)
5. [Conclusion](#conclusion)

---

## Introduction
This assignment focused on designing and implementing a relational database for a fictional bookstore, "Koreanders." The project required the creation of a database schema, the implementation of SQL queries, stored procedures, and triggers to meet the store’s operational needs while maintaining data integrity and automation. The project was conducted in a team of 3 members.

## Objective
The purpose of this assignment was to:
- Demonstrate the ability to design and implement database tables.
- Write and optimize complex SQL queries.
- Create stored procedures for automating specific tasks.
- Define triggers to enforce data consistency and integrity.

## Scenario Overview
Koreanders, a small bookstore, sought a database system to manage books, authors, publishers, sales, and inventory. Their requirements included:
- Storing details of books, authors, publishers, and sales.
- Automating inventory replenishment when stock levels fell below reorder levels.
- Supporting face-to-face sales and tracking sales data.
- Generating sales-related insights for reporting purposes.

### Core Entities
1. **Books**: ISBN, title, price, quantity on hand, and reorder level.
2. **Authors**: Name, surname, and country of origin.
3. **Publishers**: Name, email, and country.
4. **Sales**: Sales totals, sale lines (each for one or more books).
5. **Book Orders**: Triggered when stock is below reorder level, with a status indicating receipt.

---

## Tasks and Requirements

### Task 1: Physical ERD
A physical Entity-Relationship Diagram (ERD) was produced to model the relationships between entities based on the scenario requirements. The ERD included:
- Relationships such as one-to-many for books to authors and sales to sale lines.
- Attributes with proper data types for each entity.
- Primary and foreign key constraints.

### Task 2: SQL Script for Database and Tables
The SQL script addressed the following:
1. Created the database if it did not exist.
2. Dropped existing tables in the correct sequence to avoid dependency conflicts.
3. Created tables with:
   - Primary keys.
   - Foreign keys to enforce relationships.
   - Appropriate data types for each attribute.

**Key Requirements:**
- Data types were chosen to balance storage efficiency and precision (e.g., `VARCHAR` for text, `DECIMAL` for monetary values).
- Constraints included `NOT NULL` and `CHECK` where applicable.

---

### Task 3: SQL Queries
SQL scripts were written to address the following operations:

| **Query** | **Description** |
|-----------|-----------------|
| 1         | Retrieve titles and publishers of books written by authors with the surname "Tolkien". |
| 2         | List all book titles, the number sold, and the total value of sales for each book. |
| 3         | Identify books that have not appeared in any sales. |
| 4         | Display all countries and the number of authors from each, showing `0` for countries without authors. |

---

### Task 4: Stored Procedures
Stored procedures automated common tasks:
1. **Insert Publisher**: Added new publisher details into the database.
   - Script saved as `insert_publisher.sql`.
2. **Insert Sale**: Created a new sale entry and a sale line for a book.
   - Script saved as `insert_sale.sql`.
3. **Receive Book Order**: Updated the `received` status of a book order.
   - Script saved as `receive_bookOrder.sql`.

---

### Task 5: Triggers
Triggers enforced data consistency:
1. **Update Sale Total**:
   - Automatically updated the `SaleTotal` in the sales table when a sale line was added.
   - Script saved as `update_sales_total.sql`.
2. **Update Book Quantity**:
   - Adjusted the `quantity_on_hand` field when a book order was marked as received.
   - Script saved as `update_BookQty.sql`.

---

## Conclusion
This assignment provided an opportunity to apply database design principles to a real-world scenario. By creating a functional schema, complex queries, stored procedures, and triggers, I ensured that Koreanders' requirements were met effectively. The final deliverables included a normalized database, optimized SQL scripts, and automated workflows that streamline operations and maintain data integrity.

