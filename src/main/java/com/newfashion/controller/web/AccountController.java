package com.newfashion.controller.web;

import com.newfashion.model.AccountModel;
import com.newfashion.model.BillModel;
import com.newfashion.service.IBillService;
import com.newfashion.utilities.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/account")
public class AccountController extends HttpServlet{


	private static final long serialVersionUID = 1L;
	@Inject
	private GenericController genericController;
	@Inject
	private IBillService billService;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
		if(accountModel == null){
			resp.sendRedirect(req.getContextPath() + "/login");
		}
		BillModel billModel = new BillModel();
		billModel.setListResult(billService.findAll(accountModel.getId()));
		req.setAttribute("billModel",billModel);
		req.setAttribute("accountModel",accountModel);
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/account.jsp");
		genericController.displayGeneric(req,"HOME");
		rd.forward(req, resp);
	}

}
