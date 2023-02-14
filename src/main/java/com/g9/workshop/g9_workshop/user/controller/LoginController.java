package com.g9.workshop.g9_workshop.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    // [GYEONG] 로그인
    @RequestMapping(value = "/login")
    public ModelAndView login(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/login/login");
        return modelAndView;

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
