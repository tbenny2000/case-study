package com.soccerstore.webapp.database.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orders")
public class Order {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Integer id;

        @Column(name = "users_id")
        private Integer userId;

        @Column(name = "order_status")
        private String orderStatus;

        @Column(name = "order_date", columnDefinition = "datetime(6)")
        private LocalDateTime orderDate;

        @Column(name = "comments")
        private String comments;
}
