package com.soccerstore.webapp.form;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
public class CreateUserFormBean {

    private Integer id;

    // JSR 303 Annotations
    // https://www.geeksforgeeks.org/spring-bean-validation-jsr-303-annotations/

    @Length(max = 50, message = "First name must be less than 50 characters.")
    @NotEmpty(message = "First Name is required.")
    private String firstName;

    @Length(max = 50, message = "Last name must be less than 50 characters.")
    @NotEmpty(message = "Last name is required.")
    private String lastName;

    @Length(max = 50, message = "Email must be less than 50 characters.")
    @NotEmpty(message = "Email address is required.")
    private String email;

    @Length(max = 50, message = "Password must be less than 50 characters.")
    @NotEmpty(message = "Password is required.")
    private String password;

    @Length(max = 50, message = "Phone number must be less than 50 characters.")
    @NotEmpty(message = "Phone number is required.")
    private String phone;

    @Length(max = 50, message = "Address must be less than 50 characters.")
    @NotEmpty(message = "Address is required.")
    private String address;

    @Length(max = 50, message = "City must be less than 50 characters.")
    @NotEmpty(message = "City name is required.")
    private String city;

    @Length(max = 50, message = "State must be less than 2 characters.")
    @NotEmpty(message = "State is required.")
    private String state;

    @Length(max = 50, message = "Zip code must be less than 10 characters.")
    @NotEmpty(message = "Zip code name is required.")
    private String zip;

    @Length(max = 50, message = "Country must be less than 50 characters.")
    @NotEmpty(message = "Country name is required.")
    private String country;


    private MultipartFile upload;


    private Integer employeeId;
}
