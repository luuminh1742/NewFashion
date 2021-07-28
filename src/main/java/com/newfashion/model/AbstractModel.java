package com.newfashion.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AbstractModel<T> {
	private Integer id;
	private String type;
	private List<T> listResult = new ArrayList<>();
	private Integer page; // start page
	private Integer maxPageItem;// số item trên một trang
	private Integer totalPage; // trổng số trang
	private Integer totalItem;
	private String sortName;
	private String sortBy;
}
