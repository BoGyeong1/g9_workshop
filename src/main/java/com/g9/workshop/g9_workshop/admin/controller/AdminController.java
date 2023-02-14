package com.g9.workshop.g9_workshop.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/login")
    public ModelAndView adminLogin(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/login");
        return modelAndView;
    }

}
