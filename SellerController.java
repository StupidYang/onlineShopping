package com.itany.zshop.front.controller;


import com.itany.zshop.pojo.Seller;
import com.itany.zshop.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/front/seller")
public class SellerController {

    @Autowired
    private SellerService sellerService;

    @RequestMapping("/regist")
    public String regist(Seller seller, Model model){
        sellerService.regist(seller);
        model.addAttribute("msg","注册成功");
        return "center";
    }
}
