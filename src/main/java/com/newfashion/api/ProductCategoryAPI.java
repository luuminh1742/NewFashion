package com.newfashion.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.newfashion.model.ProductCategoryModel;
import com.newfashion.service.IProductCategoryService;
import com.newfashion.utilities.HttpUtil;

@WebServlet("/api/product-category/edit")
public class ProductCategoryAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Inject
	private IProductCategoryService productCategoryService;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ProductCategoryModel model = HttpUtil.of(req.getReader()).toModel(ProductCategoryModel.class);
		model = productCategoryService.save(model);
		mapper.writeValue(resp.getOutputStream(), model);	
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ProductCategoryModel model = HttpUtil.of(req.getReader()).toModel(ProductCategoryModel.class);
		model = productCategoryService.save(model);
		mapper.writeValue(resp.getOutputStream(), model);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ProductCategoryModel model = HttpUtil.of(req.getReader()).toModel(ProductCategoryModel.class);
		mapper.writeValue(resp.getOutputStream(), productCategoryService.delete(model.getId()));
	}
	
	
}
