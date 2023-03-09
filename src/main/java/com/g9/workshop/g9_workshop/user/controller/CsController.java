package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.user.service.CsService;

@Controller
@RequestMapping("/Cscenter")
public class CsController {
    // TO-DO 고객센터 컨트롤러 - 문의 등록 / 조회 / FAQ 출력

    @Autowired
    CsService csService;

    @GetMapping("")
    public ModelAndView csMain (@RequestParam Map params,  ModelAndView modelAndView) {
        Object csList = csService.getCSList(params);
        modelAndView.addObject("csList", csList);
        modelAndView.setViewName("user/customerService/askedQuestion");
        return modelAndView;
    }


}
