package com.icbt.service;

import com.icbt.dao.CustomerDAO;
import com.icbt.model.Customer;

import java.util.List;

public class CustomerService {
    private final CustomerDAO customerDAO;

    public CustomerService() {
        customerDAO = new CustomerDAO();
    }

    // POST: Add a new customer
    public boolean addCustomer(Customer customer) {
        if (customerDAO.customerExists(customer.getAccountNumber())) {
            System.out.println("Customer with this account number already exists.");
            return false;
        }
        return customerDAO.addCustomer(customer);
    }

    // GET: Retrieve a customer by account number
    public Customer getCustomer(String accountNumber) {
        return customerDAO.getCustomerByAccountNumber(accountNumber);
    }

    // GET: Retrieve all customers
    public List<Customer> getAllCustomers() {
        return customerDAO.getAllCustomers();
    }

    // PUT: Update existing customer
    public boolean updateCustomer(Customer customer) {
        if (!customerDAO.customerExists(customer.getAccountNumber())) {
            System.out.println("Customer not found.");
            return false;
        }
        return customerDAO.updateCustomer(customer);
    }

    // DELETE: Delete customer by account number
    public boolean deleteCustomer(String accountNumber) {
        if (!customerDAO.customerExists(accountNumber)) {
            System.out.println("Customer not found.");
            return false;
        }
        return customerDAO.deleteCustomer(accountNumber);
    }

    // Helper: Check if customer exists
    public boolean customerExists(String accountNumber) {
        return customerDAO.customerExists(accountNumber);
    }

    public boolean checkCustomer(int id){
        return customerDAO.checkCustomer(id);
    }

    public Customer getCustomerById(int id) {
        return customerDAO.getCustomerById(id);
    }
}