package com.newfashion.service;

import com.newfashion.model.CartModel;

import java.util.List;

public interface ICartService {
    CartModel findById(Integer productId,Integer accountId);
    boolean addCart(CartModel model);
    List<CartModel> findAllByAccountId(Integer accountId);
    boolean updateCart(CartModel model);
    boolean deleteCart(CartModel model);
    short totalProductsInCart(Integer accountId);
}
