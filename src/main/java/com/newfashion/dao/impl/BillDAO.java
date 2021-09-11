package com.newfashion.dao.impl;

import com.newfashion.dao.IBillDAO;
import com.newfashion.mapper.BillMapper;
import com.newfashion.mapper.ProductMapper;
import com.newfashion.model.BillModel;
import com.newfashion.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.sql.Timestamp;
import java.util.List;

public class BillDAO extends AbstractDAO<BillModel> implements IBillDAO {
    @Override
    public BillModel findById(Integer id) {
        String sql = "select * from bill where id = ?";
        return findById(sql,new BillMapper(),id);
    }

    @Override
    public List<BillModel> findAllByAccountId(Integer accountId) {
        String sql = "select * from bill where account_id = ? order by created_date desc";
        return query(sql,new BillMapper(),accountId);
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
        sql.append("receiver_phone,created_date,pay_type,status,check_status) ");
        sql.append(" values (?,?,?,?,?,?,?,?)");
        return insert(sql.toString(),model.getAccountId(),model.getReceiverName(),
                model.getReceiverAddress(),model.getReceiverPhone(),
                new Timestamp(System.currentTimeMillis()),"",0,0);
    }

    @Override
    public boolean updateBill(Integer id) {
        String sql = "update bill set status = 1 where id = ?";
        return update(sql,id);
    }

    @Override
    public List<BillModel> findAll(boolean status) {
        String sql = "select * from bill where status = ? order by created_date desc";
        return query(sql,new BillMapper(),status);
    }

    @Override
    public List<BillModel> findAll(Pageble pageble, boolean status) {
        StringBuilder  sql = new StringBuilder("select * from bill where status = ? ");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName())
                && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
        }
        return query(sql.toString(), new BillMapper(),status);
    }

    @Override
    public List<BillModel> findAll(Pageble pageble, int checkStatus) {
        StringBuilder  sql = new StringBuilder("select * from bill where check_status = ? ");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName())
                && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
        }
        return query(sql.toString(), new BillMapper(),checkStatus);
    }

    @Override
    public int getTotalItem(boolean status) {
        String sql = "select count(*) from bill where status = ?";
        return count(sql,status);
    }

    @Override
    public int getTotalItem(int checkStatus) {
        String sql = "select count(*) from bill where check_status = ?";
        return count(sql,checkStatus);
    }

    @Override
    public boolean getOrders(Integer id) {
        String sql = "update bill set check_status = 1 where id = ?";
        return update(sql,id);
    }

    @Override
    public boolean deleteOrders(Integer id) {
        String sql = "update bill set check_status = 2 where id = ?";
        return update(sql,id);
    }
}
