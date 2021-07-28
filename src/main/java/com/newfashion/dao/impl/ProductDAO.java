package com.newfashion.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import com.newfashion.dao.IProductDAO;
import com.newfashion.mapper.ProductMapper;
import com.newfashion.model.ProductModel;
import com.newfashion.paging.Pageble;
import org.apache.commons.lang.StringUtils;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {

	@Override
	public List<ProductModel> findAll() {
		String sql = "select * from product";
		return query(sql, new ProductMapper());
	}

	@Override
	public List<ProductModel> findAll(Pageble pageble) {
		StringBuilder  sql = new StringBuilder("select * from product");
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
		}
		return query(sql.toString(), new ProductMapper());
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
	public int getTotalItem() {
		String sql = "select count(*) from product";
		return count(sql);
	}

	@Override
	public void saveTimeChange(Timestamp modifiedDate, String modifiedBy,int id) {
		String sql = "update product set modified_date = ?, modified_by = ? where id = ?";
		update(sql,modifiedDate,modifiedBy,id);
	}

}
