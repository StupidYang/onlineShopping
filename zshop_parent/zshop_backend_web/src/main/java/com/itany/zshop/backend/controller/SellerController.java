package com.itany.zshop.backend.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itany.zshop.common.constant.PaginationConstant;
import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.params.SellerParam;
import com.itany.zshop.pojo.Seller;
import com.itany.zshop.service.RoleService;
import com.itany.zshop.service.SellerService;
import com.itany.zshop.vo.SellerVo;
import com.itany.zshop.vo.SysuserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/backend/seller")
public class SellerController {

    @Autowired
    private SellerService sellerService;

    @Autowired
    private RoleService roleService;


    //findAll
    @RequestMapping("/findAll")
    public String findAll(Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum= PaginationConstant.PAGE_NUM;
        }

        PageHelper.startPage(pageNum, PaginationConstant.PAGE_SIZE);
        List<Seller> seller = sellerService.findAll();
        PageInfo<Seller> pageInfo = new PageInfo<Seller>(seller);
        model.addAttribute("pageInfo",pageInfo);

        return "sellerApply";
    }

    //findByParams
    @RequestMapping("/findByParams")
    public String findByParams(SellerParam sellerParam, Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum= PaginationConstant.PAGE_NUM;
        }

        PageHelper.startPage(pageNum, PaginationConstant.PAGE_SIZE);
        List<Seller> seller=sellerService.findByParams(sellerParam);
        PageInfo<Seller> pageInfo = new PageInfo<Seller>(seller);
        model.addAttribute("pageInfo",pageInfo);
        //实现数据回显
        model.addAttribute("sellerParam",sellerParam);

        return "sellerApply";
    }

    @RequestMapping("/modifyStatusY")
    @ResponseBody
    public ResponseResult modifyStatusY(int id){
        sellerService.modifyStatusY(id);
        return ResponseResult.success();
    }

    @RequestMapping("/modifyStatusN")
    @ResponseBody
    public ResponseResult modifyStatusN(int id){
        sellerService.modifyStatusN(id);
        return ResponseResult.success();
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(int id){
        sellerService.add(id);
        return ResponseResult.success();
    }

    @RequestMapping("/removeById")
    @ResponseBody
    public ResponseResult removeById(int id){
        sellerService.removeById(id);
        return ResponseResult.success();
    }
}
