package com.soccerstore.webapp.controller;

import com.soccerstore.webapp.security.AuthenticatedUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

    @Autowired
    private AuthenticatedUserService authenticatedUserService;


    @GetMapping("/admin/dashboard")
    public ModelAndView dashboard() throws Exception {
        ModelAndView response = new ModelAndView("admin/dashboard");

        String user = authenticatedUserService.getCurrentUsername();
        log.debug(user.toString());

        return response;
    }


}
