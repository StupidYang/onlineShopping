package com.itany.zshop.service;

import com.itany.zshop.pojo.Board;

import java.util.List;

public interface BoardService {
    List<Board> findAll();
    void updateByid(Board board);
    void insert(Board board);
}
