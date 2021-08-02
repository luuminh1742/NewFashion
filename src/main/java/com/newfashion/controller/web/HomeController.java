package com.newfashion.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeController extends HttpServlet{


	private static final long serialVersionUID = 1L;
	@Inject
	private GenericController genericController;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
		genericController.displayGeneric(req,"HOME");
		rd.forward(req, resp);
	}

}
