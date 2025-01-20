package com.soccerstore.webapp.form;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
public class CreateProductFormBean {

    private MultipartFile imageFile;
    // this will be populated when we are editing a product
    // it will be null if this is a create product
    private Integer id;

    @NotEmpty(message = "Name is required")
    private String name;

    @NotNull(message = "Price is required")
    private Double price;

    @Min(value = 0, message = "Stock quantity cannot be negative")
    @NotNull(message = "Stock quantity is required")
    private Integer stockQuantity;

    @NotNull(message = "Category is required")
    private String category;

    private String description;
    private String imageUrl;
}
