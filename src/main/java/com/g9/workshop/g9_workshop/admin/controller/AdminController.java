package com.g9.workshop.g9_workshop.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.admin.service.AdminRegi;
import com.g9.workshop.g9_workshop.configurations.PrincipalAdmin;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminRegi adminRegi;

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
    @GetMapping({ "/home", "" })
    public ModelAndView adminMain(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/common/main");
        return modelAndView;
    }

    // [GYEONG] Admin 가입폼
    @GetMapping({ "/register" })
    public ModelAndView adminRegisterForm(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/common/regi");
        return modelAndView;
    }

    // [GYEONG] Admin regi -> login
    @PostMapping("/regiSucess")
    public ModelAndView adminRegiSucess(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        adminRegi.insertAdmin(params);
        modelAndView.setViewName("admin/common/login");
        return modelAndView;
    }

    // [GYEONG] 로그아웃 우회
    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        new SecurityContextLogoutHandler().logout(request, response,
                SecurityContextHolder.getContext().getAuthentication());
        return "redirect:/admin/login";
    }

}
