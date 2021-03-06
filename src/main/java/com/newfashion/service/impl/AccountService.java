package com.newfashion.service.impl;

import com.newfashion.dao.IAccountDAO;
import com.newfashion.model.AccountModel;
import com.newfashion.service.IAccountService;

import javax.inject.Inject;

public class AccountService implements IAccountService {
    @Inject
    private IAccountDAO accountDAO;

    @Override
    public AccountModel findByUsernameAndPasswordAndStatus(String username, String password) {
        return accountDAO.findByUsernameAndPasswordAndStatus(username,password);
    }

	@Override
	public boolean updatePersonalInformation(AccountModel model) {
		return accountDAO.updatePersonalInformation(model);
	}

	@Override
	public boolean updatePassword(AccountModel model) {
		return accountDAO.updatePassword(model);
	}

	@Override
	public AccountModel findById(Integer id) {
		return accountDAO.findById(id);
	}
}
