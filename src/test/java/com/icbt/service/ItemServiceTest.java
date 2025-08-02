package com.icbt.service;

import com.icbt.model.Item;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ItemServiceTest {

    private static ItemService itemService;
    private static int createdItemId;

    @BeforeAll
    static void setup() {
        itemService = new ItemService();
    }

    @Test
    @Order(1)
    @DisplayName("Add Item - should succeed")
    void testAddItem() {
        Item item = new Item();
        item.setName("Test Item");
        item.setUnitPrice(199.99);
        item.setStockQuantity(10);

        itemService.addItem(item);
        List<Item> itemList = itemService.getAllItems();

        assertFalse(itemList.isEmpty(), "Item list should not be empty after add");

        // Save ID for later test cases
        Item lastItem = itemList.get(itemList.size() - 1);
        createdItemId = lastItem.getId();
        assertEquals("Test Item", lastItem.getName());
    }

    @Test
    @Order(2)
    @DisplayName("Get Item by ID")
    void testGetItem() {
        Item item = itemService.getItemById(createdItemId);
        assertNotNull(item, "Item should exist");
        assertEquals("Test Item", item.getName());
    }

    @Test
    @Order(3)
    @DisplayName("Update Item - should reflect changes")
    void testUpdateItem() {
        Item item = itemService.getItemById(createdItemId);
        item.setName("Updated Item");
        item.setUnitPrice(299.50);
        item.setStockQuantity(20);

        itemService.updateItem(item);

        Item updated = itemService.getItemById(createdItemId);
        assertEquals("Updated Item", updated.getName());
        assertEquals(299.50, updated.getUnitPrice());
        assertEquals(20, updated.getStockQuantity());
    }

    @Test
    @Order(4)
    @DisplayName("Delete Item - should remove item")
    void testDeleteItem() {
        itemService.deleteItem(createdItemId);
        Item deleted = itemService.getItemById(createdItemId);
        assertNull(deleted, "Item should be deleted and return null");
    }

    @Test
    @DisplayName("Get All Items - should return list")
    void testGetAllItems() {
        List<Item> items = itemService.getAllItems();
        assertNotNull(items);
        assertTrue(items instanceof List);
    }
}
