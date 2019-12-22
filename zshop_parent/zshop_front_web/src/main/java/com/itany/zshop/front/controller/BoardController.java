package com.itany.zshop.front.controller;

import com.itany.zshop.pojo.Board;
import com.itany.zshop.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/front/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @RequestMapping("/boards")
    public String findAll(Model model){
        List<Board> boards =boardService.findAll();
        model.addAttribute("boards", boards);
        return "board";
    }

    @RequestMapping("/update")
    public String updateByid(Integer id, String replay){
        Board board = new Board();
        board.setId(id);
        board.setReplay(replay);
        boardService.updateByid(board);
        return "board";//回复
    }

    @RequestMapping("/insert")
    public String insert(@RequestParam("customer_id")Integer customer_id, @RequestParam("content")String content){
        Board board = new Board();
        board.setCustomer_id(customer_id);
        board.setContent(content);
        boardService.insert(board);
        return "board";//留言
    }
}
