package com.itany.zshop.backend.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ProductVo {
    private int id;
    private String name;
    private double price;
    private String info;
    private CommonsMultipartFile file;
    private Integer productTypeId;

    public int getId() {return id;}
    public void setId(int id) {this.id = id;}
    public String getName() {return name; }
    public void setName(String name) {this.name = name; }
    public double getPrice() {return price;}
    public void setPrice(double price) {this.price = price;}
    public String getInfo() {
        return info;
    }
    public void setInfo(String info) {
        this.info = info;
    }
    public CommonsMultipartFile getFile() {return file;}
    public void setFile(CommonsMultipartFile file) {this.file = file; }
    public Integer getProductTypeId() {return productTypeId; }
    public void setProductTypeId(Integer productTypeId) {this.productTypeId = productTypeId; }
}
