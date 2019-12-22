package com.itany.zshop.backend.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itany.zshop.common.constant.PaginationConstant;
import com.itany.zshop.common.constant.ResponseStatusConstant;
import com.itany.zshop.common.exception.ProductTypeExistException;
import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.pojo.ProductType;
import com.itany.zshop.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/backend/productType")
public class ProductTypeController {

    @Autowired
    private ProductTypeService productTypeService;

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum,Model model){
        if (ObjectUtils.isEmpty(pageNum)){
            pageNum= PaginationConstant.PAGE_NUM;
        }
        //设置分页
        PageHelper.startPage(pageNum,PaginationConstant.PAGE_SIZE);
        //查找所有商品
        List<ProductType> productTypes=productTypeService.findAll();
        PageInfo<ProductType> pageInfo=new PageInfo<>(productTypes);
        model.addAttribute("pageInfo",pageInfo);

        return "productTypeManager";
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(String name){
        ResponseResult result=new ResponseResult();
        try {
            productTypeService.add(name);
            result.setStatus(ResponseStatusConstant.RESPONSE_STATUS_SUCCESS);
            result.setMessage("添加成功");
        }catch (ProductTypeExistException e){
            //e.printStackTrace();
            result.setStatus(ResponseStatusConstant.RESPONSE_STATUS_FAIL);
            result.setMessage(e.getMessage());
        }
        return result;
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(int id){
        ProductType productType=productTypeService.findById(id);
        return ResponseResult.success(productType);
    }

    @RequestMapping("/modifyName")
    @ResponseBody
    public ResponseResult findById(int id,String name){
        try {
            productTypeService.modifyName(id, name);
            return ResponseResult.success("修改商品类型成功！");
        }catch (ProductTypeExistException e){
            return ResponseResult.fail(e.getMessage());
        }
    }

    @RequestMapping("/removeById")
    @ResponseBody
    public ResponseResult removeById(int id){
        productTypeService.removeById(id);
        return ResponseResult.success("删除成功！");
    }

    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(int id){
        productTypeService.modifyStatus(id);
        return ResponseResult.success();
    }
}
