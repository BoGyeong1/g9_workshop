package com.g9.workshop.g9_workshop.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// @Controller
public class ByPassController {

    @RequestMapping(value = { "/**" })
    public void byPass() {

    }

}
