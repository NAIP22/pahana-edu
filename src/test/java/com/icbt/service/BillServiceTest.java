package com.icbt.service;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import com.icbt.model.Customer;
import com.icbt.model.Item;
import org.junit.jupiter.api.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class BillServiceTest {

    private static BillService billService;
    private static CustomerService customerService;
    private static ItemService itemService;

    private static int createdBillId;
    private static int testCustomerId;
    private static int testItemId;

    @BeforeAll
    static void setup() {
        billService = new BillService();
        customerService = new CustomerService();
        itemService = new ItemService();

        // Get or create a test customer
        List<Customer> customers = customerService.getAllCustomers();
        assertFalse(customers.isEmpty(), "No customers found. Add test customer before running tests.");
        testCustomerId = customers.get(0).getId();

        // Get or create a test item
        List<Item> items = itemService.getAllItems();
        assertFalse(items.isEmpty(), "No items found. Add test item before running tests.");
        testItemId = items.get(0).getId();
    }

    @Test
    @Order(1)
    @DisplayName("Create Bill - should succeed")
    void testCreateBill() {
        BillItem billItem = new BillItem();
        billItem.setItemId(testItemId);
        billItem.setQuantity(2);
        billItem.setUnitPrice(100.0);
        billItem.setTotalPrice(200.0);

        List<BillItem> itemList = new ArrayList<>();
        itemList.add(billItem);

        Bill bill = new Bill();
        bill.setCustomerId(testCustomerId);
        bill.setBillDate(new Date());
        bill.setTotalAmount(200.0);
        bill.setItems(itemList);

        int billId = billService.createBill(bill);
        createdBillId = billId;

        assertTrue(billId > 0, "Bill should be created with valid ID");
    }

    @Test
    @Order(2)
    @DisplayName("Get All Bills - should return list")
    void testGetAllBills() {
        List<Bill> bills = billService.getAllBills();
        assertNotNull(bills, "Bill list should not be null");
        assertTrue(bills.size() > 0, "Bill list should not be empty");
    }

    @Test
    @Order(3)
    @DisplayName("Delete Bill - should remove bill")
    void testDeleteBill() {
        boolean deleted = billService.deleteBill(createdBillId);
        assertTrue(deleted, "Bill should be deleted");

        // Confirm deletion
        List<Bill> bills = billService.getAllBills();
        boolean billExists = bills.stream().anyMatch(b -> b.getId() == createdBillId);
        assertFalse(billExists, "Deleted bill should not exist in list");
    }
}
