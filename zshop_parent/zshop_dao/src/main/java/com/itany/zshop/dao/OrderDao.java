package com.itany.zshop.dao;

import com.itany.zshop.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    public void insert(Order order);
    public int selectByNo(@Param("no") String no);
    public List<Order> selectByCustomerId(@Param("customerId")int customerId);
    public void deleteById(@Param("orderId") int orderId);
}
