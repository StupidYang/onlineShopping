package com.shopping.controller;

import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.Comment;
import com.shopping.entity.Reply;
import com.shopping.service.CommentService;
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
public class CommentController {
    @Resource
    private CommentService CommentService;

    @Resource
    private ShoppingRecordService shoppingRecordService;

    @RequestMapping(value = "/addShoppingComment",method = RequestMethod.POST)//映射jsp中的请求路径
    @ResponseBody
    public Map<String,Object> addShoppingComment(int userId, int productId, String content){

        String result = null;
        if(shoppingRecordService.getUserProductRecord(userId,productId)){
            Comment Comment = new Comment();
            Comment.setUserId(userId);
            Comment.setProductId(productId);
            Date date = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
            Comment.setTime(sf.format(date));
            Comment.setContent(content);
            CommentService.addComment(Comment);
            result = "success";
        }
        else{
            result="noneRecord";
        }

        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    //删除评论
    @RequestMapping(value = "/deleteShoppingComment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteShoppingComment(int userId, int productId, String time) {
        CommentService.deleteComment(userId, productId, time);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", "success");

        return resultMap;
    }

    @RequestMapping(value = "/getShoppingComments",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getShoppingComments(int productId){
        List<Comment> CommentList = CommentService.getProductComment(productId);
        String Comments = JSONArray.toJSONString(CommentList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",Comments);
        return resultMap;
    }
}





