package com.soccerstore.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ErrorController {

    @GetMapping("/error")
    public String handleError(@RequestParam(name = "status", required = false) Integer status) {
        if (status != null) {
            if (status == 404) {
                return "error/404"; // Return custom 404.jsp
            }
        }
        return "error"; // Redirect to a generic error page or homepage if necessary
    }
}

