package com.newfashion.controller.admin;

import com.newfashion.model.BillModel;
import com.newfashion.paging.PageRequest;
import com.newfashion.paging.Pageble;
import com.newfashion.paging.Sorter;
import com.newfashion.service.IBillService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/bill")
public class BillController extends HttpServlet {

    @Inject
    private IBillService billService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String type = req.getParameter("type");
        int page = Integer.parseInt(req.getParameter("page"));
        BillModel billModel = new BillModel();
        billModel.setPage(page);
        billModel.setMaxPageItem(10);
        billModel.setSortBy("desc");
        billModel.setSortName("created_date");
        Pageble pageble = new PageRequest(page, billModel.getMaxPageItem(),
                new Sorter(billModel.getSortName(), billModel.getSortBy()));
        if(type.equals("new")){
            billModel.setTotalItem(billService.getTotalItem(false));
            billModel.setTotalPage((int)Math.ceil((double)billModel.getTotalItem()/billModel.getMaxPageItem()));
            billModel.setListResult(billService.findAll(pageble,false));
        }else{
            billModel.setTotalItem(billService.getTotalItem(true));
            billModel.setTotalPage((int)Math.ceil((double)billModel.getTotalItem()/billModel.getMaxPageItem()));
            billModel.setListResult(billService.findAll(pageble,true));
        }
        req.setAttribute("type",type);
        req.setAttribute("billModel",billModel);
        req.setAttribute("menuSidebar", "bill");
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/bill.jsp");
        rd.forward(req, resp);
    }
}
