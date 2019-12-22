package com.itany.zshop.backend.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itany.zshop.backend.vo.ProductVo;
import com.itany.zshop.common.constant.PaginationConstant;
import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.dto.ProductDto;
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
import java.io.OutputStream;
import java.util.List;

@Controller
@RequestMapping("/backend/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductTypeService productTypeService;

    @ModelAttribute("productTypes")
    public List<ProductType>  loadProductTypes(){
        List<ProductType> productTypes=productTypeService.findEnable();
        return productTypes;
    }

    @RequestMapping("/findAll")
    public String  findAll(Integer pageNum,Model model){
        if (ObjectUtils.isEmpty(pageNum)){
            pageNum= PaginationConstant.PAGE_NUM;
        }
        //设置分页
        PageHelper.startPage(pageNum,PaginationConstant.PAGE_SIZE);
        //查找所有商品
        List<Product> products=productService.findAll();
        PageInfo<Product> pageInfo=new PageInfo<>(products);
        model.addAttribute("pageInfo",pageInfo);
        return "productManager";
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(int id){
        Product product=productService.findById(id);
        return ResponseResult.success(product);
    }

    @RequestMapping("/add")
    public String add(ProductVo productVo,Integer pageNum, HttpSession session, Model model){
        String uploadPath=session.getServletContext().getRealPath("/WEB-INF/upload");
//        System.out.println(uploadPath);
//        String[] strs = uploadPath.split("target");
//        for (String str:strs
//             ) {
//            System.out.println(str);
//        }
//        uploadPath = strs[0] + "src\\main\\webapp\\WEB-INF\\upload";
//        System.out.println(uploadPath);

        //将vo转化为dto
        try {
            ProductDto productDto = new ProductDto();
            productDto.setName(productVo.getName());
            productDto.setPrice(productVo.getPrice());
            productDto.setProductTypeId(productVo.getProductTypeId());
            productDto.setInfo(productVo.getInfo());
            productDto.setInputStream(productVo.getFile().getInputStream());
            productDto.setFileName(productVo.getFile().getOriginalFilename());
            productDto.setUploadPath(uploadPath);

            productService.add(productDto);
            model.addAttribute("successMsg","添加成功");
        }catch (Exception e){
            //e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }

        return "forward:findAll?pageNum="+pageNum;
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public String checkName(String name){
        if (!productService.checkName(name)){
            return "商品已存在，请重新输入商品名称";
        }
        return "";
    }
    @RequestMapping("/modify")
    public String modify(ProductVo productVo,Integer pageNum, HttpSession session, Model model){
        String uploadPath=session.getServletContext().getRealPath("/WEB-INF/upload");
        //将vo转化为dto
        try {
            ProductDto productDto = new ProductDto();
            productDto.setId(productVo.getId());
            productDto.setName(productVo.getName());
            productDto.setPrice(productVo.getPrice());
            productDto.setInfo(productVo.getInfo());
            productDto.setProductTypeId(productVo.getProductTypeId());
            productDto.setInputStream(productVo.getFile().getInputStream());
            productDto.setFileName(productVo.getFile().getOriginalFilename());
            productDto.setUploadPath(uploadPath);

            productService.modify(productDto);
            model.addAttribute("successMsg","修改成功");
        }catch (Exception e){
            //e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }

        return "forward:findAll?pageNum="+pageNum;
    }

    @RequestMapping("/removeById")
    @ResponseBody
    public ResponseResult removeById(int id){
        productService.removeById(id);
        return ResponseResult.success();
    }
}
