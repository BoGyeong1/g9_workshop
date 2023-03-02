package com.g9.workshop.g9_workshop.admin.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberManageController {

    // [SOO] 유저 리스트
    @GetMapping("/list")
    public ModelAndView userList(@RequestParam Map params, ModelAndView modelAndView) {

        modelAndView.setViewName("admin/member/list");
        return modelAndView;
    }

    @PostMapping("/list")
    public ModelAndView userSearch(@RequestParam Map params, ModelAndView modelAndView) {
        /*
         * TO-DO
         * 검색 필터를 RequestParam으로 받아 DB 조회 후 출력
         */

        System.out.println(params.get("filter"));
        System.out.println(params.get("word"));
        modelAndView.setViewName("admin/member/list");
        return modelAndView;
    }

    // [SOO] 유저 리스트
    @GetMapping("/detail/{userUid}")
    public ModelAndView userStatus(@PathVariable String userUid, ModelAndView modelAndView) {
        /*
         * TO-DO
         * 사용자 정보 add
         * 주문 내역 add - 상품명 전달 시 통신방법 고민 필요
         * 리뷰 내역 add
         * 문의 내역 add
         */

        modelAndView.setViewName("admin/member/detail");
        return modelAndView;
    }

}
