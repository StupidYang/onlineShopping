package com.itany.zshop.service.impl;

import com.itany.zshop.dao.EvaluateDao;
import com.itany.zshop.pojo.Evaluate;
import com.itany.zshop.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluateServiceImpl implements EvaluateService {

    @Autowired
    EvaluateDao evaluateDao;


    @Override
    public List<Evaluate> findByPid(Integer id) {
        return evaluateDao.findByPid(id);
    }

    @Override
    public void insert(Evaluate evaluate) {
        evaluateDao.insert(evaluate);
    }
}
