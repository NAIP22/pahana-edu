package com.icbt.service;

import com.icbt.dao.BillItemDAO;
import com.icbt.model.BillItem;

import java.util.List;

public class BillItemService {

    private BillItemDAO billItemDAO;

    public BillItemService() {
        this.billItemDAO = new BillItemDAO();
    }

    public List<BillItem> getItemsByBillId(int billId) {
        return billItemDAO.getItemsByBillId(billId);
    }

    public boolean deleteItemsByBillId(int billId) {
        return billItemDAO.deleteItemsByBillId(billId);
    }

    public boolean addBillItem(BillItem item) {
        return billItemDAO.addBillItem(item);
    }
}
