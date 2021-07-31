package com.newfashion.service;

import com.newfashion.model.AccountModel;

public interface IAccountService {
	AccountModel findByUsernameAndPasswordAndStatus(String username, String password);
	AccountModel findById(Integer id);
    boolean updatePersonalInformation(AccountModel model);
    boolean updatePassword(AccountModel model);
}
