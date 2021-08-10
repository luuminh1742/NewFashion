package com.newfashion.service;

import java.util.List;

import com.newfashion.model.ProductModel;
import com.newfashion.paging.Pageble;

public interface IProductService {
	List<ProductModel> findAll();
	List<ProductModel> findAll(Pageble pageble);
	ProductModel findById(Integer id);
	ProductModel save(ProductModel model);
	boolean delete(Integer id);
	int getTotalItem();
	int getTotalItem(Integer categoryId);
	List<ProductModel> findAll(Pageble pageble,Integer categoryId);
	List<ProductModel> findNewProduct(int productNumber);
}
