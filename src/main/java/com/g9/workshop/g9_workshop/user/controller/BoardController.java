package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.user.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("/{currentPage}")
    public ModelAndView boardMain(@RequestParam Map<String, Object> params, ModelAndView modelAndView,
            @PathVariable String currentPage) {
        params.put("currentPage", Integer.parseInt(currentPage));
        params.put("pageScale", 10);

        Object resultList = boardService.getBoardList(params);

        modelAndView.addObject("resultList", resultList);

        modelAndView.setViewName("user/board/board");
        return modelAndView;
    }

    @GetMapping("/view/{postUid}")
    public ModelAndView boardview(@RequestParam Map<String, Object> params, @PathVariable String postUid,
            ModelAndView modelAndView) {
        params.put("POST_UID", postUid);
        Object boardList = boardService.getOne(params);
        modelAndView.addObject("boardList", boardList);
        modelAndView.setViewName("user/board/boardView");
        return modelAndView;
    }

}