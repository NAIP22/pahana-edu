# 📄 Changelog

All notable changes to this project are documented here.

## [v1.4.2] - 2025-08-17

### ✨ Features

#### 🧾 Bill Management
- Added **bill summary view** before final submission.
- Enabled **PDF generation** of bills for printing and sharing.
- Improved **error handling** during bill creation and editing.
- Minor **UI enhancements** in bill forms.
- Added **navigation back buttons** for easier workflow.

#### 👤 Customer Management
- Implemented **search by account number** functionality.
- Enhanced **error handling** for customer creation and updates.
- Minor **UI fixes** to prevent customer addition issues.
- Added **navigation back buttons** in customer forms.

#### 📦 Item Management
- Minor **UI improvements** in item forms.
- Fixed small bugs in stock quantity updates.

#### 🔐 User Management
- Improved **error messages** for login and placeholder actions.
- Minor **UI adjustments** in user management pages.

---

### 🐞 Bug Fixes & Minor Changes
- Fixed **customer not adding** issue in certain cases.
- Corrected small UI inconsistencies across modules.
- Added **back navigation buttons** in multiple forms for better UX.

---

### ✅ Testing
- Updated **JUnit tests** to cover new customer search and error handling scenarios.
- Retested all CRUD operations to ensure stability.

---

### 💻 UI/UX Enhancements
- Consistent **navigation and form validation** across modules.
- Improved **real-time feedback** and error messages in forms.
- Minor **styling fixes** for bill and customer pages.

---

### 🧭 Next Planned Features
- 📧 Email notifications to customers
- 📊 Billing analytics dashboard
- 🔐 Complete user roles and authentication (Admin, Staff)

---

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


