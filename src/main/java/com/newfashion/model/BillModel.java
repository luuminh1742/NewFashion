package com.newfashion.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BillModel extends AbstractModel<BillModel> {
	private String receiverName;
	private String receiverAddress;
	private String receiverPhone;
	private Timestamp createdDate;
	private String payType;
	private boolean status;
	private Integer accountId;
}
