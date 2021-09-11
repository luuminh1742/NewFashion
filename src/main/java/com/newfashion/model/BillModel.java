package com.newfashion.model;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BillModel extends AbstractModel<BillModel> {
	private String receiverName;
	private String receiverAddress;
	private String receiverPhone;
	private Timestamp createdDate;
	private String date;
	private String payType;
	private boolean status;
	private int checkStatus;
	private Integer accountId;
	private List<CartModel> carts;
	private List<BillDetailModel> billDetails;
}
