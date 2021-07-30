package com.newfashion.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountModel extends AbstractModel<AccountModel> {
	private String username;
	private String password;
	private String fullName;
	private String address;
	private String email;
	private String phone;
	private boolean status;
	private Integer roleId;
	private RoleModel role;
}
