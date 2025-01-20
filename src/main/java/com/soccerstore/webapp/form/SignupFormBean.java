package com.soccerstore.webapp.form;

import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
// this is optional to figure out if you want to try
//@TwoFieldsAreEqual(fieldOneName = "confirmPassword", fieldTwoName = "password", message = "Password and Conform Password must be the same.")
public class SignupFormBean {

    @NotEmpty(message = "Username is required")
    private String username;

    @NotEmpty(message = "Password is required")
    private String password;

    @NotEmpty(message = "Full Name is required")
    private String fullname;
}
