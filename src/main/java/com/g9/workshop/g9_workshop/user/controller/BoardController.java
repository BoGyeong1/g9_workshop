package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.user.service.BoardService;

@Controller
@RequestMapping(value = "/board")

public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("")
    public ModelAndView boardMain(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = boardService.selectBoard(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("user/board/board");
        return modelAndView;
    }

    @GetMapping("/view")
    public ModelAndView boardview(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = boardService.selectBoard(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("user/board/boardView");
        return modelAndView;
    }

}