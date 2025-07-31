package com.icbt.dao;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import com.icbt.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {

    public int createBill(Bill bill) {
        String billSql = "INSERT INTO bills (customer_id, bill_date, total_amount) VALUES (?, ?, ?)";
        String itemSql = "INSERT INTO bill_items (bill_id, item_id, quantity, unit_price, total_price) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement billStmt = con.prepareStatement(billSql, Statement.RETURN_GENERATED_KEYS)) {

            billStmt.setInt(1, bill.getCustomerId());
            billStmt.setDate(2, new java.sql.Date(bill.getBillDate().getTime()));
            billStmt.setDouble(3, bill.getTotalAmount());
            int affected = billStmt.executeUpdate();

            if (affected == 0) return -1;

            ResultSet keys = billStmt.getGeneratedKeys();
            if (keys.next()) {
                int billId = keys.getInt(1);

                for (BillItem item : bill.getItems()) {
                    try (PreparedStatement itemStmt = con.prepareStatement(itemSql)) {
                        itemStmt.setInt(1, billId);
                        itemStmt.setInt(2, item.getItemId());
                        itemStmt.setInt(3, item.getQuantity());
                        itemStmt.setDouble(4, item.getUnitPrice());
                        itemStmt.setDouble(5, item.getTotalPrice());
                        itemStmt.executeUpdate();
                    }
                }

                return billId;
            }

        } catch (SQLException e) {
            System.err.println("Error creating bill: " + e.getMessage());
        }
        return -1;
    }

    public List<Bill> getAllBills() {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT * FROM bills ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setCustomerId(rs.getInt("customer_id"));
                bill.setBillDate(rs.getDate("bill_date"));
                bill.setTotalAmount(rs.getDouble("total_amount"));
                bills.add(bill);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching bills: " + e.getMessage());
        }
        return bills;
    }

    public boolean deleteBill(int id) {
        String sql = "DELETE FROM bills WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Bill getBillById(int id) {
        String sql = "SELECT * FROM bills WHERE id = ?";
        try ( Connection conn = DBConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try ( ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Bill bill = new Bill();
                    bill.setId(rs.getInt("id"));
                    bill.setCustomerId(rs.getInt("customer_id"));
                    bill.setBillDate(rs.getDate("bill_date"));
                    bill.setTotalAmount(rs.getDouble("total_amount"));
                    return bill;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
