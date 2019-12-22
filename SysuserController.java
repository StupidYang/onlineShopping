package com.itany.zshop.backend.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itany.zshop.backend.vo.ProductVo;
import com.itany.zshop.common.constant.PaginationConstant;
import com.itany.zshop.common.exception.SysuserNotExistException;
import com.itany.zshop.common.util.ResponseResult;
import com.itany.zshop.dto.ProductDto;
import com.itany.zshop.dto.SysuserDto;
import com.itany.zshop.params.SysuserParam;
import com.itany.zshop.pojo.Role;
import com.itany.zshop.pojo.Sysuser;
import com.itany.zshop.service.RoleService;
import com.itany.zshop.service.SysuserService;
import com.itany.zshop.vo.SysuserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Author：汤小洋
 * Date：2018-04-26 11:01
 * Description：<描述>
 */
@Controller
@RequestMapping("/backend/sysuser")
public class SysuserController {

    @Autowired
    private SysuserService sysuserService;

    @Autowired
    private RoleService roleService;

    @RequestMapping("/login")
    public String login(String loginName,String password,HttpSession session,Model model){
        try {
            Sysuser sysuser=sysuserService.login(loginName,password);
            session.setAttribute("sysuser",sysuser);

            if(sysuser.getRole().getId()==3)
                return "main";
            else if(sysuser.getRole().getId()==2)
                return "sellerApply";
            else
                return "productManager";

        } catch (SysuserNotExistException e) {
            model.addAttribute("errorMsg",e.getMessage());
            return "login";
            //e.printStackTrace();
        }

    }

    @RequestMapping("/findAll")
    public String findAll(Integer pageNum,Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum= PaginationConstant.PAGE_NUM;
        }

        PageHelper.startPage(pageNum, PaginationConstant.PAGE_SIZE);
        List<Sysuser> sysusers = sysuserService.findAll();
        PageInfo<Sysuser> pageInfo = new PageInfo<Sysuser>(sysusers);
        model.addAttribute("pageInfo",pageInfo);

        return "sysuserManager";
    }

    @RequestMapping("/findByParams")
    public String findByParams(SysuserParam sysuserParam, Integer pageNum, Model model){
        if(ObjectUtils.isEmpty(pageNum)){
            pageNum= PaginationConstant.PAGE_NUM;
        }

        PageHelper.startPage(pageNum, PaginationConstant.PAGE_SIZE);
        List<Sysuser> sysusers=sysuserService.findByParams(sysuserParam);
        PageInfo<Sysuser> pageInfo = new PageInfo<Sysuser>(sysusers);
        model.addAttribute("pageInfo",pageInfo);
        //实现数据回显
        model.addAttribute("sysuserParam",sysuserParam);

        return "sysuserManager";
    }

    @RequestMapping("/findById")
    @ResponseBody
    public ResponseResult findById(int id){
        Sysuser sysuser=sysuserService.findById(id);
        return ResponseResult.success(sysuser);
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(SysuserVo sysuserVo){
        sysuserService.add(sysuserVo);
        return ResponseResult.success();
    }

    @ModelAttribute("roles")
    public List<Role> loadRoles(){
        return roleService.findAll();
    }

    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(int id){
        sysuserService.modifyStatus(id);
        return ResponseResult.success();
    }

    @RequestMapping("/modify")
    public String modify(SysuserVo sysuserVo, Integer pageNum,  Model model){
        //将vo转化为dto
        try {
            SysuserDto sysuserDto = new SysuserDto();
            sysuserDto.setId(sysuserVo.getId());
            sysuserDto.setName(sysuserVo.getName());
            sysuserDto.setLoginName(sysuserVo.getLoginName());
            sysuserDto.setPassword(sysuserVo.getPassword());
            sysuserDto.setEmail(sysuserVo.getEmail());
            sysuserDto.setPhone(sysuserVo.getPhone());
            sysuserService.modify(sysuserDto);
            model.addAttribute("successMsg","修改成功");
        }catch (Exception e){
            //e.printStackTrace();
            model.addAttribute("errorMsg",e.getMessage());
        }
        return "forward:findAll?pageNum="+pageNum;
    }

}
