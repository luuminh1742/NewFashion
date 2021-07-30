package com.newfashion.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartModel extends AbstractModel<CartModel>{
	private Integer productId;
	private Integer accountId;
	private short quantity;
	//-------------------------------------
	private ProductModel product;
	private int totalMoney;
}
