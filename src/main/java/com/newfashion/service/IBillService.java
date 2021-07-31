package com.newfashion.service;

import com.newfashion.model.BillModel;

import java.util.List;

public interface IBillService {
    BillModel findById(Integer id);
    List<BillModel> findAll();
    Integer addBill(BillModel model);
    boolean updateBill(Integer id);
}
