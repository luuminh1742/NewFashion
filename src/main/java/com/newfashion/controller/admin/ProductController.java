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
import com.newfashion.model.ProductModel;
import com.newfashion.service.IProductCategoryService;
import com.newfashion.service.IProductService;

@WebServlet("/admin/product")
public class ProductController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	private IProductService productService;
	@Inject
	private IProductCategoryService productCategoryService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		String view = "";
		ProductModel model = new ProductModel();
		if(type.equals("list")) {
			view = "/views/admin/product/list-product.jsp";
			model.setListResult(productService.findAll());
		}else if(type.equals("edit")) {
			view = "/views/admin/product/edit-product.jsp";
			String id = req.getParameter("id");
			if(id!=null)
				model = productService.findById(Integer.parseInt(id));

			ProductCategoryModel productCategoryModel = new ProductCategoryModel();
			productCategoryModel.setListResult(productCategoryService.findAll());
			req.setAttribute("productCategoryModel", productCategoryModel);
		}
		
		
		
		
		req.setAttribute("model", model);
		req.setAttribute("menuSidebar", "product");
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}

}
