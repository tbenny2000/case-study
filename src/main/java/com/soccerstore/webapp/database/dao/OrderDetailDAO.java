package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {
    List<OrderDetail> findByOrdersId(Integer orderId);

    List<OrderDetail> findByOrdersIdAndProductId(Integer id, Integer id1);
}
