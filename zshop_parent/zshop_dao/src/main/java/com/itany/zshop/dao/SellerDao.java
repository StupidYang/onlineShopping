package com.itany.zshop.dao;

import com.itany.zshop.params.SellerParam;
import com.itany.zshop.pojo.Seller;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SellerDao {

    public void insertSeller(Seller seller);

    public List<Seller> selectAll();

    public Seller selectById(int id);

    public void updateStatus(@Param("id") int id, @Param("apply") int apply);

    List<Seller> selectByParams(SellerParam sellerParam);

    public void insert(@Param("id") int id);

    public void deleteById(int id);
}
