package com.itany.zshop.service.impl;

import com.itany.zshop.dao.BoardDao;
import com.itany.zshop.pojo.Board;
import com.itany.zshop.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardDao boardDao;

    @Override
    public List<Board> findAll() {
        return boardDao.findAll();
    }

    @Override
    public void updateByid(Board board) {
        boardDao.updateById(board);
    }

    @Override
    public void insert(Board board) {
        boardDao.insert(board);
    }
}
