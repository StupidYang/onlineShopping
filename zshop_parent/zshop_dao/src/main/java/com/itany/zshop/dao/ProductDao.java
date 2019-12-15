package com.itany.zshop.dao;

import com.itany.zshop.params.ProductParam;
import com.itany.zshop.pojo.Product;

import java.util.List;

public interface ProductDao {
    public List<Product> selectAll();
    public void insert(Product product);
    public Product selectByName(String name);
    public Product selectById(int id);
    public void update(Product product);
    public void deleteById(int id);
    public List<Product> selectByParams(ProductParam productParam);
}
