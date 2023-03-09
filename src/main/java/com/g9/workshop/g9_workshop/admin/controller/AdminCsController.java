package com.g9.workshop.g9_workshop.admin.controller;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.admin.service.AdminBoardService;
import com.g9.workshop.g9_workshop.configurations.PrincipalAdmin;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Controller
@RequestMapping("/admin/csCenter")
public class AdminCsController {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    AdminBoardService adminBoardService;

    // list
    @GetMapping("")
    public ModelAndView csMain(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        Object resultMap = adminBoardService.selectCs(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/cs/faqlist");
        return modelAndView;
    }

    // INSERT

    // insert
    @PostMapping("/insert")
    public String faqInsertSubmit(@RequestParam Map params) {
        PrincipalAdmin principal = (PrincipalAdmin) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        String ADMIN_UID = principal.getAdminUid();
        params.put("ADMIN_UID", ADMIN_UID);
        
        adminBoardService.csPost(params);
        
        return "redirect:/admin/csCenter";
    }
    
    @GetMapping("/insert")
    public ModelAndView faqInsertView(ModelAndView modelAndView) {
        // Handle GET requests for "/insert" URL here
        Object category = adminBoardService.getCsCategories();
        modelAndView.addObject("category", category);
        
        modelAndView.setViewName("admin/cs/faqedit&insert");
        return modelAndView;
    }
    
    @PostMapping("/edit")
    public ModelAndView faqEditView(ModelAndView modelAndView, @RequestParam Map params) {
        Object category = adminBoardService.getCsCategories();
        Object result = adminBoardService.getFaqPost(params);

        modelAndView.addObject("category", category);
        modelAndView.addObject("result", result);
        modelAndView.setViewName("admin/cs/faqedit&insert");
        return modelAndView;
    }

    @PostMapping("/update")
    public String faqEditSubmit(@RequestParam Map params) {
        PrincipalAdmin principal = (PrincipalAdmin) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        String ADMIN_UID = principal.getAdminUid();
        params.put("ADMIN_UID", ADMIN_UID);
        
        adminBoardService.updateFaqPost(params);

        return "redirect:/admin/csCenter";
    }

    @PostMapping("/delete")
    public ModelAndView delete(@RequestParam Map<String, Object> params,
            ModelAndView modelAndView) {
        adminBoardService.deleteFaq(params);
        Object resultMap = adminBoardService.selectCs(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/cs/faqlist");
        return modelAndView;
    }


}