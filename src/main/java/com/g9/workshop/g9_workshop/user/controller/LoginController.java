package com.g9.workshop.g9_workshop.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/user")
public class LoginController {

    // [GYEONG] 로그인
    @RequestMapping(value = "/login")
    public ModelAndView login(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/login/login");
        return modelAndView;
    }

    // [GYEONG] 로그아웃 우회
    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        new SecurityContextLogoutHandler().logout(request, response,
                SecurityContextHolder.getContext().getAuthentication());
        return "redirect:/";
    }

    // [GYEONG] 이메일 찾기
    @RequestMapping(value = "/findEmail")
    public ModelAndView FindId(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/login/find_email");
        return modelAndView;

    }

    // [GYEONG] 찾은 이메일 표시
    @RequestMapping(value = "/showEmail")
    public ModelAndView showEmail(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/login/show_email");
        return modelAndView;

    }

    // [GYEONG] 비밀번호 찾기
    @RequestMapping(value = "/findPassword")
    public ModelAndView findPassword(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/login/find_password");
        return modelAndView;

    }

    // [GYEONG] 찾은 비밀번호 표시
    @RequestMapping(value = "/showPassword")
    public ModelAndView showPassword(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/login/show_password");
        return modelAndView;

    }

}
