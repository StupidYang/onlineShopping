package com.itany.zshop.service.impl;

import com.itany.zshop.common.constant.SellerConstant;
import com.itany.zshop.common.constant.SysuserConstant;
import com.itany.zshop.dao.CustomerDao;
import com.itany.zshop.dao.SellerDao;
import com.itany.zshop.params.SellerParam;
import com.itany.zshop.params.SysuserParam;
import com.itany.zshop.pojo.Customer;
import com.itany.zshop.pojo.Seller;
import com.itany.zshop.pojo.Sysuser;
import com.itany.zshop.service.SellerService;
import com.itany.zshop.vo.SellerVo;
import com.itany.zshop.vo.SysuserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class SellerServiceImpl implements SellerService {

    @Autowired
    private SellerDao sellerDao;

    @Override
    public void regist(Seller seller){
        sellerDao.insertSeller(seller);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Seller> findAll() {
        return sellerDao.selectAll();
    }

    @Override
    public Seller findById(int id) {
        return sellerDao.selectById(id);
    }

    @Override
    public void modify(SellerVo sellerVo) {

    }

    @Override
    public void modifyStatus(int id) {
        Seller seller = sellerDao.selectById(id);
        int apply = seller.getApply();
        if (apply == SellerConstant.APPLYING) {
            apply = SellerConstant.SUCCESS;
        }else if(apply == SellerConstant.SUCCESS){
            apply = SellerConstant.FUIL;
        }else
            apply = SellerConstant.SUCCESS;

        sellerDao.updateStatus(id, apply);
    }



    @Override
    public List<Seller> findByParams(SellerParam sellerParam) {
        return sellerDao.selectByParams(sellerParam);
    }

}
