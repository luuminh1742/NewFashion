package com.newfashion.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newfashion.model.ProductCategoryModel;
import com.newfashion.service.IProductCategoryService;

@WebServlet("/admin/product-category")
public class ProductCategoryController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IProductCategoryService productCategoryService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductCategoryModel model = new ProductCategoryModel();
		model.setListResult(productCategoryService.findAll());
		
		req.setAttribute("model", model);
		req.setAttribute("menuSidebar", "product-category");
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/product/category/list-product-category.jsp");
		rd.forward(req, resp);
	}

}
