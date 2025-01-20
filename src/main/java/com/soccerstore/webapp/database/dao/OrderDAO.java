package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDAO extends JpaRepository<Order, Integer> {
    Order findByUserIdAndOrderStatus(Integer userId, String orderStatus);

}
