# 🧾 Java Servlet-based Billing & Inventory Management System

A complete Java Web Application using **Servlets**, **JSP**, and **JDBC** to manage:

- 👥 Customers
- 📦 Items (Inventory)
- 🧾 Billing
- 🔐 Users

Ideal for small to mid-scale businesses to streamline billing and inventory operations.

---

## 🚀 Features

### 👤 Customer Management
- Add, edit, delete, and list customers.
- View individual billing history.

### 📦 Item Management
- Add items with unit price and stock quantity.
- Update and delete item records.
- Auto-decrease stock quantity upon billing.

### 🧾 Billing System
- Create bills by selecting customer and multiple items.
- Auto-calculate total bill based on quantity and price.
- View, update, delete bills.
- Display bill summary with all item details.
- Printable bill layout available.

### 🔐 User Module
- Add and manage application users.
- Admin/staff management (role-based access - future enhancement).

### 🧪 JUnit Testing
Unit tests implemented for:
- `CustomerServiceTest`
- `ItemServiceTest`
- `BillServiceTest`
- `UserServiceTest`

---

## 🧰 Tech Stack

| Layer     | Technology |
|-----------|----------|
| Frontend  | HTML, CSS, JSP |
| Backend   | Java Servlets |
| Database  | MySQL / MariaDB |
| DB Access | JDBC     |
| Server    | Apache Tomcat 9+ |
| Testing   | JUnit 5  |
| IDE       | IntelliJ |

---
```
📁 Project Structure
├── src/
│ └── com/icbt/
│ ├── controller/
│ │ ├── BillServlet.java
│ │ ├── CustomerServlet.java
│ │ ├── ItemServlet.java
│ │ └── UserServlet.java
│ │
│ ├── dao/
│ │ ├── BillDAO.java
│ │ ├── BillItemDAO.java
│ │ ├── CustomerDAO.java
│ │ ├── ItemDAO.java
│ │ └── UserDAO.java
│ │
│ ├── model/
│ │ ├── Bill.java
│ │ ├── BillItem.java
│ │ ├── Customer.java
│ │ ├── Item.java
│ │ └── User.java
│ │
│ ├── service/
│ │ ├── BillService.java
│ │ ├── BillItemService.java
│ │ ├── CustomerService.java
│ │ ├── ItemService.java
│ │ └── UserService.java
│ │
│ └── util/
│ └── DBConnection.java
│
├── web/ # JSP Views
│ ├── add_bill.jsp
│ ├── add_customer.jsp
│ ├── add_item.jsp
│ ├── dashboard.jsp
│ ├── edit_bill.jsp
│ ├── edit_customer.jsp
│ ├── edit_item.jsp
│ ├── help_section.jsp
│ ├── index.jsp
│ ├── list_bill.jsp
│ ├── list_customer.jsp
│ ├── list_item.jsp
│ ├── login.jsp
│ ├── print_bill.jsp
│ └── styles.jsp
│
├── test/ # JUnit tests
│ └── com/icbt/service/
│ ├── BillServiceTest.java
│ ├── CustomerServiceTest.java
│ ├── ItemServiceTest.java
│ └── UserServiceTest.java
│
├── lib/
│ └── mysql-connector-java-x.x.xx.jar
│
├── web.xml
├── README.md
├── CHANGELOG.md
└── .gitignore
```
## 📥 How to Import the Database into `pahana_edu`

Follow these steps to import the SQL file into your existing MySQL database `pahana_edu` using **phpMyAdmin**:



## 🔧 Prerequisites

- MySQL and phpMyAdmin are installed and running locally.
- Your database `pahana_edu` is already created.
- You have the `.sql` file (e.g., `pahana_edu.sql`) exported from your project.

---

## 🚀 Import Steps

1. Open your browser and go to:


2. In the phpMyAdmin interface for `pahana_edu`, click on the **Import** tab from the top menu.

3. Click **Choose File**, and select your SQL file (e.g., `pahana_edu.sql`) from your local computer.

4. Ensure the **Format** is set to `SQL`.

5. Click **Go** at the bottom of the page.

---

## ✅ After Import

- All tables (`users`, `customers`, `items`, `bills`, `bill_items`, etc.) will be created automatically.
- You can now manage your data through the web application.
- Make sure your application’s `DBConnection.java` points to:

```java
private static final String URL = "jdbc:mysql://localhost:3306/pahana_edu";
private static final String USER = "root";
private static final String PASSWORD = ""; // or your local MySQL password
```
## ⚙️ Installation Guide

### 📋 Prerequisites
- Java JDK 11 or higher
- Apache Tomcat 9+
- MySQL or MariaDB
- IDE (IntelliJ IDEA / Eclipse)
- (Optional) Maven or Gradle

---
##🖥️ Deploy & Run

## 🔧 Setup Instructions

1. **Import the Project** into your preferred IDE (e.g., IntelliJ IDEA, Eclipse).
2. **Configure Apache Tomcat** as your server.
3. **Deploy the Project** to Tomcat.
4. **Start the Server** and access the application at:http://localhost:8080/pahana_edu_web/
## 🧪 Run Unit Tests

Run these test classes:

- `CustomerServiceTest`
- `ItemServiceTest`
- `BillServiceTest`
- `UserServiceTest`

> ✅ These tests use `@BeforeAll`, `@Order`, and `@DisplayName` annotations to organize and document each case clearly.
## 📘 Help Section

- Navigate to [`help.jsp`](help.jsp).
- Learn how to:
  - Use each module (Customers, Items, Billing, Users).
  - Understand each button and its function.
  - Troubleshoot common issues.

---

# 📝 Changelog

Check [`CHANGELOG.md`](CHANGELOG.md) for a complete history of updates and features.

---

# 👤 Developer
  
GitHub: [github.com/NAIP22](https://github.com/NAIP22/pahana-edu)

## 📥 Clone the Repository
```bash
git clone https://github.com/NAIP22/pahana-edu

