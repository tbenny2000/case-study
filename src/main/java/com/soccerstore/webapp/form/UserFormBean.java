package com.soccerstore.webapp.form;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserFormBean {

    @Email(message = "Please provide a valid email address")
    private String email;

    @Size(min = 2, max = 50, message = "First name must be between 2 and 50 characters")
    private String firstName;

    @Size(min = 2, max = 50, message = "Last name must be between 2 and 50 characters")
    private String lastName;

    private String password;
    private String confirmPassword;

    private String address;
    private String city;
    private String state;
    private String zip;
    private String phone;
    private String country;
    private String imageUrl;
}
