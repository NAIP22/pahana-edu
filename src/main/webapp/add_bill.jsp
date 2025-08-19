<%@ page import="java.util.*, com.icbt.model.Item, com.icbt.model.Customer" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Bill</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background: #ffffff;
            margin: 40px auto;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
            animation: fadeIn 0.8s ease-in-out;
        }

        h2, h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
            display: block;
        }

        select, input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        select:focus, input[type="number"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 6px rgba(0,123,255,0.3);
            outline: none;
        }

        .line-item {
            display: flex;
            gap: 12px;
            align-items: center;
            margin-bottom: 15px;
        }

        .line-item select,
        .line-item input {
            flex: 1;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .add-btn {
            background-color: #28a745;
            margin-top: 10px;
        }

        .add-btn:hover {
            background-color: #218838;
        }

        .remove-btn {
            background-color: #dc3545;
            color: #fff;
            padding: 8px 14px;
            font-size: 14px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .remove-btn:hover {
            background-color: #c82333;
        }

        #total-container {
            text-align: right;
            font-weight: bold;
            margin-top: 25px;
            font-size: 18px;
            color: #2c3e50;
        }

        .back {
            margin-top: 30px;
            text-align: center;
        }

        .back a {
            text-decoration: none;
            color: #007bff;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .back a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
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
    <h2><i class="fas fa-file-invoice-dollar"></i> Create New Bill</h2>
    <form action="bill" method="post">
        <label for="customerId"><i class="fas fa-user"></i> Select Customer:</label>
        <select name="customerId" required>
            <option value="">-- Select --</option>
            <% for (Customer c : customers) { %>
            <option value="<%= c.getId() %>"><%= c.getAccountNumber() %> - <%= c.getName() %></option>
            <% } %>
        </select>

        <h3><i class="fas fa-boxes"></i> Bill Items</h3>
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

        <button type="button" class="btn add-btn" onclick="addItem()"><i class="fas fa-plus-circle"></i> Add Item</button>

        <div id="total-container">
            Total: Rs. <span id="totalAmount">0.00</span>
        </div>

        <br/>
        <button type="submit" class="btn"><i class="fas fa-check-circle"></i> Submit Bill</button>
    </form>

    <div class="back">
        <a href="dashboard"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>
</div>
</body>
</html>
