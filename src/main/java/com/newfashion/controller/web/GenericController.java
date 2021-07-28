package com.newfashion.controller.web;

import com.newfashion.model.ProductCategoryModel;
import com.newfashion.service.IProductCategoryService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

public class GenericController {

    @Inject
    private IProductCategoryService productCategoryService;

    public void displayGeneric(HttpServletRequest req,String checkMenuHeader){

        ProductCategoryModel productCategoryModel = new ProductCategoryModel();
        productCategoryModel.setListResult(productCategoryService.findAll());
        req.setAttribute("productCategoryModel",productCategoryModel);
        req.setAttribute("checkMenuHeader",checkMenuHeader);
    }
}
