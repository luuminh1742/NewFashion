package com.newfashion.dao;

import com.newfashion.model.BillDetailModel;

import java.util.List;

public interface IBillDetailDAO extends GenericDAO<BillDetailModel> {
    boolean insert(BillDetailModel model);
    List<BillDetailModel> findAllByBillId(Integer billId);
}
