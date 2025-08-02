package com.icbt.service;

import com.icbt.dao.BillDAO;
import com.icbt.model.Bill;
import com.icbt.model.BillItem;

import java.util.ArrayList;
import java.util.List;

public class BillService {

    private BillDAO billDAO;
    private BillItemService billItemService =  new BillItemService();

    public BillService() {
        this.billDAO = new BillDAO();
    }

    public int createBill(Bill bill) {
        return billDAO.createBill(bill);
    }

    public List<Bill> getAllBills() {
        List<Bill> bills = billDAO.getAllBills();
        for  (Bill bill : bills) {
            bill.setItems(billItemService.getItemsByBillId(bill.getId()));
        }
        return bills;
    }

    public boolean deleteBill(int id) {
        return billDAO.deleteBill(id);
    }

    public Bill getBillById(int id) {
        List<BillItem> billItems = billItemService.getItemsByBillId(id);
        Bill bill = billDAO.getBillById(id);
        bill.setItems(billItems);
        return bill;
    }
}
