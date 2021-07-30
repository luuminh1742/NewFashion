package com.newfashion.controller.web;

import com.newfashion.model.AccountModel;
import com.newfashion.model.CartModel;
import com.newfashion.service.ICartService;
import com.newfashion.utilities.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    @Inject
    private ICartService cartService;
    @Inject
    private GenericController genericController;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountModel accountModel = (AccountModel) SessionUtil.getInstance().getValue(req, "USERMODEL");
        CartModel cartModel = new CartModel();
        cartModel.setTotalMoney(0);
        cartModel.setListResult(cartService.findAllByAccountId(accountModel.getId()));
        cartModel.getListResult().forEach(cart->{
            cartModel.setTotalMoney(cart.getQuantity()*cart.getProduct().getPrice() + cartModel.getTotalMoney());
        });
        req.setAttribute("cartModel",cartModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/cart.jsp");
        genericController.displayGeneric(req,"HOME");
        rd.forward(req,resp);
    }
}
