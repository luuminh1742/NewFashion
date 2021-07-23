package com.newfashion.model;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductModel extends AbstractModel<ProductModel> {
	private String name;
	private int price;
	private byte discount;
	private short quantity;
	private String image;
	private String productDetail;
	private Timestamp createdDate;
	private String createdBy;
	private Timestamp modifiedDate;
	private String modifiedBy;
	private boolean status;
	private Integer categoryId;
	private List<ProductImageModel> productImages;
}
