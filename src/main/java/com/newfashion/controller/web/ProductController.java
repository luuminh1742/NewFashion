package com.newfashion.controller.web;

import com.newfashion.model.ProductModel;
import com.newfashion.service.IProductService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/product")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Inject
    private IProductService productService;
    @Inject GenericController genericController;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String productId = req.getParameter("id");
        int id = Integer.parseInt(productId);

        ProductModel productModel = productService.findById(id);
        req.setAttribute("productModel",productModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/product.jsp");
        genericController.displayGeneric(req,"SHOP");
        rd.forward(req,resp);
    }
}
