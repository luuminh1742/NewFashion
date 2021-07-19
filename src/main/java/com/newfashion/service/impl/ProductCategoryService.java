package com.newfashion.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.newfashion.dao.IProductCategoryDAO;
import com.newfashion.model.ProductCategoryModel;
import com.newfashion.service.IProductCategoryService;

public class ProductCategoryService implements IProductCategoryService{

	@Inject
	private IProductCategoryDAO productCategoryDAO;
	
	@Override
	public List<ProductCategoryModel> findAll() {
		return productCategoryDAO.findAll();
	}

	@Override
	public ProductCategoryModel save(ProductCategoryModel model) {
		Integer id = productCategoryDAO.save(model);
		return id == null?null : productCategoryDAO.findById(id);
	}

	@Override
	public boolean delete(Integer id) {
		return productCategoryDAO.delete(id);
	}

}
