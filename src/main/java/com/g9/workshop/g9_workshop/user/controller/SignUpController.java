package com.g9.workshop.g9_workshop.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignUpController {
    // TO DO 회원가입

    // [GYEONG] 회원가입 방식 선택
    @RequestMapping(value = "/selectSignup")
    public ModelAndView select_signup(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/signup/select_signup");
        return modelAndView;
    }

    // [GYEONG] 회원가입
    @RequestMapping(value = "/agreeTerms")
    public ModelAndView agreeTerms(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/signup/agree_terms");
        return modelAndView;

    }

    // [GYEONG] 회원가입
    @RequestMapping(value = "/signup")
    public ModelAndView signup(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/signup/signup");
        return modelAndView;

    }

    // [GYEONG] 웰컴페이지
    @RequestMapping(value = "/welcome")
    public ModelAndView welcome(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/signup/welcome");
        return modelAndView;

    }
}
