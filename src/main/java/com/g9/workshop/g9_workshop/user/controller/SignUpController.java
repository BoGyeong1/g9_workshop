package com.g9.workshop.g9_workshop.user.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.user.service.SignUpService;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Controller
public class SignUpController {
    // TO DO 회원가입

    @Autowired
    SignUpService signUpService;

    @Autowired
    CommonUtils commonUtils;

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
    public ModelAndView signup(@RequestParam Map<String, Object> params, ModelAndView modelAndView) throws IOException {
        modelAndView.setViewName("/user/signup/signup");
        return modelAndView;

    }

    // [GYEONG] 회원가입 아이디 중복체크
    @ResponseBody
    @RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
    public int emailCheck(@RequestParam("email") String email) {
        int cnt = (int) signUpService.emailCheck(email);
        return cnt;
    }

    // [GYEONG] 웰컴페이지
    @RequestMapping(value = "/welcome", method = RequestMethod.POST)
    public ModelAndView welcome(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        params.put("ADDRESS_UID", commonUtils.getUniqueSequence());
        signUpService.signUp(params);
        modelAndView.setViewName("/user/signup/welcome");
        return modelAndView;

    }
}
