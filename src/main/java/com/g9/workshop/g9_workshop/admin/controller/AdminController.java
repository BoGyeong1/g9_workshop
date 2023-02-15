package com.g9.workshop.g9_workshop.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    // [SOO] Admin Login
    @GetMapping("/login")
    public ModelAndView adminLogin(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/common/login");
        return modelAndView;
    }

    // [SOO] Admin Logout
    @PostMapping("/login")
    public ModelAndView adminLogout(HttpSession session, ModelAndView modelAndView) {
        session.invalidate();
        modelAndView.setViewName("admin/common/login");
        return modelAndView;
    }

    // [SOO] Admin Main
    @GetMapping({ "", "/home" })
    public ModelAndView adminMain(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/common/main");
        return modelAndView;
    }

}
