package com.g9.workshop.g9_workshop.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.admin.service.AdminFileService;
import com.g9.workshop.g9_workshop.admin.service.AdminService;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Controller
@RequestMapping("/admin/product")
public class AdminProductManageController {

    @Autowired
    AdminFileService adminFileService;

    @Autowired
    AdminService adminService;

    @Autowired
    CommonUtils commonUtils;

    // [SOO] Product List
    @GetMapping({ "", "/list" })
    public ModelAndView productManage(ModelAndView modelAndView) {
        Object productInfos = adminService.getProductInfoList();
        modelAndView.addObject("productInfos", productInfos);
        modelAndView.setViewName("admin/product/product_current_situation");
        return modelAndView;
    }

    // [SOO] Product Upload Form
    @GetMapping("/insert")
    public ModelAndView productUploadForm(ModelAndView modelAndView) {
        Object categoryList = adminService.getCategotyList();
        Object purposeList = adminService.getPurposeList();
        Object brandList = adminService.getBrandList();
        Object originList = adminService.getOriginList();

        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("purposeList", purposeList);
        modelAndView.addObject("brandList", brandList);
        modelAndView.addObject("originList", originList);
        modelAndView.setViewName("admin/product/product_insert_edit");
        return modelAndView;
    }

    // [SOO] Product Upload Action
    @PostMapping("/insert")
    public String productUpload(MultipartHttpServletRequest request, @RequestParam Map<String, Object> params) {
        adminFileService.fileInsert(request, params);
        return "redirect:/admin/product/list";
    }

    // [SOO] Product Edit Form
    @PostMapping("/edit")
    public ModelAndView productEdit(@RequestParam Map params, ModelAndView modelAndView) {

        String productUid = (String) params.get("productUid");
        Object productEditInfo = adminService.getProductEditInfo(productUid);
        Object categoryList = adminService.getCategotyList();
        Object purposeList = adminService.getPurposeList();
        Object brandList = adminService.getBrandList();
        Object originList = adminService.getOriginList();

        modelAndView.addObject("productEditInfo", productEditInfo);
        modelAndView.addObject("categoryList", categoryList);
        modelAndView.addObject("purposeList", purposeList);
        modelAndView.addObject("brandList", brandList);
        modelAndView.addObject("originList", originList);

        modelAndView.setViewName("admin/product/product_insert_edit");
        return modelAndView;
    }

    // [SOO] Product Edit Submit
    @PostMapping("/edit/submit")
    public String productEditDone(@RequestParam Map params) {
        adminService.updateProduct(params);
        return "redirect:/admin/product/list";
    }

}
