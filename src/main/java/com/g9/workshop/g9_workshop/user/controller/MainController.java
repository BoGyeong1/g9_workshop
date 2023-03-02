package com.g9.workshop.g9_workshop.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.user.service.MainService;

@Controller
public class MainController {

    @Autowired
    MainService mainService;

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
        Object eventList = mainService.getEventList(eventStatus);
        modelAndView.addObject("eventList", eventList);
        modelAndView.addObject("eventStatus", eventStatus);
        modelAndView.setViewName("user/event");
        return modelAndView;
    }
}
