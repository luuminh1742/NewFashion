package com.newfashion.controller.web;

import com.newfashion.model.AccountModel;
import com.newfashion.model.ProductCategoryModel;
import com.newfashion.service.ICartService;
import com.newfashion.service.IProductCategoryService;
import com.newfashion.utilities.SessionUtil;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

public class GenericController {

    @Inject
    private IProductCategoryService productCategoryService;
    @Inject
    private ICartService cartService;

    public void displayGeneric(HttpServletRequest req,String checkMenuHeader){
        short countProductsInCart = 0;
        AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
        if(accountModel != null){
            countProductsInCart = cartService.totalProductsInCart(accountModel.getId());
        }

        ProductCategoryModel productCategoryModel = new ProductCategoryModel();
        productCategoryModel.setListResult(productCategoryService.findAll());
        req.setAttribute("productCategoryModel",productCategoryModel);
        req.setAttribute("checkMenuHeader",checkMenuHeader);
        req.setAttribute("countProductsInCart",countProductsInCart);
    }
}
