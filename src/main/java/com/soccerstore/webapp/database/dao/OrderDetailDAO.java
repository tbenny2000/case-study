package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.Order;
import com.soccerstore.webapp.database.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {

        List<OrderDetail> findByOrderId(Integer orderId);

        List<OrderDetail> findByOrderIdAndProductId(Integer orderId, Integer productId);

        List<OrderDetail> findByProductId(Integer productId);

    List<OrderDetail> findByOrder(Order cart);

    OrderDetail findByOrderAndProductId(Order cart, Integer id);
}
