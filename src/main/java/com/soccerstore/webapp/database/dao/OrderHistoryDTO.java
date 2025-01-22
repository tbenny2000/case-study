package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.Order;
import com.soccerstore.webapp.database.entity.OrderDetail;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OrderHistoryDTO {
    private Order order;
    private List<OrderDetail> details;
    private String formattedDate;
}
