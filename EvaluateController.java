package com.itany.zshop.front.controller;

import com.itany.zshop.pojo.Evaluate;
import com.itany.zshop.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/front/evaluate")
public class EvaluateController {

    @Autowired
    private EvaluateService evaluateService;

    @RequestMapping("/evaluates")
    @ResponseBody
    public List<Evaluate> findAll(Integer pid){
        List<Evaluate> evaluates = evaluateService.findByPid(pid);
        System.out.println(evaluates);
        return evaluates;
    }

    @RequestMapping("/insert")
    public String inset(Evaluate evaluate){
        evaluateService.insert(evaluate);
        return "details";//改成刷新写留言板的页面。给了回复，顺便刷新页面显示回复
    }
}
