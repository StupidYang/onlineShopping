package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.User;
import com.shopping.service.UserService;
import com.shopping.utils.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class UserController {

    @Resource
    UserService userService;


    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/change_info")
    public String change_info() {
        return "change_info";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/main")
    public String main() {
        return "main";
    }

    @RequestMapping(value = "/control")
    public String control() {
        return "control";
    }

    @RequestMapping(value = "/shopcontrol")
    public String shopcontrol() {
        return "shopcontrol";
    }

    @RequestMapping(value = "/userPost")
    public String postcontrol() {
        return "userPost";
    }
    //跳转到修改商品页面
    @RequestMapping(value = "/change_product")
    public String change_product(){
        return "change_product";
    }
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doLogin(String userNameOrEmail, String password,String code, String inputStr, HttpSession httpSession) {
        System.out.println("我接收到了登录请求" + userNameOrEmail + " " + password+ " "+inputStr);
        String result = "fail";
        User user = userService.getUser(userNameOrEmail);
        if(code.equals(inputStr)) {
            if (user == null)
                result = "unexist";
            else {

                //UserDetail userDetail = userDetailService.getUserDetail(user.getId());

                if (user.getPassword().equals(password)) {
                    result = "success";
                    httpSession.setAttribute("currentUser", user);
                } else
                    result = "wrong";
            }
        }
        else{
            result="notCode";
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doRegister(String userName, String email, String nickName, String password, String phoneNumber, int sex, String birthday, String postNumber, String address, int role) {

        String result = "fail";
        User user = userService.getUser(userName);
        if (user != null) {
            result = "nameExist";
        } else {
            user = userService.getUser(email);
            if (user != null)
                result = "emailExist";
            else {
                User user1 = new User();
                user1.setName(userName);
                System.out.println(userName);
                user1.setEmail(email);
                System.out.println(email);
                user1.setNickName(nickName);
                System.out.println(nickName);
                user1.setRole(role);
                user1.setAddress(address);
                user1.setBirthday(birthday);
                user1.setPassword(password);
                user1.setPhoneNumber(phoneNumber);
                user1.setSex(sex);
                user1.setPostNumber(postNumber);

                Date date = new Date();
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                user1.setRegisterTime(sf.format(date));
                userService.addUser(user1);
                result = "success";
            }
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/doUpdate", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doUpdate(String userName, String email, String nickName, String password, String phoneNumber, int sex, String birthday, String postNumber, String address) {
        String result = "fail";
        User user = userService.getUser(userName);
        user.setEmail(email);
        user.setNickName(nickName);
        user.setAddress(address);
        user.setBirthday(birthday);
        user.setPassword(password);
        user.setPhoneNumber(phoneNumber);
        user.setSex(sex);
        user.setPostNumber(postNumber);
        userService.updateUser(user);
//        UserDetail userDetail = userDetailService.getUserDetail(user.getId());
//        userDetail.setAddress(address);
//        userDetail.setBirthday(birthday);
//        userDetail.setPassword(password);
//        userDetail.setPhoneNumber(phoneNumber);
//        userDetail.setSex(sex);
//        userDetail.setPostNumber(postNumber);
//        userDetailService.updateUserDetail(userDetail);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllUser() {
//        System.out.println("我接收到了获取用户请求");
        List<User> userList = new ArrayList<>();
        userList = userService.getAllUser();
        String allUsers = JSONArray.toJSONString(userList);
//        System.out.println("我返回的结果是"+allUsers);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("allUsers", allUsers);
        return resultMap;
    }


    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    @ResponseBody
    public Response deleteUser(int id) {
        return userService.deleteUser(id);
    }

    @RequestMapping(value = "/getUserAddressAndPhoneNumber", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserAddressAndPhoneNumber(int id) {
        String address = userService.getUser(id).getAddress();
        String phoneNumber = userService.getUser(id).getPhoneNumber();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("address", address);
        resultMap.put("phoneNumber", phoneNumber);
        return resultMap;
    }

    @RequestMapping(value = "/doLogout")
    public String doLogout(HttpSession httpSession) {
        httpSession.setAttribute("currentUser", "");
        return "redirect:login";
    }

    @RequestMapping(value = "/getUserById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getUserById(int id) {
        User user = userService.getUser(id);
        String result = JSON.toJSONString(user);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getAllShopowners")
    @ResponseBody
    public Map<String, Object> getAllShopowners() {
        List<User> shopownerList = new ArrayList<>();
        shopownerList = userService.getAllShopowners();
        String allShopowners = JSONArray.toJSONString(shopownerList);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("allShopowners", allShopowners);
        return resultMap;
    }


}
