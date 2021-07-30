package com.newfashion.dao.impl;

import com.newfashion.dao.ICartDAO;
import com.newfashion.mapper.CartMapper;
import com.newfashion.model.CartModel;

import java.util.List;

public class CartDAO extends AbstractDAO<CartModel> implements ICartDAO {

    @Override
    public CartModel findById(Integer productId,Integer accountId) {
        String sql = "select * from cart where product_id = ? and account_id = ?";
        return findById(sql, new CartMapper(),productId,accountId);
    }

    @Override
    public boolean addCart(CartModel model) {
        CartModel checkCart = findById(model.getProductId(),model.getAccountId());
        if(checkCart!=null){
            checkCart.setQuantity((short) (checkCart.getQuantity()+1));
            return updateCart(checkCart);
        }
        //model.setQuantity((short) 1);
        String sql = "insert into cart(product_id,account_id,quantity) values(?, ?, ?)";
        return update(sql,model.getProductId(),model.getAccountId(),model.getQuantity());
    }

    @Override
    public List<CartModel> findAllByAccountId(Integer accountId) {
        //String sql = "select * from cart where account_id = ?";
        StringBuilder sql = new StringBuilder();
        sql.append("select c.account_id, c.product_id, c.quantity,p.name as product_name, p.price, pi.name as image ");
        sql.append("from cart as c inner join product as p inner join product_image as pi ");
        sql.append("on c.product_id = p.id and p.id = pi.product_id where c.account_id = ? ");
        sql.append("group by c.product_id");
        return query(sql.toString(),new CartMapper(),accountId);
    }

    @Override
    public boolean updateCart(CartModel model) {
        String sql = "update cart set quantity = ? where product_id = ? and account_id = ?";
        return update(sql,model.getQuantity(),model.getProductId(),model.getAccountId());
    }

    @Override
    public boolean deleteCartItem(CartModel model) {
        String sql = "delete from cart where product_id = ? and account_id = ?";
        return update(sql,model.getProductId(),model.getAccountId());
    }
}
