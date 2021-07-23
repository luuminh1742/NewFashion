package com.newfashion.dao.impl;

import java.util.List;

import com.newfashion.dao.IProductImageDAO;
import com.newfashion.mapper.ProductImageMapper;
import com.newfashion.model.ProductImageModel;

public class ProductImageDAO extends AbstractDAO<ProductImageModel>implements IProductImageDAO {
    @Override
    public Integer save(ProductImageModel model) {
        String sql = "";
        Integer id = model.getId();
        if(id == null){
            sql = "insert into product_image (name, product_id) values (?,?)";
            id = insert(sql,model.getName(),model.getProductId());
        }else{
            sql = "update product_image set name = ? where id = ?";
            update(sql,model.getName(),id);
        }
        return id;
    }

    @Override
    public ProductImageModel findById(Integer id) {
        String sql = "select * from product_image where id = ?";
        return findById(sql,new ProductImageMapper(),id);
    }

	@Override
	public List<ProductImageModel> findAllByProductId(Integer productId) {
		String sql = "select * from product_image where product_id = ?";
		return query(sql,new ProductImageMapper(),productId);
	}

	@Override
	public boolean delete(Integer id) {
		String sql = "delete from product_image where id = ?";
		return update(sql,id);
	}

	@Override
	public boolean deleteByProductId(Integer productId) {
		String sql = "delete from product_image where product_id = ?";
		return update(sql,productId);
	}
}
