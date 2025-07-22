package com.icbt.dao;

import com.icbt.model.Item;
import com.icbt.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    public void addItem(Item item) {
        String sql = "INSERT INTO items (name, unit_price, stock_quantity) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, item.getName());
            stmt.setDouble(2, item.getUnitPrice());
            stmt.setInt(3, item.getStockQuantity());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Add Item Error: " + e.getMessage());
        }
    }

    public Item getItem(int id) {
        String sql = "SELECT * FROM items WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Item(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("unit_price"),
                            rs.getInt("stock_quantity")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Get Item Error: " + e.getMessage());
        }
        return null;
    }

    public List<Item> getAllItems() {
        List<Item> itemList = new ArrayList<>();
        String sql = "SELECT * FROM items";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Item item = new Item();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                item.setUnitPrice(rs.getDouble("unit_price"));
                item.setStockQuantity(rs.getInt("stock_quantity"));
                itemList.add(item);
            }
        } catch (SQLException e) {
            System.err.println("Get All Items Error: " + e.getMessage());
        }
        return itemList;
    }

    public void updateItem(Item item) {
        String sql = "UPDATE items SET name=?, unit_price=?, stock_quantity=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, item.getName());
            stmt.setDouble(2, item.getUnitPrice());
            stmt.setInt(3, item.getStockQuantity());
            stmt.setInt(4, item.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Update Item Error: " + e.getMessage());
        }
    }

    public void deleteItem(int id) {
        String sql = "DELETE FROM items WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Delete Item Error: " + e.getMessage());
        }
    }
}
