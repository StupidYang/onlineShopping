package com.itany.zshop.front.controller;

import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.pojo.Customer;
import com.itany.zshop.pojo.Order;
import com.itany.zshop.pojo.Product;
import com.itany.zshop.service.OrderService;
import com.itany.zshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

@Controller
@RequestMapping("/front/sessions")
public class SessionController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/cart")
    public String cart(){
        System.out.println("购物车");
        return "cart";
    }
    @RequestMapping("/addSession")
    @ResponseBody
    public ResponseResult addOrder(int id, HttpSession session){
        Product product=productService.findById(id);
        Order order=new Order();
        ArrayList<Order> orders=(ArrayList<Order>)session.getAttribute("orders");

        order.setProductId(product.getId());
        order.setPrice(product.getPrice());
        order.setImage(product.getImage());
        order.setName(product.getName());
        order.setNumbers(1);
        order.setPrices(product.getPrice());

        if (orders==null){
            orders=new ArrayList<>();
            session.setAttribute("orders",orders);
        }
        for (int i=0;i<orders.size();i++){
            if (orders.get(i).getProductId()==product.getId())
                return ResponseResult.fail("添加失败！商品已在购物车中存在");
        }
        orders.add(order);
        return ResponseResult.success("添加成功！");
    }
    @RequestMapping("/deleteSession")
    @ResponseBody
    public ResponseResult deleteSession(int i,HttpSession session){
        ArrayList<Order> orders=(ArrayList<Order>)session.getAttribute("orders");
        orders.remove(i);
        return ResponseResult.success();
    }
    @RequestMapping("/deleteAll")
    @ResponseBody
    public ResponseResult deleteAll(HttpSession session){
        ArrayList<Order> orders=new ArrayList<>();
        session.setAttribute("orders",orders);
        return ResponseResult.success();
    }

    @RequestMapping("/changePrice")
    @ResponseBody
    public ResponseResult changePrice(int i,int number,HttpSession session){
        ArrayList<Order> orders=(ArrayList<Order>)session.getAttribute("orders");
        Order order=orders.get(i);
        order.setNumbers(number);
        order.setPrices(number*order.getPrice());
        return ResponseResult.success();
    }
}

