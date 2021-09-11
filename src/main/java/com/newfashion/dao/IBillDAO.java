package com.newfashion.dao;

import com.newfashion.model.BillModel;
import com.newfashion.paging.Pageble;

import java.util.List;

public interface IBillDAO extends GenericDAO<BillModel> {
    BillModel findById(Integer id);
    List<BillModel> findAllByAccountId(Integer accountId);
    List<BillModel> findAll();
    Integer addBill(BillModel model);
    boolean updateBill(Integer id);
    List<BillModel> findAll(boolean status);
    List<BillModel> findAll(Pageble pageble, boolean status);
    List<BillModel> findAll(Pageble pageble, int checkStatus);
    int getTotalItem(boolean status);
    int getTotalItem(int checkStatus);
    boolean getOrders(Integer id);
    boolean deleteOrders(Integer id);
}
