package com.newfashion.dao.impl;

import com.newfashion.dao.IAccountDAO;
import com.newfashion.mapper.AccountMapper;
import com.newfashion.model.AbstractModel;
import com.newfashion.model.AccountModel;

import java.util.List;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

    @Override
    public AccountModel findByUsernameAndPasswordAndStatus(String username, String password) {
        StringBuilder sql = new StringBuilder("SELECT * FROM account AS u");
        sql.append(" INNER JOIN role AS r ON r.id = u.role_id");
        sql.append(" WHERE username = ? AND password = ? AND status = 1");
        List<AccountModel> users = query(sql.toString(), new AccountMapper(), username, password);
        return users.isEmpty() ? null : users.get(0);
    }
}
