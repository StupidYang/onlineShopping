package com.shopping.controller;

import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.Post;
import com.shopping.entity.Reply;
import com.shopping.service.PostService;
import com.shopping.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReplyController {
    @Resource
    private ReplyService replyService;

    @RequestMapping(value = "/getReply", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getReply(int postId) {
        List<Reply> ReplyList = replyService.getReplyByPostId(postId);
        String Replies = JSONArray.toJSONString(ReplyList);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", Replies);
        return resultMap;
    }

    @RequestMapping(value = "/addReply", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addReply(int userId, int postId, String content) {
        String result = null;
        Reply reply = new Reply();
        reply.setUserId(userId);
        reply.setPostId(postId);
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        reply.setTime(sf.format(date));
        reply.setContent(content);
        replyService.addReply(reply);
        result = "success";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }

    @RequestMapping(value = "/getReplyByUserId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getReplyByUserId(int userId) {
        List<Reply> ReplyList = replyService.getReplyByUserId(userId);
        String Replies = JSONArray.toJSONString(ReplyList);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", Replies);
        return resultMap;
    }

    @RequestMapping(value = "/deleteReplyByReplyId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteReplyByReplyId(int id) {
        replyService.deleteReplyByReplyId(id);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", "success");
        return resultMap;
    }

    @RequestMapping(value = "/getAllReply",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllReply() {
        List<Reply> ReplyList = replyService.getAllReply();
        String Replies = JSONArray.toJSONString(ReplyList);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", Replies);
        return resultMap;
    }
}