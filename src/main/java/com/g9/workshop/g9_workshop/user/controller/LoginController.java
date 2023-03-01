package com.g9.workshop.g9_workshop.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.user.service.LoginService;

@Controller
@RequestMapping(value = "/user")
public class LoginController {

    @Autowired
    LoginService loginService;

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
    public ModelAndView showEmail(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = loginService.findEmail(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("/user/login/show_email");
        return modelAndView;

    }

    // [GYEONG] 비밀번호 찾기
    @RequestMapping(value = "/findPassword")
    public ModelAndView findPassword(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/login/find_password");
        return modelAndView;

    }

    @RequestMapping(value = "/showPassword", method = RequestMethod.POST)
    public ModelAndView showPassword(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {

        // 비밀번호 찾기 정보 확인
        Object password = loginService.matchUserInfo(params);

        if (password != null) {
            // 임시 비밀번호 생성
            String tempPassword = generateTempPassword();
            params.put(("PASSWORD"), tempPassword);

            // 임시 비밀번호 DB에 업데이트
            loginService.updateUserPassword(params);

            // 임시 비밀번호 화면에 표시
            modelAndView.addObject("tempPassword", tempPassword);
            modelAndView.setViewName("/user/login/show_password");
        } else {
            // 유효하지 않은 정보일 경우 에러 페이지로 이동
            Map error = new HashMap<>();
            error.put("error", "찾으시는 회원 정보가 없습니다.");
            modelAndView.addObject("error", error);
            modelAndView.setViewName("/user/login/find_password");
            return modelAndView;

        }

        return modelAndView;
    }

    private String generateTempPassword() {
        // 생성할 임시 비밀번호 길이
        int passwordLength = 8;
        // 임시 비밀번호 문자열 초기화
        String tempPassword = "";
        // 사용할 문자셋 (영문 대문자, 영문 소문자, 숫자)
        String charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        // 임시 비밀번호 생성
        for (int i = 0; i < passwordLength; i++) {
            int index = (int) (Math.random() * charset.length());
            tempPassword += charset.charAt(index);
        }

        return tempPassword;
    }

}
