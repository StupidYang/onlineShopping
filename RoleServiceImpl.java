package com.itany.zshop.service.impl;

import com.itany.zshop.dao.RoleDao;
import com.itany.zshop.pojo.Role;
import com.itany.zshop.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    @Transactional(propagation =  Propagation.SUPPORTS)
    public List<Role> findAll() {
        return roleDao.selectAll();
    }
}
