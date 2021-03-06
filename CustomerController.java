package com.itany.zshop.front.controller;

import com.itany.zshop.common.constant.ResponseStatusConstant;
import com.itany.zshop.common.exception.LoginErrorException;
import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.pojo.Customer;
import com.itany.zshop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/front/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/loginByAccount")
    @ResponseBody
    public ResponseResult loginByAccount(String loginName, String password, HttpSession session){
        ResponseResult result=new ResponseResult();
        try {
            Customer customer=customerService.login(loginName, password);
            session.setAttribute("customer",customer);
            result.setData(customer);
            result.setStatus(ResponseStatusConstant.RESPONSE_STATUS_SUCCESS);
        }catch (LoginErrorException e){
            result.setStatus(ResponseStatusConstant.RESPONSE_STATUS_FAIL);
            result.setMessage(e.getMessage());
        }
        return result;
    }
    @RequestMapping("/logout")
    @ResponseBody
    public ResponseResult logout(HttpSession session){
        session.invalidate();
        return ResponseResult.success();
    }

    @RequestMapping("/findById")
    @ResponseBody
    public Customer findById(Integer id){
        Customer customer = customerService.findById(id);
        return customer;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Customer updateById(Customer customer, HttpSession session){
        //System.out.println(customer.toString());
        customerService.update(customer);
        customer = customerService.findById(customer.getId());
        //System.out.println(customer.toString());
        session.setAttribute("customer",customer);
        return customer;
    }


    @RequestMapping("/regist")
    public String regist(Customer customer, Model model){
        customerService.regist(customer);
        model.addAttribute("msg","注册成功");
        return "center";

    }
}
