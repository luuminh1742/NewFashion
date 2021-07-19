package com.newfashion.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductModel extends AbstractModel<ProductModel> {
	private String name;
	private int price;
	private byte discount;
	private short quantity;
	private String images;
	private Timestamp createdDate;
	private String createdBy;
	private Timestamp modifiedDate;
	private String modifiedBy;
	private boolean status;
	private Integer categoryId;
}
