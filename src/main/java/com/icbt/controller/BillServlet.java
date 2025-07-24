package com.icbt.controller;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import com.icbt.service.BillService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    private BillService billService;

    @Override
    public void init() {
        billService = new BillService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Bill> billList = billService.getAllBills();
        req.setAttribute("bills", billList);
        req.getRequestDispatcher("list_bill.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int customerId = Integer.parseInt(req.getParameter("customerId"));
        String[] itemIds = req.getParameterValues("itemId");
        String[] quantities = req.getParameterValues("quantity");
        String[] unitPrices = req.getParameterValues("unitPrice");

        List<BillItem> items = new ArrayList<>();
        double total = 0;

        for (int i = 0; i < itemIds.length; i++) {
            int itemId = Integer.parseInt(itemIds[i]);
            int quantity = Integer.parseInt(quantities[i]);
            double price = Double.parseDouble(unitPrices[i]);
            double lineTotal = quantity * price;

            BillItem item = new BillItem();
            item.setItemId(itemId);
            item.setQuantity(quantity);
            item.setUnitPrice(price);
            item.setTotalPrice(lineTotal);

            items.add(item);
            total += lineTotal;
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
    }
}
