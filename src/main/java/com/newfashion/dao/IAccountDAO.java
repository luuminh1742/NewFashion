package com.newfashion.dao;

import com.newfashion.model.AccountModel;

public interface IAccountDAO extends GenericDAO<AccountModel>{
	AccountModel findByUsernameAndPasswordAndStatus(String username, String password);
	AccountModel findById(Integer id);
    boolean updatePersonalInformation(AccountModel model);
    boolean updatePassword(AccountModel model);
}
