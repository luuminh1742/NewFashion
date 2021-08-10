package com.newfashion.dao;

import java.sql.Timestamp;
import java.util.List;

import com.newfashion.model.ProductModel;
import com.newfashion.paging.Pageble;

public interface IProductDAO extends GenericDAO<ProductModel>{
	List<ProductModel> findAll();
	List<ProductModel> findAll(Pageble pageble);
	ProductModel findById(Integer id);
	Integer save(ProductModel model);
	void saveTimeChange(Timestamp modifiedDate,String modifiedBy,int id);
	boolean delete(Integer id);
	int getTotalItem();
	int getTotalItem(Integer categoryId);
	List<ProductModel> findAll(Pageble pageble,Integer categoryId);
	List<ProductModel> findNewProduct(int productNumber);
}
