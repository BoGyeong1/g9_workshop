package com.g9.workshop.g9_workshop.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    // [SOO] root controller - HOME
    @RequestMapping(value = { "", "/home" }, method = RequestMethod.GET)
    public ModelAndView root(ModelAndView modelAndView) {
        modelAndView.setViewName("user/main");
        return modelAndView;
    }

    // [SOO] ABOUT US controller
    @RequestMapping(value = "/aboutus", method = RequestMethod.GET)
    public ModelAndView aboutUs(ModelAndView modelAndView) {
        modelAndView.setViewName("user/aboutus");
        return modelAndView;
    }

    // [SOO] PROHJECT controller
    @RequestMapping(value = "/project", method = RequestMethod.GET)
    public ModelAndView project(ModelAndView modelAndView) {
        modelAndView.setViewName("user/aboutus");
        return modelAndView;
    }

    // [SOO] EVENT controller
    @RequestMapping(value = "/event/{eventStatus}", method = RequestMethod.GET)
    public ModelAndView event(@PathVariable String eventStatus, ModelAndView modelAndView) {
        // TO-DO 이벤트 리스트 불러와 전달하기
        modelAndView.setViewName("user/event");
        return modelAndView;
    }
}
