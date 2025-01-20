package com.soccerstore.webapp.database.dao;

import com.soccerstore.webapp.database.entity.Product;

public class CartItemDTO {
    private Product product;
    private Integer quantity;
    private Double price;

    // Getters and Setters
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
