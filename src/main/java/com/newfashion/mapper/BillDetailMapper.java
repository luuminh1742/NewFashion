package com.newfashion.mapper;

import com.newfashion.model.BillDetailModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BillDetailMapper implements RowMapper<BillDetailModel> {
    @Override
    public BillDetailModel mapRow(ResultSet resultSet) {
        BillDetailModel model = new BillDetailModel();
        try {
            model.setProductId(resultSet.getInt("product_id"));
            model.setBillId(resultSet.getInt("bill_id"));
            model.setProductName(resultSet.getString("product_name"));
            model.setQuantity(resultSet.getShort("quantity"));
            model.setCurrentlyPrice(resultSet.getInt("currently_price"));
            return model;
        } catch (SQLException ex) {
            return null;
        }
    }
}
