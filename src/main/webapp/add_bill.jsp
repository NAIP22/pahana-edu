<%@ page import="java.util.*, com.icbt.model.Item, com.icbt.model.Customer" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
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
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .line-item {
            display: flex;
            gap: 10px;
            align-items: center;
            margin-bottom: 10px;
        }

        .line-item select,
        .line-item input {
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

        .remove-btn {
            background-color: #dc3545;
            padding: 6px 10px;
            font-size: 14px;
        }

        .remove-btn:hover {
            background-color: #c82333;
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

        #total-container {
            text-align: right;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>

    <script>
        function calculateTotal() {
            let total = 0;
            const lines = document.querySelectorAll(".line-item");

            lines.forEach(line => {
                const select = line.querySelector("select");
                const quantityInput = line.querySelector("input[name='quantities[]']");
                const unitPriceInput = line.querySelector("input[name='unitPrices[]']");

                const selectedOption = select.options[select.selectedIndex];
                const unitPrice = parseFloat(selectedOption.getAttribute("data-price")) || 0;
                const quantity = parseInt(quantityInput.value) || 0;

                const lineTotal = unitPrice * quantity;
                total += lineTotal;

                unitPriceInput.value = unitPrice;
            });

            document.getElementById("totalAmount").innerText = total.toFixed(2);
        }

        function attachEvents() {
            const selects = document.querySelectorAll(".line-item select");
            const qtyInputs = document.querySelectorAll(".line-item input[type='number']");

            selects.forEach(select => select.onchange = calculateTotal);
            qtyInputs.forEach(input => input.oninput = calculateTotal);
        }

        function removeItem(button) {
            const container = document.getElementById("item-container");
            const line = button.closest(".line-item");

            if (container.children.length > 1) {
                container.removeChild(line);
                calculateTotal();
            } else {
                alert("At least one item is required.");
            }
        }

        function addItem() {
            const container = document.getElementById("item-container");
            const firstLine = container.firstElementChild;
            const clone = firstLine.cloneNode(true);

            // Reset select and input values
            const selects = clone.getElementsByTagName("select");
            const inputs = clone.getElementsByTagName("input");

            if (selects.length) selects[0].selectedIndex = 0;

            if (inputs.length) {
                for (let input of inputs) {
                    if (input.type === "number") input.value = 1;
                    if (input.type === "hidden") input.value = 0;
                }
            }

            // Remove any previous remove buttons, then add a new one
            const existingRemove = clone.querySelector("button.remove-btn");
            if (existingRemove) existingRemove.remove();

            const removeBtn = document.createElement("button");
            removeBtn.type = "button";
            removeBtn.className = "remove-btn";
            removeBtn.innerText = "Remove";
            removeBtn.onclick = () => removeItem(removeBtn);

            clone.appendChild(removeBtn);

            container.appendChild(clone);
            attachEvents();
            calculateTotal();
        }

        window.onload = () => {
            attachEvents();
            calculateTotal();
        };
    </script>
</head>

<body>
<div class="container">
    <h2>Create New Bill</h2>
    <form action="bill" method="post">
        <label for="customerId">Select Customer:</label>
        <select name="customerId" required>
            <option value="">-- Select --</option>
            <% for (Customer c : customers) { %>
            <option value="<%= c.getId() %>"><%= c.getAccountNumber() %> - <%= c.getName() %></option>
            <% } %>
        </select>

        <h3>Bill Items</h3>
        <div id="item-container">
            <div class="line-item">
                <select name="itemIds[]" required>
                    <option value="">-- Select Item --</option>
                    <% for (Item item : items) { %>
                    <option value="<%= item.getId() %>" data-price="<%= item.getUnitPrice() %>">
                        <%= item.getName() %> (Rs. <%= item.getUnitPrice() %>)
                    </option>
                    <% } %>
                </select>
                <input type="number" name="quantities[]" placeholder="Qty" min="1" value="1" required />
                <input type="hidden" name="unitPrices[]" value="0" />
            </div>
        </div>

        <button type="button" class="btn add-btn" onclick="addItem()">+ Add Item</button>

        <div id="total-container">
            Total: Rs. <span id="totalAmount">0.00</span>
        </div>

        <br/>
        <button type="submit" class="btn">Submit Bill</button>
    </form>

    <div class="back">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
