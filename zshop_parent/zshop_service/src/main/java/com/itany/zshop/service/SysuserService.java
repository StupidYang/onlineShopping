package com.itany.zshop.service;

import com.itany.zshop.common.exception.SysuserNotExistException;
import com.itany.zshop.params.SysuserParam;
import com.itany.zshop.pojo.Sysuser;
import com.itany.zshop.vo.SysuserVo;

import java.util.List;

/**
 * Author：汤小洋
 * Date：2018-04-28 9:22
 * Description：<描述>
 */
public interface SysuserService {

    public List<Sysuser> findAll();

    public Sysuser findById(int id);

    public void add(SysuserVo sysuserVo);

    public void modify(SysuserVo sysuserVo);

    public void modifyStatus(int id);

    List<Sysuser> findByParams(SysuserParam sysuserParam);

    Sysuser login(String loginName, String password) throws SysuserNotExistException;
}
