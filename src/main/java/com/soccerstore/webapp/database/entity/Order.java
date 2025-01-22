package com.soccerstore.webapp.database.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.time.ZoneId;
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

        @Column(name = "order_status")
        private String orderStatus;

        @Column(name = "order_date", columnDefinition = "DATETIME(6)")
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private LocalDateTime orderDate;

        @Column(name = "comments")
        private String comments;

        @ManyToOne
        @JoinColumn(name = "users_id", nullable = false)
        @ToString.Exclude
        private User user;
}

