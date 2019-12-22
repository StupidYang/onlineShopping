package com.itany.zshop.front.controller;

import com.github.pagehelper.PageInfo;
import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.pojo.Customer;
import com.itany.zshop.pojo.Order;
import com.itany.zshop.pojo.Product;
import com.itany.zshop.service.ItemService;
import com.itany.zshop.service.OrderService;
import com.itany.zshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/front/Orders")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/addOrder")
    @ResponseBody
    public ResponseResult submitOrder(HttpSession session){
        ArrayList<Order> orders=(ArrayList<Order>) session.getAttribute("orders");
        Customer customer=(Customer)session.getAttribute("customer");
        if (customer==null)
            return ResponseResult.fail("您还没有登入，请先登录");
        if (orders.size()==0)
            return ResponseResult.fail("请先加入购物车");
        for (int i=0;i<orders.size();i++){
            orders.get(i).setCustomerId(customer.getId());
            orders.get(i).setNo(getOrderNoByUUId());
            orders.get(i).setCreateDate(new Date());
            orderService.addOrder(orders.get(i));
        }
        for (int i=0;i<orders.size();i++){
            int orderId=orderService.findByNo(orders.get(i).getNo());
            orders.get(i).setOrderId(orderId);
            itemService.addItem(orders.get(i));
        }
        return ResponseResult.success();
    }

    @RequestMapping("/findAll")
    public String findAll(Model model,HttpSession session){
        Customer customer=(Customer) session.getAttribute("customer");
        if(customer!=null) {
            List<Order> orders = orderService.findAll(customer.getId());
            for (int i=0;i<orders.size();i++){
                System.out.println(orders.get(i).getCreateDate());
                System.out.println(orders.get(i).getProductId());
                Product product=productService.findById(orders.get(i).getProductId());
                orders.get(i).setName(product.getName());
                orders.get(i).setImage(product.getImage());
            }
            PageInfo<Order> myOrders = new PageInfo<>(orders);
            model.addAttribute("myOrders", myOrders);
        }
        return "myOrders";
    }
    @RequestMapping("/deleteOrder")
    @ResponseBody
    public ResponseResult deleteOrder(int orderId){
        itemService.deleteItem(orderId);
        orderService.deleteOrder(orderId);
        return ResponseResult.success();
    }
    //UUID生成订单编号
    public String getOrderNoByUUId() {
        int first = new Random(10).nextInt(8) + 1;
        System.out.println(first);
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if (hashCodeV < 0) {//有可能是负数
            hashCodeV = -hashCodeV;
        }
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return first + String.format("%015d", hashCodeV);
    }
}
