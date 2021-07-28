package com.newfashion.dao;

import com.newfashion.model.AccountModel;

public interface IAccountDAO extends GenericDAO<AccountModel>{
    AccountModel findByUsernameAndPasswordAndStatus(String username, String password);
}
