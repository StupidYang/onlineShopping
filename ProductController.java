package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shopping.entity.PageBean;
import com.shopping.entity.Product;
import com.shopping.entity.User;
import com.shopping.service.ProductService;
import com.shopping.utils.Response;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class ProductController {
    @Resource
    private ProductService productService;

    @RequestMapping(value = "/getAllProducts")
    @ResponseBody
    public Map<String, Object> getAllProducts() {
        List<Product> productList;
        productList = productService.getAllProduct();
        String allProducts = JSONArray.toJSONString(productList);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("allProducts", allProducts);
        return resultMap;
    }


    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public Response deleteProduct(int id) {
        return productService.deleteProduct(id);
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addProduct(String name, String description, String keyWord, double price, int counts, int type, int userId) {


        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setKeyWord(keyWord);
        product.setPrice(price);
        product.setCounts(counts);
        product.setType(type);
        product.setUserId(userId);
        int thisId = productService.addProduct(product);

        String id= String.valueOf(thisId);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", id);
        return resultMap;
    }

    @RequestMapping(value = "/productDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> productDetail(int id, HttpSession httpSession) {
        System.out.println("I am here!" + id);
        Product product = productService.getProduct(id);
        httpSession.setAttribute("productDetail", product);
        System.out.print("I am here" + product.getName());
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", "success");
        return resultMap;
    }

    @RequestMapping(value = "/product_detail")
    public String product_detail() {
        return "product_detail";
    }

    @RequestMapping(value = "/searchPre", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchPre(String searchKeyWord, HttpSession httpSession) {
        httpSession.setAttribute("searchKeyWord", searchKeyWord);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", "success");
        return resultMap;
    }

    @RequestMapping(value = "/search")
    public String search() {
        return "search";
    }


    @RequestMapping(value = "/getProductById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductById(int id) {
        Product product = productService.getProduct(id);
        String result = JSON.toJSONString(product);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }


    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam MultipartFile productImgUpload, String id, HttpServletRequest request) {
        String result = "fail";
        try {
            if (productImgUpload != null && !productImgUpload.isEmpty()) {
                String fileRealPath = request.getSession().getServletContext().getRealPath("/static/img");
               // int id = productService.getProduct(name).getId();
                String fileName = String.valueOf(id) + ".jpg";
                File fileFolder = new File(fileRealPath);

                if (!fileFolder.exists()) {
                    fileFolder.mkdirs();
                }
                File file = new File(fileFolder, fileName);
                productImgUpload.transferTo(file);
                result = "success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }


    @RequestMapping(value = "/getAllProductsById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllProductsById(Integer id) {
        List<Product> productList = productService.getProductByUserId(id);
        String allProducts = JSONArray.toJSONString(productList);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("allProductsById", allProducts);
        return resultMap;
    }

    @RequestMapping(value = "/getOwnerByProductId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getOwnerByProductId(int id) {
        User user=productService.getOwnerByProductId(id);
        String result = JSON.toJSONString(user);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }
    //商家修改商品
    @RequestMapping(value = "/doProductUpdate",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doProductUpdate(String name,String description,String keyWord,double price,int counts,int type){
        String result = "fail";
        Product product = productService.getProduct(name);
        System.out.println(product);
        product.setName(name);
        product.setDescription(description);
        product.setKeyWord(keyWord);
        product.setPrice(price);
        product.setCounts(counts);
        product.setType(type);
        productService.updateProduct(product);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getProductByType", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductByType(int type) {
        List<Product> list = productService.getProductsByType(type);
        String result = JSON.toJSONString(list);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/findAllJson",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAllJson(int type, int pageNum, int pageSize) throws JsonProcessingException {
        PageBean<Product> Page=productService.findByPage(type,pageNum,pageSize);
        System.out.print(Page);
        ObjectMapper mapper=new ObjectMapper();
        //String result=mapper.writeValueAsString(Page.getDataList());
        String jsonResult= JSONObject.toJSONString(Page);
        System.out.print(jsonResult);
        return jsonResult;
    }

    @RequestMapping(value = "/getProductNum",method =RequestMethod.GET )
    @ResponseBody
    public List<Long> getProductNum(){
        List<Long> list = productService.getProductNumber();
        return list;
    }

    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)

    @ResponseBody

    public Map<String, Object> searchProduct(String searchKeyWord) {

        System.out.println("我到了SearchProduct" + searchKeyWord);

        List<Product> productList;

        productList = productService.getProductsByKeyWord(searchKeyWord,"default");

        String searchResult = JSONArray.toJSONString(productList);

        Map<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("result", searchResult);

        System.out.println("我返回了" + searchResult);

        return resultMap;

    }

    @RequestMapping(value = "/sortByPrice", method = RequestMethod.POST)

    @ResponseBody

    public Map<String, Object> searchProduct(String searchKeyWord, String selected) {

        System.out.println("排序sortByPrice" + selected);

        List<Product> productList;

        productList = productService.getProductsByKeyWord(searchKeyWord, selected);

        String searchResult = JSONArray.toJSONString(productList);

        Map<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("result", searchResult);

        System.out.println("我返回了" + searchResult+" "+selected);

        return resultMap;

    }


    @RequestMapping(value = "/shopDetail", method = RequestMethod.POST)

    @ResponseBody

    public Map<String, Object> shopDetail(int ownerId, HttpSession httpSession) {

        System.out.println("I am here!" + ownerId);

        httpSession.setAttribute("shop", ownerId);

        System.out.print("I am here" + ownerId);

        Map<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("result", "success");

        return resultMap;

    }



    @RequestMapping(value = "/theShop")

    public  String theShop() {return "theShop";}



}



