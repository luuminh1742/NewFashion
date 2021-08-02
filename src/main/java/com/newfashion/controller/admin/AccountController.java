package com.newfashion.controller.admin;

import com.newfashion.model.AccountModel;
import com.newfashion.utilities.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/account"})
public class AccountController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(req, "USERMODEL");

		req.setAttribute("accountModel", accountModel);
		req.setAttribute("menuSidebar", "account");
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/account.jsp");
		rd.forward(req, resp);
	}

}
