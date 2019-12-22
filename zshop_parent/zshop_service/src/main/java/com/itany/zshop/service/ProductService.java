package com.itany.zshop.service;

import com.itany.zshop.dto.ProductDto;
import com.itany.zshop.params.ProductParam;
import com.itany.zshop.pojo.Product;
import org.apache.commons.fileupload.FileUploadException;

import java.util.List;

public interface ProductService {

    //检查所有商品
    public List<Product> findAll();

    public Product findById(int id);

    public void modify(ProductDto productDto)throws FileUploadException;

    public void removeById(int id);
    //添加商品
    public void add(ProductDto productDto)throws FileUploadException;
    //检查商品name
    public boolean checkName(String name);
    //获取图片
    public List<Product> findByParams(ProductParam productParam);
}
