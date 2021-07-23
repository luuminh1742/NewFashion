package com.newfashion.service;

import java.util.List;

import com.newfashion.model.ProductImageModel;

public interface IProductImageService {
    ProductImageModel save(ProductImageModel model);
    List<ProductImageModel> findAllByProductId(Integer productId);
    boolean delete(Integer id);
    boolean deleteByProductId(Integer productId);
}
