package com.itany.zshop.dao;

import com.itany.zshop.pojo.ProductType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductTypeDao {
    public List<ProductType> selectAll();
    public List<ProductType> selectByStatus(int status);
    public ProductType selectById(int id);
    public ProductType selectByName(String name);
    public void insert(@Param("name") String name,@Param("status") int status);
    public void updateName(@Param("id")int id,@Param("name") String name);
    public void updateStatus(@Param("id") int id,@Param("status") int status);
    public void deleteById(int id);
}
