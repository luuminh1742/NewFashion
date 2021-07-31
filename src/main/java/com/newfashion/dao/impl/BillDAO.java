package com.newfashion.dao.impl;

import com.newfashion.dao.IBillDAO;
import com.newfashion.mapper.BillMapper;
import com.newfashion.model.BillModel;

import java.sql.Timestamp;
import java.util.List;

public class BillDAO extends AbstractDAO<BillModel> implements IBillDAO {
    @Override
    public BillModel findById(Integer id) {
        String sql = "select * from bill where id = ?";
        return findById(sql,new BillMapper(),id);
    }

    @Override
    public List<BillModel> findAll() {
        String sql = "select * from bill";
        return query(sql,new BillMapper());
    }

    @Override
    public Integer addBill(BillModel model) {
        StringBuilder sql = new StringBuilder();
        sql.append("insert into bill ");
        sql.append("(account_id,receiver_name,receiver_address,");
        sql.append("receiver_phone,created_date,pay_type,status) ");
        sql.append(" values (?,?,?,?,?,?,?)");
        return insert(sql.toString(),model.getAccountId(),model.getReceiverName(),
                model.getReceiverAddress(),model.getReceiverPhone(),
                new Timestamp(System.currentTimeMillis()),"",0);
    }

    @Override
    public boolean updateBill(Integer id) {
        String sql = "update bill set status = 1 where id = ?";
        return update(sql,id);
    }
}
