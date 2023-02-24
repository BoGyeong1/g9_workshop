package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.configurations.PrincipalUser;
import com.g9.workshop.g9_workshop.user.service.MypageService;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
    // TO-DO 마이페이지 - 정보 확인 및 수정 / 탈퇴 / 주문내역 조회
    @Autowired
    MypageService mypageService;

    // [GYEONG] 마이페이지 주문내역 리스트(제일 처음화면)
    @RequestMapping(value = "/orderlist")
    public ModelAndView orderlist(ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();

        Object resultMap = mypageService.getOrderList(userName);
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/orderlist/orderlist");

        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 상세내역
    @RequestMapping(value = "/orderDetail/{orderId}", method = RequestMethod.GET)
    public ModelAndView orderDetail(@RequestParam Map<String, Object> params, @PathVariable String orderId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        params.put("orderId", orderId);
        Object resultMap = mypageService.getOrderDetailList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/orderlist/order_detail");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 상세내역 배송지 수정
    @RequestMapping(value = "/editAddress")
    public ModelAndView editAddress(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/orderlist/edit_address");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 취소/반품/교환 신청 목록
    @RequestMapping(value = "/cancelApplicationList")
    public ModelAndView cancelApplicationList(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 취소 신청
    @RequestMapping(value = "/cancelApplication")
    public ModelAndView cancelApplication(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 반품/교환 신청
    @RequestMapping(value = "/refundExchangeApplication")
    public ModelAndView refundExchangeApplication(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/cancel_and_refund/refund_exchange_application");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 반품/교환 내역
    @RequestMapping(value = "/canRefExcList")
    public ModelAndView canRefExcList(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/cancel_and_refund/can_ref_exc_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 상품리뷰 리스트
    @RequestMapping(value = "/reviewlist")
    public ModelAndView reviewList(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/reviews/reviewlist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 상품리뷰 등록
    @RequestMapping(value = "/reviewRegi")
    public ModelAndView reviewRegi(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/reviews/review_regi");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 목록
    @RequestMapping(value = "/inquiryList")
    public ModelAndView inquiryList(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/inquiry/inquirylist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 등록
    @RequestMapping(value = "/inquiryRegi")
    public ModelAndView inquiryRegi(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/inquiry/inquiry_regi");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 상세 내역
    @RequestMapping(value = "/inquiryView")
    public ModelAndView inquiryView(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/inquiry/inquiry_view");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 찜목록
    @RequestMapping(value = "/favorite")
    public ModelAndView favorite(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/favorite");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 회원정보변경
    @RequestMapping(value = "/changeUserInfo")
    public ModelAndView changeUserInfo(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/change_user_info");
        return modelAndView;
    }

    // [GYEONG] 마이페이지 탈퇴
    @RequestMapping(value = "/withdraw")
    public ModelAndView withdraw(ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/withdraw");
        return modelAndView;
    }

}
