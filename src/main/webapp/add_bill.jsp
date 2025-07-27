<%@ page import="java.util.*, com.icbt.model.Item, com.icbt.model.Customer" %>
<%
    // In production, fetch from DB and set in request via servlet
    List<Item> items = (List<Item>) request.getAttribute("items");

    List<Customer> customers  = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Bill</title>
    <style>
        body {
            font-family: Arial;
            background: #f7f7f7;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }

        h2, h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        select, input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .line-item {
            display: flex;
            gap: 10px;
            align-items: center;
            margin-bottom: 10px;
        }

        .line-item select, .line-item input {
            flex: 1;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .add-btn {
            background-color: #28a745;
        }

        .add-btn:hover {
            background-color: #218838;
        }

        .back {
            margin-top: 20px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #555;
        }

        .back a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<script>
    function addItem() {
        const container = document.getElementById("item-container");
        const firstLine = container.firstElementChild;
        const clone = firstLine.cloneNode(true);

        // Clear selected values
        const selects = clone.getElementsByTagName("select");
        const inputs = clone.getElementsByTagName("input");

        if (selects.length) selects[0].selectedIndex = 0;
        if (inputs.length) inputs[0].value = 1;

        container.appendChild(clone);
        attachEvents(); // Reattach events to new fields
    }

    function calculateTotal() {
        let total = 0;
        const lines = document.querySelectorAll(".line-item");

        lines.forEach(line => {
            const select = line.querySelector("select");
            const quantityInput = line.querySelector("input[name='quantity[]']");
            const unitPriceInput = line.querySelector("input[name='unitPrice[]']");

            const selectedOption = select.options[select.selectedIndex];
            const unitPrice = parseFloat(selectedOption.getAttribute("data-price")) || 0;
            const quantity = parseInt(quantityInput.value) || 0;

            const lineTotal = unitPrice * quantity;
            total += lineTotal;

            // update hidden unit price field
            unitPriceInput.value = unitPrice;
        });

        document.getElementById("totalAmount").innerText = total.toFixed(2);
    }

    function attachEvents() {
        const selects = document.querySelectorAll(".line-item select");
        const qtyInputs = document.querySelectorAll(".line-item input[type='number']");

        selects.forEach(select => {
            select.onchange = calculateTotal;
        });

        qtyInputs.forEach(input => {
            input.oninput = calculateTotal;
        });
    }

    // Initial binding
    attachEvents();
</script>

<body>
<div class="container">
    <h2>Create New Bill</h2>
    <form action="bill" method="post">
        <!-- Inside your <form> tag, just after the item input blocks -->
        <div id="total-container" style="text-align:right; font-weight: bold; margin-top: 20px;">
            Total: Rs. <span id="totalAmount">0.00</span>
        </div>

        <label for="customerId">Select Customer:</label>
        <select name="customerId" required>
            <option value="">-- Select --</option>
            <% for (Customer c : customers) { %>
            <option value="<%= c.getId() %>">
                <%= c.getAccountNumber() %> - <%= c.getName() %>
            </option>
            <% } %>
        </select>

        <h3>Bill Items</h3>
        <div id="item-container">
            <div class="line-item">
                <select name="itemId[]" required>
                    <option value="">-- Select Item --</option>
                    <% for (Item item : items) { %>
                    <option value="<%= item.getId() %>" data-price="<%= item.getUnitPrice() %>">
                        <%= item.getName() %> (Rs. <%= item.getUnitPrice() %>)
                    </option>
                    <% } %>
                </select>
                <input type="number" name="quantity[]" placeholder="Qty" min="1" value="1" required />

                <input type="hidden" name="unitPrice[]" value="0" />

            </div>
        </div>

        <button type="button" class="btn add-btn" onclick="addItem()">+ Add Item</button>
        <br/>
        <button type="submit" class="btn">Submit Bill</button>
    </form>

    <div class="back">
        <a href="dashboard.jsp">← Back to Dashboard</a>
    </div>
</div>

<script>
    function addItem() {
        const container = document.getElementById("item-container");
        const firstLine = container.firstElementChild;
        const clone = firstLine.cloneNode(true);

        // Reset values
        const selects = clone.getElementsByTagName("select");
        const inputs = clone.getElementsByTagName("input");

        if (selects.length) selects[0].selectedIndex = 0;
        if (inputs.length) {
            for (let input of inputs) {
                if (input.type === "number") input.value = 1;
                if (input.type === "hidden") input.value = 0;
            }
        }

        container.appendChild(clone);
        attachEvents(); // Re-bind events on new fields
    }

</script>

<script>
    window.onload = attachEvents;
</script>

</body>
</html>
