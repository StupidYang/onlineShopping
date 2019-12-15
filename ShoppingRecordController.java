package com.shopping.controller;

import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.Product;
import com.shopping.entity.ShoppingRecord;
import com.shopping.service.ProductService;
import com.shopping.service.ShoppingRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class ShoppingRecordController {
    @Resource
    private ProductService productService;
    @Resource
    private ShoppingRecordService shoppingRecordService;

    @RequestMapping(value = "/shopping_record")
    public String shopping_record(){
        return "shopping_record";
    }

    @RequestMapping(value = "/shopping_handle")
    public String shopping_handle(){
        return "shopping_handle";
    }

    @RequestMapping(value = "/addShoppingRecord",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addShoppingRecord(int userId,int productId,int counts){
        System.out.println("我添加了"+userId+" "+productId);
        String result = null;
        Product product = productService.getProduct(productId);
        if(counts<=product.getCounts()) {
            ShoppingRecord shoppingRecord = new ShoppingRecord();
            shoppingRecord.setUserId(userId);
            shoppingRecord.setProductId(productId);
            shoppingRecord.setProductPrice(product.getPrice() * counts);
            shoppingRecord.setCounts(counts);
            shoppingRecord.setOrderStatus(0);
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
            shoppingRecord.setTime(sf.format(date));
            product.setCounts(product.getCounts()-counts);
            productService.updateProduct(product);
            shoppingRecordService.addShoppingRecord(shoppingRecord);
            result = "success";
        }
        else{
            result = "unEnough";
        }
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/changeShoppingRecord",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> changeShoppingRecord(int userId,int productId,String time,int orderStatus){

        ShoppingRecord shoppingRecord = shoppingRecordService.getShoppingRecord(userId,productId,time);

        shoppingRecord.setOrderStatus(orderStatus);
        shoppingRecordService.updateShoppingRecord(shoppingRecord);

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");

        return resultMap;
    }

    @RequestMapping(value = "/getShoppingRecords",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingRecords(int userId){

        List<ShoppingRecord> shoppingRecordList = shoppingRecordService.getShoppingRecords(userId);
        String shoppingRecords = JSONArray.toJSONString(shoppingRecordList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",shoppingRecords);
        return resultMap;
    }

    @RequestMapping(value = "/getShoppingRecordsByOrderStatus",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingRecordsByOrderStatus(int orderStatus){
        List<ShoppingRecord> shoppingRecordList = shoppingRecordService.getShoppingRecordsByOrderStatus(orderStatus);
        String shoppingRecords = JSONArray.toJSONString(shoppingRecordList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",shoppingRecords);
        return resultMap;
    }

    @RequestMapping(value = "/getAllShoppingRecords",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getAllShoppingRecords(int userId){
        List<ShoppingRecord> shoppingRecordList = shoppingRecordService.getAllShoppingRecords(userId);
        String shoppingRecords = JSONArray.toJSONString(shoppingRecordList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",shoppingRecords);
        return resultMap;
    }

    @RequestMapping(value = "/getUserProductRecord",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getUserProductRecord(int userId,int productId){
        String result = "false";
        if(shoppingRecordService.getUserProductRecord(userId,productId)){
            result = "true";
        }
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/getShoppingRecordsByProductId", method = RequestMethod.POST)

    @ResponseBody

    public Map<String,Object> getShoppingRecordsByProductId(int id){

        List<ShoppingRecord> shoppingRecordList = shoppingRecordService.getShoppingRecordsByProductId(id);

        String shoppingRecords = JSONArray.toJSONString(shoppingRecordList);

        Map<String,Object> resultMap = new HashMap<String,Object>();

        resultMap.put("result",shoppingRecords);

        return resultMap;

    }

}
