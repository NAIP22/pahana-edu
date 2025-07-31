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
            font-family: Arial;
            background: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        select, input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .line-item {
            margin-bottom: 20px;
        }

        .btn {
            background-color: #ffc107;
            color: #333;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
        }

        .btn:hover {
            background-color: #e0a800;
        }

        .back {
            margin-top: 20px;
        }

        .back a {
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Bill - #<%= bill.getId() %></h2>
    <form action="bill?action=update" method="post">
        <input type="hidden" name="billId" value="<%= bill.getId() %>">

        <label>Customer:</label>
        <select name="customerId" required>
            <%
                for (Customer c : customers) {
                    String selected = c.getId() == bill.getCustomerId() ? "selected" : "";
            %>
            <option value="<%= c.getId() %>" <%= selected %>><%= c.getName() %></option>
            <%
                }
            %>
        </select>

        <h3>Items</h3>
        <%
            for (Item item : allItems) {
                BillItem existing = itemMap.get(item.getId());
                int qty = existing != null ? existing.getQuantity() : 0;
                double price = existing != null ? existing.getUnitPrice() : item.getUnitPrice();
        %>
        <div class="line-item">
            <label><%= item.getName() %> - Rs. <%= item.getUnitPrice() %></label>
            <input type="hidden" name="itemIds[]" value="<%= item.getId() %>">
            <input type="number" name="quantities[]" placeholder="Qty" min="0" value="<%= qty %>">
            <input type="hidden" name="unitPrices[]" value="<%= price %>">
        </div>
        <%
            }
        %>

        <button type="submit" class="btn">Update Bill</button>
    </form>

    <div class="back">
        <a href="bill">← Back to Bill List</a>
    </div>
</div>
</body>
</html>
