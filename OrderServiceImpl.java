package com.itany.zshop.service.impl;

import com.itany.zshop.dao.OrderDao;
import com.itany.zshop.pojo.Order;
import com.itany.zshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public void addOrder(Order order){
        orderDao.insert(order);
    }
    @Override
    public int findByNo(String no){
        return orderDao.selectByNo(no);
    }
    @Override
    public List<Order> findAll(int customerId){
        return orderDao.selectByCustomerId(customerId);
    }
    @Override
    public void deleteOrder(int orderId){
        orderDao.deleteById(orderId);
    }
}
