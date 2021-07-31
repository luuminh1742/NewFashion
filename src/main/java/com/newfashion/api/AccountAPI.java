package com.newfashion.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.newfashion.model.AccountModel;
import com.newfashion.service.IAccountService;
import com.newfashion.utilities.HttpUtil;
import com.newfashion.utilities.SessionUtil;

@WebServlet("/api/account")
public class AccountAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	private IAccountService accountService;
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        AccountModel model = HttpUtil.of(req.getReader()).toModel(AccountModel.class);
        boolean checkUpdate = false;
		// Cap nhat thong tin ca nhan
		if(action.equals("info")) {
			checkUpdate = accountService.updatePersonalInformation(model);
		}else if(action.equals("password")) {
			// cap nhat mat khau
			AccountModel accountModel = accountService.findById(model.getId());
			if(accountModel.getPassword().equals(model.getPassword()))
				checkUpdate = accountService.updatePassword(model);
		} 
		mapper.writeValue(resp.getOutputStream(), checkUpdate);
	}

}
