package com.newfashion.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.newfashion.model.CartModel;
import com.newfashion.service.ICartService;
import com.newfashion.utilities.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/cart")
public class CartAPI extends HttpServlet {
    @Inject
    private ICartService cartService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CartModel model = HttpUtil.of(req.getReader()).toModel(CartModel.class);
        mapper.writeValue(resp.getOutputStream(), cartService.addCart(model));
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CartModel model = HttpUtil.of(req.getReader()).toModel(CartModel.class);
        mapper.writeValue(resp.getOutputStream(), cartService.updateCart(model));
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CartModel model = HttpUtil.of(req.getReader()).toModel(CartModel.class);
        mapper.writeValue(resp.getOutputStream(), cartService.deleteCart(model));
    }
}
