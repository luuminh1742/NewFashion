package com.newfashion.mapper;

import com.newfashion.model.CartModel;
import com.newfashion.model.ProductModel;
import com.newfashion.model.RoleModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartMapper implements RowMapper<CartModel> {
    @Override
    public CartModel mapRow(ResultSet resultSet) {
        CartModel model = new CartModel();
        try {
            model.setProductId(resultSet.getInt("product_id"));
            model.setAccountId(resultSet.getInt("account_id"));
            model.setQuantity(resultSet.getShort("quantity"));
            try {
                ProductModel productModel = new ProductModel();
                productModel.setName(resultSet.getString("product_name"));
                productModel.setPrice(resultSet.getInt("price"));
                productModel.setImage(resultSet.getString("image"));
                model.setProduct(productModel);
            } catch (Exception e) {
                System.out.print(e.getMessage());
            }
            return model;
        } catch (SQLException ex) {
            return null;
        }
    }
}
