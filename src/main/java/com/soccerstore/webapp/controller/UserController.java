package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.database.dao.UserDAO;
import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.form.CreateUserFormBean;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // ============== SEARCHES FOR USERS ================
    @GetMapping("/user/search")
    public ModelAndView search(@RequestParam(required = false) String firstName) {
        ModelAndView response = new ModelAndView("user/search");
        response.addObject("search", firstName);

        List<User> users;
        if (firstName != null && !firstName.trim().isEmpty()) {
            users = userDAO.findByFirstNameContainingIgnoreCase(firstName);
        } else {
            users = userDAO.findAll();
        }
        response.addObject("usersKey", users);

        return response;
    }


    // ========== CREATING USER ============
    @GetMapping("/user/createUser")
    public ModelAndView showCreateForm() {
        ModelAndView response = new ModelAndView("user/create");
        response.addObject("form", new CreateUserFormBean());
        return response;
    }

    // ================ CREATING A NEW USER
    @PostMapping("/user/createUser")
    public ModelAndView submitCreateForm(@Valid CreateUserFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView();
        if (bindingResult.hasErrors()) {
            response.setViewName("user/create");
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            return response;
        }
        // Find existing user or create new one
        User user;
        if (form.getId() != null) {
            // If we have an ID, this is an edit
            user = userDAO.findById(form.getId());

            if (user == null) {
                user = new User();
            }
        } else {
            // If no ID, this is a new user
            user = new User();
        }

        // Update user properties
        user.setFirstName(form.getFirstName());
        user.setLastName(form.getLastName());
        user.setEmail(form.getEmail());


        // Only update password if one was provided in the form
        if (form.getPassword() != null && !form.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(form.getPassword()));
        }

        user.setPhone(form.getPhone());
        user.setAddress(form.getAddress());
        user.setCity(form.getCity());
        user.setState(form.getState());
        user.setZip(form.getZip());
        user.setCountry(form.getCountry());

        // Save the user
        user = userDAO.save(user);

        // Add debug logging
        log.debug("Saved user with ID: " + user.getId());

        response.setViewName("redirect:/user/search");
        return response;
    }

    // ============== EDITING USER
    @GetMapping("/user/edit/{userId}")
    public ModelAndView editUser(@PathVariable Integer userId) {
        ModelAndView response = new ModelAndView("user/create");

        User user = userDAO.findById(userId);
        if (user == null) {
            response.setViewName("redirect:/user/search");
            return response;
        }

        CreateUserFormBean form = new CreateUserFormBean();
        form.setId(user.getId());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setEmail(user.getEmail());
        form.setPhone(user.getPhone());
        form.setAddress(user.getAddress());
        form.setCity(user.getCity());
        form.setState(user.getState());
        form.setZip(user.getZip());
        form.setCountry(user.getCountry());

        response.addObject("form", form);
        return response;
    }
}