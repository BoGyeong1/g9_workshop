package com.g9.workshop.g9_workshop.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
        List productList = (List) shopService.getProductList(currentPage);

        modelAndView.addObject("purposes", purposes);
        modelAndView.addObject("categories", categories);
        modelAndView.addObject("productList", productList);

        modelAndView.setViewName("user/shop");
        return modelAndView;
    }

    // [SOO] Product Detail
    @RequestMapping(value = "/product/detail", method = RequestMethod.POST)
    public ModelAndView root(@RequestParam Map params, ModelAndView modelAndView) {

        Object productDetailInfo = shopService.getProductDetailInfo(params);
        Object thumbnailImgs = shopService.getThumbnailImgs(params);
        Object detailImgs = shopService.getDetailImgs(params);

        modelAndView.addObject("params", params);
        modelAndView.addObject("productDetailInfo", productDetailInfo);
        modelAndView.addObject("thumbnailImgs", thumbnailImgs);
        modelAndView.addObject("detailImgs", detailImgs);

        modelAndView.setViewName("user/product");
        return modelAndView;
    }

}
