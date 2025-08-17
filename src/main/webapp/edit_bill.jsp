<%@ page import="java.util.*, com.icbt.model.Bill, com.icbt.model.BillItem, com.icbt.model.Item, com.icbt.model.Customer" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BillItem> billItems = (List<BillItem>) request.getAttribute("billItems");
    List<Item> allItems = (List<Item>) request.getAttribute("items");
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");

    if (bill == null) {
        response.sendRedirect("bill");
        return;
    }

    Map<Integer, BillItem> itemMap = new HashMap<>();
    for (BillItem bi : billItems) {
        itemMap.put(bi.getItemId(), bi);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Bill</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0f2f5, #ffffff);
            margin: 0;
            padding: 40px 0;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            color: #444;
        }

        select, input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }

        select:focus, input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .section-title {
            margin-top: 25px;
            font-size: 18px;
            font-weight: 600;
            border-bottom: 2px solid #eee;
            padding-bottom: 5px;
            color: #2c3e50;
        }

        .line-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f9fafc;
            padding: 12px 15px;
            border-radius: 8px;
            margin-bottom: 10px;
            transition: background 0.3s ease;
        }

        .line-item:hover {
            background: #e6f0ff;
        }

        .item-name {
            font-size: 15px;
            font-weight: 500;
            color: #333;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: transform 0.2s ease, opacity 0.2s ease;
        }

        .btn i {
            font-size: 14px;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .back {
            margin-top: 20px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #007bff;
            font-weight: 600;
            transition: transform 0.2s ease;
        }

        .back a:hover {
            text-decoration: underline;
            transform: translateY(-2px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-file-invoice"></i> Edit Bill - #<%= bill.getId() %></h2>
    <form action="bill?action=update" method="post">
        <input type="hidden" name="billId" value="<%= bill.getId() %>">

        <label for="customerId">Select Customer</label>
        <select name="customerId" id="customerId" required>
            <option value="">-- Select Customer --</option>
            <%
                for (Customer c : customers) {
                    String selected = c.getId() == bill.getCustomerId() ? "selected" : "";
            %>
            <option value="<%= c.getId() %>" <%= selected %>>
                <%= c.getName() %>
            </option>
            <% } %>
        </select>

        <div class="section-title"><i class="fas fa-boxes"></i> Bill Items</div>
        <%
            for (Item item : allItems) {
                BillItem existing = itemMap.get(item.getId());
                int qty = existing != null ? existing.getQuantity() : 0;
                double price = existing != null ? existing.getUnitPrice() : item.getUnitPrice();
        %>
        <div class="line-item">
            <div class="item-name"><%= item.getName() %> - Rs. <%= item.getUnitPrice() %></div>
            <div>
                <input type="hidden" name="itemIds[]" value="<%= item.getId() %>">
                <input type="number" name="quantities[]" placeholder="Qty" min="0" value="<%= qty %>">
                <input type="hidden" name="unitPrices[]" value="<%= price %>">
            </div>
        </div>
        <% } %>

        <div style="text-align:center; margin-top:20px;">
            <button type="submit" class="btn"><i class="fas fa-save"></i> Update Bill</button>
        </div>
    </form>

    <div class="back">
        <a href="bill"><i class="fas fa-arrow-left"></i> Back to Bill List</a>
    </div>
</div>
</body>
</html>
