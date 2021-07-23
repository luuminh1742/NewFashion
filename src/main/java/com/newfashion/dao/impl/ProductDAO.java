package com.newfashion.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import com.newfashion.dao.IProductDAO;
import com.newfashion.mapper.ProductMapper;
import com.newfashion.model.ProductModel;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {

	@Override
	public List<ProductModel> findAll() {
		String sql = "select * from product";
		return query(sql, new ProductMapper());
	}

	@Override
	public ProductModel findById(Integer id) {
		String sql = "select * from product where id = ?";
		return findById(sql, new ProductMapper(), id);
	}

	@Override
	public Integer save(ProductModel model) {
		Integer id = model.getId();
		StringBuilder sql = new StringBuilder();
		if (id == null) {
			sql.append("insert into product (category_id,name,");
			sql.append("price,discount,quantity,product_detail,");
			sql.append("created_date,created_by,status) values (?,?,?,?,?,?,?,?,?)");
			id = insert(sql.toString(), model.getCategoryId(), model.getName(), model.getPrice(), model.getDiscount(),
					model.getQuantity(), model.getProductDetail(), model.getCreatedDate(), model.getCreatedBy(),
					model.isStatus());
		} else {
			sql.append("update product set category_id = ?, name = ?, ");
			sql.append("price = ?, discount = ?, quantity = ?, ");
			sql.append("product_detail = ?, modified_date = ?, ");
			sql.append("modified_by = ?, status = ? where id = ?");
			update(sql.toString(), model.getCategoryId(), model.getName(), model.getPrice(), model.getDiscount(),
					model.getQuantity(), model.getProductDetail(), model.getModifiedDate(), model.getModifiedBy(),
					model.isStatus(), model.getId());
		}
		return id;
	}

	@Override
	public boolean delete(Integer id) {
		String sql = "delete from product where id = ?";
		return update(sql, id);
	}

	@Override
	public void saveTimeChange(Timestamp modifiedDate, String modifiedBy,int id) {
		String sql = "update product set modified_date = ?, modified_by = ? where id = ?";
		update(sql,modifiedDate,modifiedBy,id);
	}

}
