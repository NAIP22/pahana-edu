package com.icbt.controller;

import com.icbt.model.Customer;
import com.icbt.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService;

    @Override
    public void init() {
        customerService = new CustomerService();
    }

    // GET - Retrieve customer by account number
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        Customer customer = customerService.getCustomer(accountNumber);

        if (customer != null) {
            resp.setContentType("text/plain");
            resp.getWriter().write(customer.toString());
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer not found");
        }
    }

    // POST - Add new customer
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String telephone = req.getParameter("telephone");

        Customer customer = new Customer(accountNumber, name, address, telephone);
        boolean added = customerService.addCustomer(customer);

        if (added) {
            resp.setStatus(HttpServletResponse.SC_CREATED);
            resp.getWriter().write("Customer added successfully");
        } else {
            resp.sendError(HttpServletResponse.SC_CONFLICT, "Customer already exists");
        }
    }

    // PUT - Update existing customer
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        StringBuilder json = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        // For simplicity, manually parsing input (assumes format: key=value&key=value)
        String[] params = json.toString().split("&");
        String accountNumber = "", name = "", address = "", telephone = "";

        for (String param : params) {
            String[] pair = param.split("=");
            if (pair.length == 2) {
                switch (pair[0]) {
                    case "accountNumber" -> accountNumber = pair[1];
                    case "name" -> name = pair[1];
                    case "address" -> address = pair[1];
                    case "telephone" -> telephone = pair[1];
                }
            }
        }

        Customer updatedCustomer = new Customer(accountNumber, name, address, telephone);
        boolean updated = customerService.updateCustomer(updatedCustomer);

        if (updated) {
            resp.getWriter().write("Customer updated successfully");
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer not found");
        }
    }

    // DELETE - Remove customer by account number
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        boolean exists = customerService.customerExists(accountNumber);

        if (exists) {
            customerService.deleteCustomer(accountNumber);
            resp.getWriter().write("Customer deleted successfully");
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer not found");
        }
    }
}
