package com.itany.zshop.dao;

import com.itany.zshop.pojo.Order;
import org.apache.ibatis.annotations.Param;

public interface ItemDao {
    public void insert(Order order);
    public void deleteByOrderId(@Param("orderId") int orderId);
}
