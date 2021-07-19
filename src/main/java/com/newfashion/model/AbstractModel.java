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
}
