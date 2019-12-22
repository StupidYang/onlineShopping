package com.itany.zshop.dao;

import com.itany.zshop.pojo.Board;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface BoardDao {
    List<Board> findAll();
    void updateById(Board board);
    void insert(Board board);
}
