package com.newfashion.service.impl;

import com.newfashion.dao.IProductDAO;
import com.newfashion.dao.IProductImageDAO;
import com.newfashion.model.ProductImageModel;
import com.newfashion.service.IProductImageService;
import com.newfashion.utilities.UploadFileUtil;

import javax.inject.Inject;

import java.sql.Timestamp;
import java.util.Base64;
import java.util.List;

public class ProductImageService implements IProductImageService {

	@Inject
    private IProductImageDAO productImageDAO;
	@Inject
    private IProductDAO productDAO;

    @Override
    public ProductImageModel save(ProductImageModel model) {
        if(!model.getBase64().isEmpty()){
            byte[] decodeBase64 = Base64.getDecoder().decode(model.getBase64().split(",")[1].getBytes());
            UploadFileUtil.writeOrUpdateFile(decodeBase64, "/images/"+ model.getName());
            
        }
        Integer id = productImageDAO.save(model);
        productDAO.saveTimeChange(
        		new Timestamp(System.currentTimeMillis()), "Luu Minh", model.getProductId());
        return productImageDAO.findById(id);
    }

	@Override
	public List<ProductImageModel> findAllByProductId(Integer productId) {
		return productImageDAO.findAllByProductId(productId);
	}

	@Override
	public boolean delete(Integer id) {
		return productImageDAO.delete(id);
	}

	@Override
	public boolean deleteByProductId(Integer productId) {
		return productImageDAO.deleteByProductId(productId);
	}
}
