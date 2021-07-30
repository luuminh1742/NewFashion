package com.newfashion.controller.web;

import com.newfashion.model.ProductModel;
import com.newfashion.paging.PageRequest;
import com.newfashion.paging.Pageble;
import com.newfashion.paging.Sorter;
import com.newfashion.service.IProductService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shop")
public class ShopController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Inject
    private IProductService productService;
    @Inject GenericController genericController;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int page = Integer.parseInt(req.getParameter("page"));
        int categoryId =  Integer.parseInt(req.getParameter("category-id"));
        ProductModel productModel = new ProductModel();
        productModel.setPage(page);
        productModel.setMaxPageItem(10);
        productModel.setSortBy("desc");
        productModel.setSortName("created_date");
        Pageble pageble = new PageRequest(page, productModel.getMaxPageItem(),
                new Sorter(productModel.getSortName(), productModel.getSortBy()));
        if(categoryId!=0){
            productModel.setTotalItem(productService.getTotalItem(categoryId));
            productModel.setTotalPage((int)Math.ceil((double)productModel.getTotalItem()/productModel.getMaxPageItem()));
            productModel.setListResult(productService.findAll(pageble,categoryId));
        }else{
            productModel.setTotalItem(productService.getTotalItem());
            productModel.setTotalPage((int)Math.ceil((double)productModel.getTotalItem()/productModel.getMaxPageItem()));
            productModel.setListResult(productService.findAll(pageble));
        }

        req.setAttribute("categoryId",categoryId);
        req.setAttribute("productModel",productModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/shop.jsp");
        genericController.displayGeneric(req,"SHOP");
        rd.forward(req,resp);
    }
}
