package com.soccerstore.webapp.controller;

import jakarta.validation.Valid;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.stereotype.Controller;
import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.database.dao.UserDAO;
import com.soccerstore.webapp.security.AuthenticatedUserService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.soccerstore.webapp.form.UserFormBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//@Slf4j
@Controller
@RequestMapping("/user")
public class ProfileController {
    Logger log = LoggerFactory.getLogger(ProfileController.class);
    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/profile")
    public ModelAndView getProfile() {
        ModelAndView response = new ModelAndView("user/profile");

        User user = authenticatedUserService.loadCurrentUser();

        if (user == null) {
            log.error("No user found in session");
            response.setViewName("redirect:/login/login");
            return response;
        }

        log.debug("Loading profile for user: {}", user.getEmail());

        UserFormBean form = new UserFormBean();
        form.setEmail(user.getEmail());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setPhone(user.getPhone());
        form.setAddress(user.getAddress());
        form.setCity(user.getCity());
        form.setState(user.getState());
        form.setZip(user.getZip());
        form.setCountry(user.getCountry());
        form.setImageUrl(user.getImageUrl());

        response.addObject("form", form);
        return response;
    }

    @PostMapping("/profile")
    public ModelAndView updateProfile(@Valid @ModelAttribute("form") UserFormBean form,
                                      BindingResult bindingResult) {

        ModelAndView response = new ModelAndView("user/profile");

        if (bindingResult.hasErrors()) {
            log.error("Form validation errors: {}", bindingResult.getAllErrors());
            return response;
        }

        try {
            User user = authenticatedUserService.loadCurrentUser();

            if (user == null) {
                log.error("No user found in session during profile update");
                response.setViewName("redirect:/login/login");
                return response;
            }

            log.debug("Updating profile for user: {} (ID: {})", user.getEmail(), user.getId());

            // Log the changes
            log.debug("Profile changes - First Name: {} -> {}, Last Name: {} -> {}, Email: {} -> {}",
                    user.getFirstName(), form.getFirstName(),
                    user.getLastName(), form.getLastName(),
                    user.getEmail(), form.getEmail());

            // Update user information
            user.setFirstName(form.getFirstName());
            user.setLastName(form.getLastName());
            user.setEmail(form.getEmail());
            user.setPhone(form.getPhone());
            user.setAddress(form.getAddress());
            user.setCity(form.getCity());
            user.setState(form.getState());
            user.setZip(form.getZip());
            user.setCountry(form.getCountry());
            user.setImageUrl(form.getImageUrl());

            // Password update logic
            if (StringUtils.hasText(form.getPassword())) {
                if (!form.getPassword().equals(form.getConfirmPassword())) {
                    log.error("Password mismatch during update");
                    response.addObject("error", "Passwords do not match");
                    return response;
                }
                user.setPassword(passwordEncoder.encode(form.getPassword()));
                log.debug("Password updated for user: {}", user.getEmail());
            }

            // Save and verify
            User savedUser = userDAO.save(user);
            log.debug("User profile successfully updated in database. ID: {}", savedUser.getId());

            response.addObject("success", "Profile updated successfully!");

            // Refresh the form with the latest data
            form.setEmail(savedUser.getEmail());
            form.setFirstName(savedUser.getFirstName());
            form.setLastName(savedUser.getLastName());
            form.setPhone(savedUser.getPhone());
            form.setAddress(savedUser.getAddress());
            form.setCity(savedUser.getCity());
            form.setState(savedUser.getState());
            form.setZip(savedUser.getZip());
            form.setCountry(savedUser.getCountry());
            form.setImageUrl(savedUser.getImageUrl());
            form.setPassword("");
            form.setConfirmPassword("");

        } catch (Exception e) {
            log.error("Error updating profile", e);
            response.addObject("error", "Error updating profile: " + e.getMessage());
        }

        return response;
    }
}