package com.newfashion.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.newfashion.model.ProductCategoryModel;

public class ProductCategoryMapper implements RowMapper<ProductCategoryModel> {

	@Override
	public ProductCategoryModel mapRow(ResultSet resultSet) {
		ProductCategoryModel model = new ProductCategoryModel();
		try {
			model.setId(resultSet.getInt("id"));
			model.setName(resultSet.getString("name"));
			model.setImage(resultSet.getString("image"));
			return model;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
