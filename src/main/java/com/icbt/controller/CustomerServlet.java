package com.icbt.controller;

import com.icbt.model.Customer;
import com.icbt.service.CustomerService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

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

        String action = req.getParameter("action");
        if (action == null) {


            List<Customer> customerList = customerService.getAllCustomers();
            req.setAttribute("customers", customerList);

            // Use forward, NOT redirect
            RequestDispatcher dispatcher = req.getRequestDispatcher("list_customer.jsp");
            dispatcher.forward(req, resp);
        }
        else{
            if(action.equals("add")){
                req.getRequestDispatcher("add_customer.jsp").forward(req, resp);
            }
            else if(action.equals("edit")){
                int id = Integer.parseInt(req.getParameter("id"));
                Customer customer = customerService.getCustomerById(id);
                req.setAttribute("customer", customer);
                req.getRequestDispatcher("edit_customer.jsp").forward(req, resp);
            }
            else if(action.equals("delete")) {
                doDelete(req, resp);
                resp.sendRedirect("customer");
            } else if (action.equals("search")){
                    req.getRequestDispatcher("account_detail.jsp").forward(req, resp);
            } else if (action.equals(("searched"))) {
                String accountNumber = req.getParameter("accountNumber");
                Customer customer = customerService.getCustomer(accountNumber);
                req.setAttribute("customer", customer);
                req.getRequestDispatcher("account_detail.jsp").forward(req,resp);
            }
        }
    }


    // POST - Add new customer
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action != null) {
            if (action.equals("add")) {
                String accountNumber = req.getParameter("accountNumber");
                String name = req.getParameter("name");
                String address = req.getParameter("address");
                String telephone = req.getParameter("telephone");

                Customer customer = new Customer(accountNumber, name, address, telephone);
                boolean added = customerService.addCustomer(customer);

                if (added) {
                    resp.setStatus(HttpServletResponse.SC_CREATED);
                    resp.getWriter().write("Customer added successfully");
                    resp.sendRedirect("customer");
                } else {
                    resp.sendError(HttpServletResponse.SC_CONFLICT, "Customer already exists");
                }
            } else if (action.equals("update")) {
                doPut(req, resp);
            }
        }
    }

    // PUT - Update existing customer
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String telephone = req.getParameter("telephone");

        Customer updatedCustomer = new Customer(accountNumber, name, address, telephone);
        System.out.println(updatedCustomer.getAccountNumber());
        System.out.println(updatedCustomer.getName());
        System.out.println(updatedCustomer.getAddress());
        System.out.println(updatedCustomer.getTelephone());
        boolean updated = customerService.updateCustomer(updatedCustomer);

        if (updated) {
            resp.sendRedirect("customer");
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer not found");
        }
    }

    // DELETE - Remove customer by account number
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        boolean exists = customerService.checkCustomer(Integer.parseInt(id));

        if (exists) {
            Customer customer = customerService.getCustomerById(Integer.parseInt(id));
            customerService.deleteCustomer(customer.getAccountNumber());
            resp.getWriter().write("Customer deleted successfully");
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer not found");
        }
    }
}
