package com.newfashion.dao;

import com.newfashion.model.CartModel;

import java.util.List;

public interface ICartDAO extends GenericDAO<CartModel>{
    CartModel findById(Integer productId,Integer accountId);
    boolean addCart(CartModel model);
    List<CartModel> findAllByAccountId(Integer accountId);
    boolean updateCart(CartModel model);
    boolean deleteCartItem(CartModel model);
}
