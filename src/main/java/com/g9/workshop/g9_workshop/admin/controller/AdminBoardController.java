package com.g9.workshop.g9_workshop.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.admin.service.AdminBoardService;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {

    @Autowired
    AdminBoardService adminBoardService;

    // list
    @GetMapping({ "/", "" })
    public ModelAndView boardMain(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = adminBoardService.selectBoard(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/web/board");
        return modelAndView;

    }

    // insert
    @PostMapping({ "/insert" })
    public String boardInsert(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/web/board");
        return "redirect:/board";

    }

    // form
    @GetMapping({ "/from" })
    public ModelAndView form(ModelAndView modelAndView) {
        modelAndView.setViewName("admin/web/boradedit");
        return modelAndView;
    }

    // edit
    @GetMapping({ "/edit/{postUid}" })
    public ModelAndView form(@RequestParam Map<String, Object> params,
            @PathVariable String postUid,
            ModelAndView modelAndView) {
        params.put("POST_UID", postUid);
        Object resultMap = adminBoardService.getOne(params);
        Object category = adminBoardService.getBoardCategories();
        
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.addObject("category", category);

        modelAndView.setViewName("admin/web/boardedit");
        return modelAndView;
    }

    // update

    @PostMapping({"/update"})
    public ModelAndView update(@RequestParam Map<String, Object> params, ModelAndView modelAndView){
        Object resultMap = adminBoardService.updateAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/web/board");
        return modelAndView;
    }
}
