package com.newfashion.mapper;

import com.newfashion.model.ProductImageModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductImageMapper implements RowMapper<ProductImageModel> {
    @Override
    public ProductImageModel mapRow(ResultSet resultSet) {
        ProductImageModel model = new ProductImageModel();
        try {
        	model.setId(resultSet.getInt("id"));
            model.setProductId(resultSet.getInt("product_id"));
            model.setName(resultSet.getString("name"));
            return model;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
