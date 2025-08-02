package com.icbt.model;

import java.util.Date;
import java.util.List;

public class Bill {
    private int id;
    private int customerId;
    private Date billDate;
    private double totalAmount;
    private List<BillItem> items;

    // Constructors
    public Bill() {}

    public Bill(int id, int customerId, Date billDate, double totalAmount) {
        this.id = id;
        this.customerId = customerId;
        this.billDate = billDate;
        this.totalAmount = totalAmount;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public Date getBillDate() { return billDate; }
    public void setBillDate(Date billDate) { this.billDate = billDate; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public List<BillItem> getItems() { return items; }
    public void setItems(List<BillItem> items) { this.items = items; }
}
