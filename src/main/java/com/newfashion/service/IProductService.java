package com.newfashion.service;

import java.util.List;

import com.newfashion.model.ProductModel;

public interface IProductService {
	List<ProductModel> findAll();
	ProductModel findById(Integer id);
	ProductModel save(ProductModel model);
	boolean delete(Integer id);
}
