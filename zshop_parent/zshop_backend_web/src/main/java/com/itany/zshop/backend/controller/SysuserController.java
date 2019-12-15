package com.itany.zshop.backend.controller;

import com.itany.zshop.service.SysuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/backend/sysuser")
public class SysuserController {
    @RequestMapping("/login")
    public String login(String loginName,String password){
        //实现登入
        //sysuserService.login(loginName,password);
        return "main";
    }
}
