package com.newfashion.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.newfashion.model.ProductModel;
import com.newfashion.service.IProductService;
import com.newfashion.utilities.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/product/edit")
public class ProductAPI extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Inject
    private IProductService productService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");// Su dung kieu du lieu Tieng Viet
        resp.setContentType("application/json");// Dinh dang kieu du lieu server se tra ve

        ProductModel model = HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        model = productService.save(model);
        mapper.writeValue(resp.getOutputStream(), model);
    }
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        ProductModel model = HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        model = productService.save(model);
        mapper.writeValue(resp.getOutputStream(), model);
        
    }
    
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ProductModel model = HttpUtil.of(req.getReader()).toModel(ProductModel.class);
        mapper.writeValue(resp.getOutputStream(), productService.delete(model.getId()));
    }
}
