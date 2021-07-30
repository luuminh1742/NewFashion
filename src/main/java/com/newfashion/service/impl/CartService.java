package com.newfashion.service.impl;

import com.newfashion.dao.ICartDAO;
import com.newfashion.model.CartModel;
import com.newfashion.service.ICartService;

import javax.inject.Inject;
import java.util.List;

public class CartService implements ICartService {
    @Inject
    private ICartDAO cartDAO;

    @Override
    public CartModel findById(Integer productId,Integer accountId) {
        return cartDAO.findById(productId,accountId);
    }

    @Override
    public boolean addCart(CartModel model) {
        return cartDAO.addCart(model);
    }

    @Override
    public List<CartModel> findAllByAccountId(Integer accountId) {
        return cartDAO.findAllByAccountId(accountId);
    }

    @Override
    public boolean updateCart(CartModel model) {
        return cartDAO.updateCart(model);
    }

    @Override
    public boolean deleteCart(CartModel model) {
        return cartDAO.deleteCartItem(model);
    }

    @Override
    public short totalProductsInCart(Integer accountId) {
        List<CartModel> carts = findAllByAccountId(accountId);
        if(carts.size()  != 0){
            short count = 0;
            for(CartModel cart : carts){
                count+=cart.getQuantity();
            }
            return count;
        }
        return 0;
    }
}
