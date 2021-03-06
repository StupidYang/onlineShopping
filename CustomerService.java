package com.itany.zshop.service;

import com.itany.zshop.common.exception.LoginErrorException;
import com.itany.zshop.pojo.Customer;

public interface CustomerService {
    public Customer login(String loginName,String password)throws LoginErrorException;
    Customer findById(Integer id);
    public void regist(Customer customer);
    Customer update(Customer customer);
}
