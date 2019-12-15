package com.itany.zshop.front.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itany.zshop.common.constant.PaginationConstant;
import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.params.ProductParam;
import com.itany.zshop.pojo.Product;
import com.itany.zshop.pojo.ProductType;
import com.itany.zshop.service.ProductService;
import com.itany.zshop.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/front/product")
public class ProductController {

    @Autowired
    private ProductTypeService productTypeService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/search")
    public String search(ProductParam productParam, Integer pageNum, Model model){
        if (ObjectUtils.isEmpty(pageNum)){
            pageNum= PaginationConstant.PAGE_NUM;
        }
        //设置分页
        PageHelper.startPage(pageNum,PaginationConstant.FRONT_PAGE_SIZE);
        List<Product> products=productService.findByParams(productParam);
        PageInfo<Product> pageInfo=new PageInfo<>(products);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("productParam",productParam);
        return "main";
    }
    @RequestMapping("/center")
    public String center(){
        return "center";
    }
    @ModelAttribute("productTypes")
    public List<ProductType> loadProductTypes(){
        List<ProductType> productTypes=productTypeService.findEnable();
        return productTypes;
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(int id){
        Product product=productService.findById(id);
        return ResponseResult.success(product);
    }
}
