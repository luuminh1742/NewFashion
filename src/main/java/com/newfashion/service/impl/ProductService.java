package com.newfashion.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.newfashion.dao.IProductDAO;
import com.newfashion.model.ProductImageModel;
import com.newfashion.model.ProductModel;
import com.newfashion.paging.Pageble;
import com.newfashion.service.IProductImageService;
import com.newfashion.service.IProductService;

public class ProductService implements IProductService{

	@Inject
	private IProductDAO productDAO;
	@Inject
	private IProductImageService productImageService;
	@Override
	public List<ProductModel> findAll() {
		List<ProductModel> result = productDAO.findAll();
		result.forEach(product ->{
			List<ProductImageModel> productImages = productImageService.findAllByProductId(product.getId());
			if(productImages.size()>0) {
				String image = productImages.get(0).getName();
				product.setImage(image);
			}
		});
		return result;
	}

	@Override
	public List<ProductModel> findAll(Pageble pageble) {
		List<ProductModel> result = productDAO.findAll(pageble);
		result.forEach(product ->{
			List<ProductImageModel> productImages = productImageService.findAllByProductId(product.getId());
			if(productImages.size()>0) {
				String image = productImages.get(0).getName();
				product.setImage(image);
			}
		});
		return result;
	}

	@Override
	public ProductModel findById(Integer id) {
		ProductModel result = productDAO.findById(id);
		result.setProductImages(productImageService.findAllByProductId(result.getId()));
		return  result;
	}
	
	@Override
	public ProductModel save(ProductModel model) {
		if(model.getId() == null){// them moi san pham
			model.setCreatedBy("Luu Minh");
			model.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		}else{ // cap nhat san pham
			model.setModifiedBy("Luu Minh");
			model.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		}
		Integer id = productDAO.save(model);
		return id!=null?productDAO.findById(id):null;
	}

	@Override
	public boolean delete(Integer id) {
		productImageService.deleteByProductId(id);
		return productDAO.delete(id);
	}

	@Override
	public int getTotalItem() {
		return productDAO.getTotalItem();
	}

	@Override
	public int getTotalItem(Integer categoryId) {
		return productDAO.getTotalItem(categoryId);
	}

	@Override
	public List<ProductModel> findAll(Pageble pageble, Integer categoryId) {
		List<ProductModel> result = productDAO.findAll(pageble,categoryId);
		result.forEach(product ->{
			List<ProductImageModel> productImages = productImageService.findAllByProductId(product.getId());
			if(productImages.size()>0) {
				String image = productImages.get(0).getName();
				product.setImage(image);
			}
		});
		return result;
	}

	@Override
	public List<ProductModel> findNewProduct(int productNumber) {
		List<ProductModel> result = productDAO.findNewProduct(productNumber);
		result.forEach(product ->{
			List<ProductImageModel> productImages = productImageService.findAllByProductId(product.getId());
			if(productImages.size()>0) {
				String image = productImages.get(0).getName();
				product.setImage(image);
			}
		});
		return result;
	}

}
