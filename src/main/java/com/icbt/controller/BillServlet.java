package com.icbt.controller;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import com.icbt.model.Customer;
import com.icbt.model.Item;
import com.icbt.service.BillService;
import com.icbt.service.CustomerService;
import com.icbt.service.ItemService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.swing.event.ListDataEvent;
import java.io.IOException;
import java.util.*;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    private BillService billService;
    private ItemService itemService;
    private CustomerService customerService;

    @Override
    public void init() {
        billService = new BillService();
        customerService = new CustomerService();
        itemService = new ItemService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            List<Bill> billList = billService.getAllBills();
            req.setAttribute("bills", billList);
            req.getRequestDispatcher("list_bill.jsp").forward(req, resp);
        }
        else  if (action.equals("create")) {
            List<Customer> customerList = customerService.getAllCustomers();
            List<Item> itemList = itemService.getAllItems();
            req.setAttribute("customers", customerList);
            req.setAttribute("items", itemList);
            req.getRequestDispatcher("add_bill.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8"); // Optional: good practice for forms

        try {
            String customerIdStr = req.getParameter("customerId");
            String[] itemIds = req.getParameterValues("itemId");
            String[] quantities = req.getParameterValues("quantity");
            String[] unitPrices = req.getParameterValues("unitPrice");

            if (itemIds == null || quantities == null || unitPrices == null) {
                throw new IllegalArgumentException("Missing form data.");
            }

            int customerId = Integer.parseInt(customerIdStr);
            List<BillItem> items = new ArrayList<>();
            double total = 0.0;

            for (int i = 0; i < itemIds.length; i++) {
                if (itemIds[i] == null || itemIds[i].isEmpty()) continue;
                if (quantities[i] == null || quantities[i].isEmpty()) continue;
                if (unitPrices[i] == null || unitPrices[i].isEmpty()) continue;

                int itemId = Integer.parseInt(itemIds[i]);
                int quantity = Integer.parseInt(quantities[i]);
                double unitPrice = Double.parseDouble(unitPrices[i]);

                if (quantity <= 0) continue;

                double lineTotal = unitPrice * quantity;

                BillItem item = new BillItem();
                item.setItemId(itemId);
                item.setQuantity(quantity);
                item.setUnitPrice(unitPrice);
                item.setTotalPrice(lineTotal);

                items.add(item);
                total += lineTotal;
            }

            if (items.isEmpty()) {
                resp.getWriter().write("No items selected for billing.");
                return;
            }

            Bill bill = new Bill();
            bill.setCustomerId(customerId);
            bill.setBillDate(new Date());
            bill.setTotalAmount(total);
            bill.setItems(items);

            int billId = billService.createBill(bill);

            if (billId > 0) {
                resp.sendRedirect(req.getContextPath() + "/bill");
            } else {
                resp.getWriter().write("Failed to create bill.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}
