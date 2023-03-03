package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.configurations.PrincipalUser;
import com.g9.workshop.g9_workshop.user.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CartService cartService;

    @GetMapping("")
    public ModelAndView cart(ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();

        Object cartList = cartService.getCartList(userUid);

        return modelAndView;

    }

    @PostMapping("")
    public ModelAndView cartInsert(ModelAndView modelAndView, @RequestParam Map params) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();

        Object cartList = cartService.getCartList(userUid);

        return modelAndView;

    }

}
