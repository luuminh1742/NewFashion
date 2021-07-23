package com.newfashion.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.newfashion.model.ProductModel;

public class ProductMapper implements RowMapper<ProductModel>{

	@Override
	public ProductModel mapRow(ResultSet resultSet) {
		ProductModel model = new ProductModel();
		try {
			model.setId(resultSet.getInt("id"));
			model.setName(resultSet.getString("name"));
			model.setPrice(resultSet.getInt("price"));
			model.setDiscount(resultSet.getByte("discount"));
			model.setQuantity(resultSet.getShort("quantity"));
			model.setProductDetail(resultSet.getString("product_detail"));
			model.setCreatedDate(resultSet.getTimestamp("created_date"));
			model.setCreatedBy(resultSet.getString("created_by"));
			model.setModifiedDate(resultSet.getTimestamp("modified_date"));
			model.setModifiedBy(resultSet.getString("modified_by"));
			model.setStatus(resultSet.getBoolean("status"));
			model.setCategoryId(resultSet.getInt("category_id"));
			return model;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
