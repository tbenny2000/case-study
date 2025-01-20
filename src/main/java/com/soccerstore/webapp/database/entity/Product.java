package com.soccerstore.webapp.database.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "Name is required")
    @Column(name ="name", length = 50)
    private String name;

    @NotNull(message = "Price is required")
    @Column(name="price", columnDefinition = "DECIMAL")
    private Double price;

    @Min(value = 0, message = "Stock quantity cannot be negative")
    @Column(name = "stock_quantity")
    private Integer stockQuantity;

    @NotBlank(message = "Category is required")
    @Column(name="category", length = 50)
    private String category;

    @Column(name="description", length = 500)
    private String description;

    @Column(name = "image_url")
    private String imageUrl;
}
