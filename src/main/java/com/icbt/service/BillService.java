package com.icbt.service;

import com.icbt.dao.BillDAO;
import com.icbt.model.Bill;

import java.util.List;

public class BillService {

    private BillDAO billDAO;

    public BillService() {
        this.billDAO = new BillDAO();
    }

    public int createBill(Bill bill) {
        return billDAO.createBill(bill);
    }

    public List<Bill> getAllBills() {
        return billDAO.getAllBills();
    }
}
