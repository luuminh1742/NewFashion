package com.newfashion.dao.impl;

import com.newfashion.dao.IBillDetailDAO;
import com.newfashion.mapper.BillDetailMapper;
import com.newfashion.model.BillDetailModel;

import java.util.List;

public class BillDetailDAO extends AbstractDAO<BillDetailModel> implements IBillDetailDAO {
    @Override
    public boolean insert(BillDetailModel model) {
        StringBuilder sql = new StringBuilder("insert into bill_detail");
        sql.append(" (product_id,bill_id,product_name,quantity,currently_price)");
        sql.append(" values (?,?,?,?,?)");
        return update(sql.toString(),model.getProductId(),model.getBillId(),
                model.getProductName(),model.getQuantity(),model.getCurrentlyPrice());
    }

    @Override
    public List<BillDetailModel> findAllByBillId(Integer billId) {
        String sql = "select * from bill_detail where bill_id = ?";
        return query(sql,new BillDetailMapper(),billId);
    }
}
