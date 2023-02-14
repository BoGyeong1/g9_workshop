package com.g9.workshop.g9_workshop.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
    // TO-DO 마이페이지 - 정보 확인 및 수정 / 탈퇴 / 주문내역 조회

    // [GYEONG] 마이페이지 주문내역 리스트(제일 처음화면)
    @RequestMapping(value = "/mypage")
    public ModelAndView login(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/orderlist/orderlist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 상세내역
    @RequestMapping(value = "/orderDetail")
    public ModelAndView orderDetail(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/orderlist/order_detail");
        return modelAndView;

    }

}
