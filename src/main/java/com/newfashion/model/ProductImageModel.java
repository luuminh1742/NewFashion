package com.newfashion.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductImageModel extends AbstractModel<ProductImageModel>{
    private String name;
    private String base64;
    private Integer productId;
}
