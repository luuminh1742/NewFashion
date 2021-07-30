package com.newfashion.mapper;

import com.newfashion.model.AccountModel;
import com.newfashion.model.RoleModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountMapper implements RowMapper{
    @Override
    public Object mapRow(ResultSet resultSet) {
        AccountModel model = new AccountModel();
        try {
            model.setId(resultSet.getInt("id"));
            model.setUsername(resultSet.getString("username"));
            model.setPassword(resultSet.getString("password"));
            model.setFullName(resultSet.getString("full_name"));
            model.setAddress(resultSet.getString("address"));
            model.setEmail(resultSet.getString("email"));
            model.setPhone(resultSet.getString("phone"));
            model.setStatus(resultSet.getBoolean("status"));
            model.setRoleId(resultSet.getInt("role_id"));
            try {
                RoleModel role = new RoleModel();
                role.setCode(resultSet.getString("code"));
                role.setName(resultSet.getString("name"));
                model.setRole(role);
            } catch (Exception e) {
                System.out.print(e.getMessage());
            }
            return model;
        }catch (SQLException ex){
            return null;
        }

    }
}
