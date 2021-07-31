package com.newfashion.dao.impl;

import java.util.List;

import com.newfashion.dao.IAccountDAO;
import com.newfashion.mapper.AccountMapper;
import com.newfashion.model.AccountModel;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

    @Override
    public AccountModel findByUsernameAndPasswordAndStatus(String username, String password) {
        StringBuilder sql = new StringBuilder("SELECT * FROM account AS u");
        sql.append(" INNER JOIN role AS r ON r.id = u.role_id");
        sql.append(" WHERE username = ? AND password = ? AND status = 1");
        List<AccountModel> users = query(sql.toString(), new AccountMapper(), username, password);
        return users.isEmpty() ? null : users.get(0);
    }

	@Override
	public boolean updatePersonalInformation(AccountModel model) {
		StringBuilder sql = new StringBuilder();
		sql.append("update account set full_name = ?, ");
		sql.append("address = ?, email = ?, phone = ? where id = ?");
		return update(sql.toString(),model.getFullName(),model.getAddress(),
				model.getEmail(), model.getPhone(),model.getId());
	}

	@Override
	public boolean updatePassword(AccountModel model) {
		String sql = "update account set password = ? where id = ?";
		return update(sql,model.getNewPassword(),model.getId());
	}

	@Override
	public AccountModel findById(Integer id) {
		String sql = "select * from account where id = ?";
		return findById(sql, new AccountMapper(), id);
	}
}
