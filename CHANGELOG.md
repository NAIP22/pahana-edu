# 📄 Changelog

All notable changes to this project are documented here.

## [v1.0.0] - 2025-07-27

### ✨ Features

#### 🧾 Bill Management
- Implemented full **CRUD operations** for bills.
- Enabled **bill creation** with dynamic selection of customers and items.
- Automatically **calculates total amount** based on quantity × unit price.
- Updates **item stock quantity** upon bill submission.
- Added **bill edit functionality**.
- Displays **customer names and item details** in the bill list.
- View **print-friendly version** of each bill.
- Integrated **customer billing history**.

#### 👤 Customer Management
- Added **CRUD operations** for customers.
- Linked customers to their respective bills.
- Included **account number + name** display in selection dropdown.
- Accessible **customer billing history** from UI.

#### 📦 Item Management
- Developed **CRUD functionality** for items.
- Maintains `unit_price` and `stock_quantity`.
- Automatically updates stock when items are billed.
- Displays items with name and unit price in dropdown.

#### 🔐 User Management
- Created `User` model.
- Placeholder for login and authentication.
- Prepared for role-based access (admin/staff).

---

### ✅ Testing

#### JUnit Tests Completed for All Modules
- `ItemServiceTest.java`
- `BillServiceTest.java`
- `CustomerServiceTest.java`
- `UserServiceTest.java`  
  Each test covers:
- Add
- Update
- Delete
- Retrieve by ID
- Retrieve all

---

### 💻 UI/UX Enhancements

- Responsive **JSP forms** for all modules.
- Real-time **total calculation** in bill creation.
- Dynamic **add/remove item rows** in billing form.
- Clear display of **item name**, **quantity**, and **unit price** in bill listing.
- Added **"Back to Dashboard"** buttons and consistent navigation.
- All forms include validation and user-friendly prompts.

---

### 📘 Help & Documentation

- `help.jsp`: step-by-step guidance for using each module.
- Markdown-based `README.md` and `CHANGELOG.md` included in repo.
- GitHub Pull Request with implementation summary and review instructions.

---

## 🧭 Next Planned Features

- 📄 PDF bill generation
- 📧 Email notifications to customers
- 📊 Billing analytics dashboard
- 🔐 User roles and authentication (Admin, Staff)


