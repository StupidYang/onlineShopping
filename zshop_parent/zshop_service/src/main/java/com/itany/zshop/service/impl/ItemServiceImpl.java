package com.itany.zshop.service.impl;

import com.itany.zshop.dao.ItemDao;
import com.itany.zshop.pojo.Order;
import com.itany.zshop.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemDao itemDao;

    @Override
    public void addItem(Order order){
        itemDao.insert(order);
    }
    @Override
    public void deleteItem(int orderId){
        itemDao.deleteByOrderId(orderId);
    }
}
