package com.newfashion.dao.impl;

import java.util.List;

import com.newfashion.dao.IProductCategoryDAO;
import com.newfashion.mapper.ProductCategoryMapper;
import com.newfashion.model.ProductCategoryModel;

public class ProductCategoryDAO extends AbstractDAO<ProductCategoryModel> implements IProductCategoryDAO{

	
	@Override
	public List<ProductCategoryModel> findAll() {
		String sql = "select * from product_category";
		return query(sql, new ProductCategoryMapper());
	}

	
	@Override
	public Integer save(ProductCategoryModel model) {
		// Bien de luu ket qua tra ve sau khi cap nhat bang danh muc thanh cong
		Integer idResult = model.getId();
		if(model.getId() != null) {
			// Neu ton tai ma danh muc thi thuc hien cap nhat danh muc
			String sql = "update product_category set name = ? where id = ?";
			update(sql,model.getName(),model.getId());
		}else {
			// Khong ton tai ma danh muc thi them danh muc moi
			String sql = "insert into product_category (name) values (?)";
			idResult = insert(sql,model.getName());
		}
		return idResult;
	}

	@Override
	public ProductCategoryModel findById(Integer id) {
		String sql = "select * from product_category where id = ?";
		return findById(sql,new ProductCategoryMapper(),id);
	}


	@Override
	public boolean delete(Integer id) {
		String sql = "delete from product_category where id = ?";
		update(sql,id);
		return true;
	}

}
