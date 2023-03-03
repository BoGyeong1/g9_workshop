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

    // [SOO] Main > 장바구니
    @GetMapping("")
    public ModelAndView cart(ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        Object cartList = cartService.getCartList(userUid);
        modelAndView.addObject("cartList", cartList);
        modelAndView.setViewName("user/cart/cart");
        return modelAndView;
    }

    // [SOO] Product > 장바구니
    @PostMapping("")
    public ModelAndView cartInsert(ModelAndView modelAndView, @RequestParam Map params) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        params.put("user-uid", userUid);
        cartService.insertCart(params);
        Object cartList = cartService.getCartList(userUid);
        modelAndView.addObject("cartList", cartList);
        modelAndView.setViewName("user/cart/cart");
        return modelAndView;
    }

    @PostMapping("/delete")
    public String cartDelete(@RequestParam Map params) {
        cartService.deleteCart(params);
        return "redirect:/cart";
    }

}
