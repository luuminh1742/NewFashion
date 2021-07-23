package com.newfashion.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.newfashion.model.ProductImageModel;
import com.newfashion.service.IProductImageService;
import com.newfashion.utilities.HttpUtil;

@WebServlet("/api/product-image/edit")
public class ProductImageAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	private IProductImageService productImageService;
	

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ProductImageModel model = HttpUtil.of(req.getReader()).toModel(ProductImageModel.class);
        model = productImageService.save(model);
        mapper.writeValue(resp.getOutputStream(), model);
    }
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        ProductImageModel model = HttpUtil.of(req.getReader()).toModel(ProductImageModel.class);
        mapper.writeValue(resp.getOutputStream(), productImageService.delete(model.getId()));
	}
}
