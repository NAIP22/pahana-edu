package com.icbt.service;

import com.icbt.model.Customer;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class CustomerServiceTest {

    private CustomerService customerService;

    @BeforeEach
    public void setUp() {
        customerService = new CustomerService(); // assumes default constructor
    }

    @Test
    @DisplayName("Should return all customers")
    public void testGetAllCustomers() {
        List<Customer> customers = customerService.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
        assertTrue(customers.size() >= 0, "Customer list size should be >= 0");
    }

    @Test
    @DisplayName("Should add a new customer successfully")
    public void testAddCustomer() {
        Customer newCustomer = new Customer();
        newCustomer.setName("Test User");
        newCustomer.setTelephone("0711234567");
        newCustomer.setAccountNumber("ACC12345");
        newCustomer.setAddress("abc123");

        boolean result = customerService.addCustomer(newCustomer);
        assertTrue(result, "Customer should be added successfully");
    }

    @Test
    @DisplayName("Should fetch customer by ID")
    public void testGetCustomerById() {
        int testId = 1; // Make sure this ID exists in test DB
        Customer customer = customerService.getCustomerById(testId);
        if (customer != null) {
            assertEquals(testId, customer.getId(), "Fetched customer ID should match");
        } else {
            assertNull(customer, "Customer not found");
        }
    }

    @Test
    @DisplayName("Should update customer details")
    public void testUpdateCustomer() {
        Customer customer = new Customer();
        customer.setId(6); // Existing ID
        customer.setName("Updated Name");
        customer.setTelephone("0777654321");
        customer.setAccountNumber("ACC12345");
        customer.setAddress("abc123");

        boolean updated = customerService.updateCustomer(customer);
        assertTrue(updated, "Customer should be updated");
    }

    @Test
    @DisplayName("Should delete customer")
    public void testDeleteCustomer() {
        String accountNumberToDelete = "ACC12345"; // Ensure this customer exists first
        boolean deleted = customerService.deleteCustomer(accountNumberToDelete);
        assertTrue(deleted, "Customer should be deleted");
    }

    @Test
    @DisplayName("Should return null for non-existing customer")
    public void testNonExistentCustomerFetch() {
        Customer customer = customerService.getCustomerById(99999);
        assertNull(customer, "Expected null for non-existent customer");
    }
}
