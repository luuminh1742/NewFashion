package com.newfashion.mapper;

import com.newfashion.model.BillModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillMapper implements RowMapper<BillModel> {
    @Override
    public BillModel mapRow(ResultSet resultSet) {
        BillModel model = new BillModel();
        try {
            model.setId(resultSet.getInt("id"));
            model.setAccountId(resultSet.getInt("account_id"));
            model.setReceiverName(resultSet.getString("receiver_name"));
            model.setReceiverAddress(resultSet.getString("receiver_address"));
            model.setReceiverPhone(resultSet.getString("receiver_phone"));
            model.setCreatedDate(resultSet.getTimestamp("created_date"));
            model.setPayType(resultSet.getString("pay_type"));
            model.setStatus(resultSet.getBoolean("status"));
            model.setCheckStatus(resultSet.getInt("check_status"));
            return model;
        } catch (SQLException ex) {
            return null;
        }
    }
}
