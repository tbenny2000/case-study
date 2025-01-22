package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.database.dao.UserDAO;
import com.soccerstore.webapp.database.dao.UserRoleDAO;
import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.database.entity.UserRole;
import com.soccerstore.webapp.form.SignupFormBean;
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
    private UserRoleDAO userRoleDAO;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    //============= LOGIN PAGE =======================
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

    // ============== SUBMITTING LOGGING IN =================
    @PostMapping("/login/signupSubmit")
    public ModelAndView signupSubmit(@Valid SignupFormBean form, BindingResult bindingResult, HttpSession session) {
        ModelAndView response = new ModelAndView();

        if (bindingResult.hasErrors()) {
            response.setViewName("login/signup");
            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);

        } else {
            // Create a new User object
            User user = new User();
            user.setEmail(form.getUsername());
            user.setFirstName(form.getFullname());

            // Encrypt the password and set it
            String encryptedPassword = passwordEncoder.encode(form.getPassword());
            user.setPassword(encryptedPassword);

            // Save the user
            userDAO.save(user);

            // Create and save the user role
            UserRole userRole = new UserRole();
            userRole.setUser(user);  // Associate the user object with the user role
            userRole.setRoleName("USER"); // Set the role name
            userRoleDAO.save(userRole);

            // Manually authenticate the new user
            authenticatedUserService.changeLoggedInUsername(session, form.getUsername(), form.getPassword());

            response.setViewName("redirect:/");
        }
        return response;
    }

}
