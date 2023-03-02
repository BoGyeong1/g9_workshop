package com.g9.workshop.g9_workshop.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.admin.service.AdminFileService;
import com.g9.workshop.g9_workshop.admin.service.AdminService;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    AdminService adminService;

    @Autowired
    AdminFileService adminFileService;

    @GetMapping("")
    public ModelAndView eventMain(ModelAndView modelAndView) {

        Object eventInfos = adminService.getEventInfos();
        modelAndView.addObject("eventInfos", eventInfos);

        modelAndView.setViewName("admin/web/event_main");
        return modelAndView;

    }

    @GetMapping("/insert")
    public ModelAndView eventInsertForm(ModelAndView modelAndView) {

        modelAndView.setViewName("admin/web/event_insert_edit");
        return modelAndView;

    }

    @PostMapping("/insert")
    public String eventInsert(@RequestParam Map params, @RequestParam("event-banner") MultipartFile file,
            ModelAndView modelAndView) {

        String eventUid = commonUtils.getUniqueSequence();
        params.put("event-uid", eventUid);
        adminService.insertEvent(params);
        adminFileService.insertEventBanner(eventUid, file);

        return "redirect:/admin/event";

    }

    @PostMapping("/edit")
    public ModelAndView editEvent(@RequestParam Map params, ModelAndView modelAndView) {

        Object eventInfo = adminService.getEventInfos((String) (params.get("event_uid")));
        modelAndView.addObject("eventInfo", eventInfo);

        modelAndView.setViewName("admin/web/event_insert_edit");
        return modelAndView;

    }
}
