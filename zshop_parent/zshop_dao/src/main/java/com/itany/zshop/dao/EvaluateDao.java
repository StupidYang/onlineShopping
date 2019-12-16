package com.itany.zshop.dao;

import com.itany.zshop.pojo.Evaluate;

import java.util.List;

public interface EvaluateDao {
    List<Evaluate> findByPid(Integer product_id);
    void insert(Evaluate evaluate);
}
