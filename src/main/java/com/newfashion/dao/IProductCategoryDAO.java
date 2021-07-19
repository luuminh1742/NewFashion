package com.newfashion.dao;

import java.util.List;

import com.newfashion.model.ProductCategoryModel;

public interface IProductCategoryDAO extends GenericDAO<ProductCategoryModel>{
	List<ProductCategoryModel> findAll();
	Integer save(ProductCategoryModel model);
	ProductCategoryModel findById(Integer id);
	boolean delete(Integer id);
}
