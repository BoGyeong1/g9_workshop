package com.g9.workshop.g9_workshop.user.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.configurations.PrincipalUser;
import com.g9.workshop.g9_workshop.user.service.MainService;
import com.g9.workshop.g9_workshop.user.service.ShopService;

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

    // [SOO] Like
    @PostMapping("/like")
    public String like(@RequestParam Map params, ModelAndView modelAndView, HttpServletResponse response)
            throws IOException {
        try {
            PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
            String userUid = principal.getUserUid();
            params.put("userUid", userUid);
        } catch (Exception e) {
            return "redirect:/user/login";
        }
        mainService.likeCheck(params);

        return "redirect:/shop/WHOLE";
    }

    // [SOO] Like
    @PostMapping("/dislike")
    public String dislike(@RequestParam Map params, ModelAndView modelAndView, HttpServletResponse response)
            throws IOException {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        String userUid = principal.getUserUid();
        params.put("userUid", userUid);
        mainService.dislikeCheck(params);

        return "redirect:/shop/WHOLE";
    }

}
