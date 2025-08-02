package com.icbt.service;

import com.icbt.dao.ItemDAO;
import com.icbt.model.Item;
import java.util.List;

public class ItemService {
    private final ItemDAO itemDAO = new ItemDAO();

    public void addItem(Item item) {
        itemDAO.addItem(item);
    }

    public List<Item> getAllItems() {
        return itemDAO.getAllItems();
    }

    public Item getItemById(int id) {
        return itemDAO.getItem(id);
    }

    public void updateItem(Item item) {
        itemDAO.updateItem(item);
    }

    public void deleteItem(int id) {
        itemDAO.deleteItem(id);
    }
}
