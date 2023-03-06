package com.g9.workshop.g9_workshop.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {

    @GetMapping({ "" })
    public ModelAndView boardMain(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/web/board");
        return modelAndView;

    }
}
