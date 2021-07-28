package com.newfashion.service;

import com.newfashion.model.AccountModel;

public interface IAccountService {
    AccountModel findByUsernameAndPasswordAndStatus(String username, String password);
}
