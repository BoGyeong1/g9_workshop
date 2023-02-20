package com.g9.workshop.g9_workshop.user.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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

    // [GYEONG] 회원가입 약관 안내
    @RequestMapping(value = "/agreeTerms")
    public ModelAndView agreeTerms(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/signup/agree_terms");
        return modelAndView;

    }

    // [GYEONG] 회원가입
    @RequestMapping(value = "/signup")
    public ModelAndView signup(MultipartHttpServletRequest multipartHttpServletRequest,
            @RequestParam Map<String, Object> params, ModelAndView modelAndView) throws IOException {

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
