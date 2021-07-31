package com.newfashion.service.impl;

import com.newfashion.dao.IBillDAO;
import com.newfashion.dao.IBillDetailDAO;
import com.newfashion.model.BillDetailModel;
import com.newfashion.model.BillModel;
import com.newfashion.model.CartModel;
import com.newfashion.model.ProductModel;
import com.newfashion.service.IBillService;
import com.newfashion.service.ICartService;
import com.newfashion.service.IProductService;

import javax.inject.Inject;
import java.util.List;

public class BillService implements IBillService {
    @Inject
    private IBillDAO billDAO;
    @Inject
    private IBillDetailDAO billDetailDAO;
    @Inject
    private IProductService productService;
    @Inject
    private ICartService cartService;

    @Override
    public BillModel findById(Integer id) {
        return billDAO.findById(id);
    }

    @Override
    public List<BillModel> findAll() {
        return billDAO.findAll();
    }

    @Override
    public Integer addBill(BillModel model) {
        Integer billId = billDAO.addBill(model);
        for(CartModel cartModel : model.getCarts()){
            ProductModel productModel = new ProductModel();
            productModel = productService.findById(cartModel.getProductId());
            BillDetailModel billDetailModel = new BillDetailModel();
            billDetailModel.setBillId(billId);
            billDetailModel.setQuantity(cartModel.getQuantity());
            billDetailModel.setProductId(cartModel.getProductId());
            billDetailModel.setProductName(productModel.getName());
            billDetailModel.setCurrentlyPrice(productModel.getPrice());
            billDetailDAO.insert(billDetailModel);
            cartService.deleteCart(cartModel);
        }

        return billId;
    }

    @Override
    public boolean updateBill(Integer id) {
        return billDAO.updateBill(id);
    }
}
