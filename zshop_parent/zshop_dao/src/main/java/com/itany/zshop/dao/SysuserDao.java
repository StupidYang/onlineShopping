package com.itany.zshop.dao;

import com.itany.zshop.params.SysuserParam;
import com.itany.zshop.pojo.Sysuser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Author：汤小洋
 * Date：2018-04-28 9:22
 * Description：<描述>
 */
public interface SysuserDao {

    public List<Sysuser> selectAll();

    public Sysuser selectById(int id);

    public void insert(Sysuser sysuser);

    public void update(Sysuser sysuser);

    public void updateStatus(@Param("id") int id, @Param("isValid") int isValid);

    List<Sysuser> selectByParams(SysuserParam sysuserParam);

    Sysuser selectByLoginNameAndPassword(@Param("loginName") String loginName, @Param("password") String password, @Param("isValid") int isValid);
}
