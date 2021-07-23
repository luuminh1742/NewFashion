package com.newfashion.dao;

import java.sql.Timestamp;
import java.util.List;

import com.newfashion.model.ProductModel;

public interface IProductDAO extends GenericDAO<ProductModel>{
	List<ProductModel> findAll();
	ProductModel findById(Integer id);
	Integer save(ProductModel model);
	void saveTimeChange(Timestamp modifiedDate,String modifiedBy,int id);
	boolean delete(Integer id);
}
