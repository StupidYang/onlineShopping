package com.itany.zshop.service;

import com.itany.zshop.pojo.Order;

import java.util.List;

public interface OrderService {
    public void addOrder(Order order);
    public int findByNo(String no);
    public List<Order> findAll(int customerId);
    public void deleteOrder(int orderId);
}
