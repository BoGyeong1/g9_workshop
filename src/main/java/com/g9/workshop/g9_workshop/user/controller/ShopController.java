package com.g9.workshop.g9_workshop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.user.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

    @Autowired
    ShopService shopService;

    // [SOO] Shop Main - List Output by Category
    @RequestMapping(value = "/{currentPage}", method = RequestMethod.GET)
    public ModelAndView shopList(@PathVariable String currentPage, ModelAndView modelAndView) {

        List categories = (List) shopService.getCategories();
        List purposes = (List) shopService.getPurposes();

        modelAndView.addObject("purposes", purposes);
        modelAndView.addObject("categories", categories);
        modelAndView.addObject("currentPage", currentPage);
        System.out.println(currentPage);
        modelAndView.setViewName("user/shop");
        return modelAndView;
    }

    // [SOO] Product Detail
    @RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
    public ModelAndView root(@PathVariable String productId, ModelAndView modelAndView) {

        modelAndView.setViewName("user/product");
        return modelAndView;
    }

}
