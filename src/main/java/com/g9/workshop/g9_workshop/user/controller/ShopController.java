package com.g9.workshop.g9_workshop.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop")
public class ShopController {

    // [SOO] Shop Main - List Output by Category
    @RequestMapping(value = "/{currentPage}", method = RequestMethod.GET)
    public ModelAndView shopList(@PathVariable String currentPage, ModelAndView modelAndView) {

        modelAndView.addObject("currentPage", currentPage);
        modelAndView.setViewName("user/shop");
        return modelAndView;
    }

    // [SOO] Shop Main - List Output by Category
    @RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
    public ModelAndView root(@PathVariable String productId, ModelAndView modelAndView) {

        modelAndView.setViewName("user/product");
        return modelAndView;
    }

}
