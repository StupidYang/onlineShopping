package com.itany.zshop.service;

import com.itany.zshop.pojo.Evaluate;

import java.util.List;

public interface EvaluateService {
    List<Evaluate> findByPid(Integer id);
    void insert(Evaluate evaluate);
}
