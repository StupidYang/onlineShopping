package com.itany.zshop.service;

import com.itany.zshop.pojo.Order;

public interface ItemService {
    public void addItem(Order order);
    public void deleteItem(int orderId);
}
