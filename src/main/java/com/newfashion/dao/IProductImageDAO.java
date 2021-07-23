package com.newfashion.dao;

import java.util.List;

import com.newfashion.model.ProductImageModel;

public interface IProductImageDAO extends GenericDAO<ProductImageModel> {
    Integer save(ProductImageModel model);
    ProductImageModel findById(Integer id);
    List<ProductImageModel> findAllByProductId(Integer productId);
    boolean delete(Integer id);
    boolean deleteByProductId(Integer productId);
}
