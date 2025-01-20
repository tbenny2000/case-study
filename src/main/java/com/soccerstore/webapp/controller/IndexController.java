package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.database.entity.User;
import com.soccerstore.webapp.security.AuthenticatedUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Slf4j
@Controller
public class IndexController {

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @GetMapping(value = {"/", "/index", "/index.html"})
    public ModelAndView index() {

        User user = authenticatedUserService.loadCurrentUser();

        // query the order from the DB using the username and email
        ModelAndView response = new ModelAndView("index");
        response.setViewName("index");
        return response;
    }

}
