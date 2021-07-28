package com.newfashion.controller.web;

import com.newfashion.model.AccountModel;
import com.newfashion.service.IAccountService;
import com.newfashion.utilities.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Inject
    private GenericController genericController;
    @Inject
    private IAccountService accountService;
    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String alert = req.getParameter("alert");
        String message = req.getParameter("message");
        if (message != null && alert != null) {
            req.setAttribute("message", resourceBundle.getString(message));
            req.setAttribute("alert", alert);
        }

        RequestDispatcher rd = req.getRequestDispatcher("/views/web/login.jsp");
        genericController.displayGeneric(req,"HOME");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        AccountModel model = new AccountModel();
        model = accountService.findByUsernameAndPasswordAndStatus(username, password);
        if(model !=null) {
            SessionUtil.getInstance().putValue(req, "USERMODEL", model);
            if(model.getRole().getCode().equals("USER")) {
                resp.sendRedirect(req.getContextPath()+"/home");
            }else if(model.getRole().getCode().equals("ADMIN")) {
                resp.sendRedirect(req.getContextPath()+"/admin/home");
            }
        }else {
            resp.sendRedirect(req.getContextPath()+"/login?message=username_password_invalid&alert=danger");
        }
    }
}
