package com.itany.zshop.service;

import com.itany.zshop.params.SellerParam;
import com.itany.zshop.pojo.Seller;
import com.itany.zshop.vo.SellerVo;



import java.util.List;

public interface SellerService {
    public void regist(Seller seller);

    public List<Seller> findAll();

    public Seller findById(int id);

    List<Seller> findByParams(SellerParam sellerParam);

    public void modifyStatus(int id);

    public void modify(SellerVo sellerVo);

    public void modifyStatusY(int id);

    public void modifyStatusN(int id);

    public void removeById(int id);

    public void add(int id);
}
