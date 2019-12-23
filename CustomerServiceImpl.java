package com.itany.zshop.service.impl;

import com.itany.zshop.common.constant.CustomerConstant;
import com.itany.zshop.common.exception.LoginErrorException;
import com.itany.zshop.dao.CustomerDao;
import com.itany.zshop.pojo.Customer;
import com.itany.zshop.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public Customer findById(Integer id) {
        return customerDao.findById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Customer login(String loginName,String password)throws LoginErrorException{
        Customer customer=customerDao.selectByPassword(loginName,password, CustomerConstant.CUSTOMER_VALID);
        if (customer==null)
            throw new LoginErrorException("登陆失败，用户名或密码不正确");
        return customer;
    }

    @Override
    public void regist(Customer customer){
        customerDao.insertCustomer(customer);

    }

    @Override
    public Customer update(Customer customer) {
        customerDao.update(customer);
        return customerDao.findById(customer.getId());
    }
}
