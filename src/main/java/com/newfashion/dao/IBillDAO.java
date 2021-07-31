package com.newfashion.dao;

import com.newfashion.model.BillModel;

import java.util.List;

public interface IBillDAO extends GenericDAO<BillModel> {
    BillModel findById(Integer id);
    List<BillModel> findAll();
    Integer addBill(BillModel model);
    boolean updateBill(Integer id);
}
