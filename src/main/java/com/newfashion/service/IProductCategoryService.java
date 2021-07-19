package com.newfashion.service;

import java.util.List;

import com.newfashion.model.ProductCategoryModel;

public interface IProductCategoryService {
	List<ProductCategoryModel> findAll();
	ProductCategoryModel save(ProductCategoryModel model);
	boolean delete(Integer id);
}
