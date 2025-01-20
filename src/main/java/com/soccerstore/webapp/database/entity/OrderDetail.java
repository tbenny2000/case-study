package com.soccerstore.webapp.database.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orderdetails")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "price", columnDefinition = "decimal(10,2)")
    private Double price;

    @Column(name = "products_id")
    private Integer productId;

    @Column(name = "orders_id")
    private Integer ordersId;
}
