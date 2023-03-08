package com.g9.workshop.g9_workshop.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.admin.service.AdminInquiryService;
import com.g9.workshop.g9_workshop.configurations.PrincipalAdmin;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/inquiry")
public class AdminInquiryController {

    @Autowired
    AdminInquiryService adminInquiryService;

    // [GYEONG] 답변이 필요한 1:1 문의목록
    @GetMapping("/inquiryList")
    public ModelAndView inquiryList(@RequestParam Map params, ModelAndView modelAndView) {
        Object resultMap = adminInquiryService.getInquiryList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/cs/inquirylist");
        return modelAndView;
    }

    @GetMapping("/inquirys/{privateInquiryUid}")
    public ModelAndView inquirys(@RequestParam Map params, @PathVariable String privateInquiryUid,
            ModelAndView modelAndView) {
        params.put("PRIVATE_INQUIRY_UID", privateInquiryUid);

        Object resultMap = adminInquiryService.getInquiryOne(params);
        modelAndView.addObject("resultMap", resultMap);

        String json = new Gson().toJson(resultMap);
        Map<String, Object> map = new Gson().fromJson(json, Map.class);
        String content = (String) map.get("CONTENT");
        modelAndView.addObject("content", content);
        modelAndView.setViewName("admin/cs/inquiry_content");
        return modelAndView;
    }

    @GetMapping("/inquirysAnswer/{privateInquiryUid}")
    public ModelAndView inquirysAnswer(@RequestParam Map params, @PathVariable String privateInquiryUid,
            ModelAndView modelAndView) {
        params.put("PRIVATE_INQUIRY_UID", privateInquiryUid);
        PrincipalAdmin principal = (PrincipalAdmin) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        String adminUid = principal.getAdminUid();
        params.put("ADMIN_UID", adminUid);

        modelAndView.addObject("resultMap", params);
        modelAndView.setViewName("admin/cs/inquiry_answer");
        return modelAndView;
    }

    @PostMapping("/insertInquirysAnswer")
    public ModelAndView insertInquirysAnswer(@RequestParam Map params,
            ModelAndView modelAndView) {
        PrincipalAdmin principal = (PrincipalAdmin) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        String adminUid = principal.getAdminUid();
        params.put("ADMIN_UID", adminUid);

        Object resultMap = adminInquiryService.insertAndGetInquiryList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/cs/inquirylist");
        return modelAndView;
    }
}
