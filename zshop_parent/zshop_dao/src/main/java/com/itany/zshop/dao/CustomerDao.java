package com.itany.zshop.dao;

import com.itany.zshop.pojo.Customer;
import org.apache.ibatis.annotations.Param;

public interface CustomerDao {
    public Customer selectByPassword(@Param("loginName") String loginName,@Param("password") String password, @Param("isValid") Integer isValid);
    Customer findById(Integer id);
    public void insertCustomer(Customer customer);
}
