package com.newfashion.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BillDetailModel extends AbstractModel<BillDetailModel> {
	private Integer productId;
	private Integer billId;
	private String productName;
	private short quantity;
	private int currentlyPrice;
}
