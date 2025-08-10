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
    <title>Edit Bill</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, sans-serif;
            background-color: #f9fafc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #444;
        }

        select, input[type="number"] {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }

        select:focus, input[type="number"]:focus {
            border-color: #0766ff;
            outline: none;
        }

        .line-item {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 10px;
            align-items: center;
            padding: 12px;
            background-color: #f6f8fa;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .item-name {
            font-size: 15px;
            font-weight: 500;
        }

        .btn {
            background-color: #0766ff;
            color: #fff;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
            display: inline-block;
        }

        .btn:hover {
            background-color: #0556d4;
        }

        .back {
            margin-top: 20px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #0766ff;
            font-weight: 500;
        }

        .back a:hover {
            text-decoration: underline;
        }

        .section-title {
            margin-top: 25px;
            font-size: 18px;
            font-weight: 600;
            border-bottom: 2px solid #eee;
            padding-bottom: 5px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h2> Edit Bill - #<%= bill.getId() %></h2>
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

        <div class="section-title">Bill Items</div>
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

        <br>
        <button type="submit" class="btn"> Update Bill</button>
    </form>

    <div class="back">
        <a href="bill">Back to Bill List</a>
    </div>
</div>
</body>
</html>
