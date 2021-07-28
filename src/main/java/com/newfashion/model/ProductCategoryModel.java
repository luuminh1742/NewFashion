package com.newfashion.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductCategoryModel extends AbstractModel<ProductCategoryModel>{
	private String name;
	private String image;
}
