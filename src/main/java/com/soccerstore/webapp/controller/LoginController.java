package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.database.dao.UserDAO;
import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.form.SignUpFormBean;
import com.soccerstore.webapp.security.AuthenticatedUserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    //============= LOGIN PAGE =======================
    // this get mpapping is called by spring security when a secure resource is requested
    // needs to match the spring securtiy configuration  .loginPage method
    @GetMapping("/login/login")
    public ModelAndView theLoginPage() {
        ModelAndView response = new ModelAndView();

        response.setViewName("login/loginPage");

        return response;
    }

    // ================== SIGN UP PAGE ====================
    @GetMapping("/login/signup")
    public ModelAndView signup() {
        ModelAndView response = new ModelAndView();

        response.setViewName("login/signup");

        return response;
    }

    // WE ARE DOING THIS AS A POST NOT A GET
    @PostMapping("/login/signupSubmit")
    public ModelAndView signupSubmit(@Valid SignUpFormBean form, BindingResult bindingResult, HttpSession session) {
        ModelAndView response = new ModelAndView();

        if ( bindingResult.hasErrors() ) {
            response.setViewName("login/signup");
            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);

        } else {
            User user = new User();

            user.setEmail(form.getUsername());
            user.setLastName(form.getFullname());

            // first we need to encrypt the incoming password before saving it to the database
            // the password in the form is in plain text, but we want to save to the database encrypted
            String encryptedPassword = passwordEncoder.encode(form.getPassword());
            user.setPassword(encryptedPassword);

            userDAO.save(user);

            // since this is a new user we can manually authenticate them for the first time
            authenticatedUserService.changeLoggedInUsername(session,form.getUsername(),form.getPassword());

            // redirect back to the index page or home page
            response.setViewName("redirect:/");
        }
        return response;
    }
}
