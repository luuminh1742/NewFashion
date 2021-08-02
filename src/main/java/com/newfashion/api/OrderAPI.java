package com.newfashion.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.newfashion.model.BillModel;
import com.newfashion.service.IBillService;
import com.newfashion.utilities.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/order")
public class OrderAPI extends HttpServlet {
    @Inject
    private IBillService billService;

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillModel model = HttpUtil.of(req.getReader()).toModel(BillModel.class);
        mapper.writeValue(resp.getOutputStream(), billService.getOrders(model.getId()));
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BillModel model = HttpUtil.of(req.getReader()).toModel(BillModel.class);
        mapper.writeValue(resp.getOutputStream(), billService.deleteOrders(model.getId()));
    }
}
