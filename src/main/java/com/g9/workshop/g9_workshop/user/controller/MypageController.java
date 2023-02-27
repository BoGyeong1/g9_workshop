package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

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
    public ModelAndView orderlist(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        Object orderList = mypageService.getOrderList(params);
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        modelAndView.addObject("orderList", orderList);

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
        // 주문 상세 내역 출력
        params.put("orderId", orderId);
        Object resultMap = mypageService.getOrderDetailList(params);
        modelAndView.addObject("resultMap", resultMap);
        // 주문자 정보 출력
        Object userInfo = mypageService.getOrderer(params);
        modelAndView.addObject("userInfo", userInfo);
        // 배송지 정보 출력
        Object shippingAddress = mypageService.getShippingAddress(params);
        modelAndView.addObject("shippingAddress", shippingAddress);

        modelAndView.setViewName("/user/mypage/orderlist/order_detail");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 상세내역 배송지 수정
    @RequestMapping(value = "/editAddress/{orderId}", method = RequestMethod.GET)
    public ModelAndView editAddress(@RequestParam Map<String, Object> params, @PathVariable String orderId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        // 주문 상세 내역 출력
        params.put("orderId", orderId);
        Object resultMap = mypageService.getOrderDetailList(params);
        modelAndView.addObject("resultMap", resultMap);
        Object deliveryLocations = mypageService.getDeliveryLocations(params);
        modelAndView.addObject("deliveryLocations", deliveryLocations);
        // 배송지 정보 출력
        Object shippingAddress = mypageService.getShippingAddress(params);
        modelAndView.addObject("shippingAddress", shippingAddress);
        modelAndView.setViewName("/user/mypage/orderlist/edit_address");
        return modelAndView;

    }

    // [GYEONG] 배송지 정보 수정
    @RequestMapping(value = "/editAddressProcess/{orderId}", method = RequestMethod.POST)
    public ModelAndView editAddressProcess(@RequestParam Map<String, Object> params, @PathVariable String orderId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        // 배송지 정보 수정하고 주문내역 리스트를 가져옴
        params.put("orderId", orderId);
        Object resultMap = mypageService.editShippingAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/orderlist/orderlist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 취소/반품/교환 신청 목록
    @RequestMapping(value = "/cancelApplicationList")
    public ModelAndView cancelApplicationList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Object resultMap = mypageService.getApplicationList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 취소 신청
    @RequestMapping(value = "/cancelApplication/{orderId}", method = RequestMethod.GET)
    public ModelAndView cancelApplication(@PathVariable String orderId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Map params = new HashMap<>();
        params.put("orderId", orderId);
        Object resultMap = mypageService.getCancelOrder(params);
        modelAndView.addObject("resultMap", resultMap);
        Object cancelReasons = mypageService.getCancelReason(params);
        modelAndView.addObject("cancelReasons", cancelReasons);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 취소 신청 과정
    @RequestMapping(value = "/cancelApplicationProcess/{orderId}", method = RequestMethod.POST)
    public ModelAndView cancelApplicationProcess(@RequestParam Map<String, Object> params, @PathVariable String orderId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        params.put("orderId", orderId);
        Object resultMap = mypageService.insertCancelOrderGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 반품/교환 신청
    @RequestMapping(value = "/refundExchangeApplication/{orderId}", method = RequestMethod.GET)
    public ModelAndView refundExchangeApplication(@PathVariable String orderId, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Map params = new HashMap<>();
        params.put("orderId", orderId);
        Object resultProductNameAndOrderDetailUid = mypageService.getOrderDetailUidsAndProductNames(params);
        Object resultOrderUserInfo = mypageService.getOrderUserInfos(params);
        Object resultReasons = mypageService.getRefundExchangeReasons(params);

        modelAndView.addObject("resultProductNameAndOrderDetailUid", resultProductNameAndOrderDetailUid);
        modelAndView.addObject("resultOrderUserInfo", resultOrderUserInfo);
        modelAndView.addObject("resultReasons", resultReasons);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/refund_exchange_application");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 반품/교환 신청
    @RequestMapping(value = "/refundExchangeProcess", method = RequestMethod.POST)
    public ModelAndView refundExchangeProcess(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Object resultMap = mypageService.insertOrderRefundExchangeGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문취소/ 반품/교환 내역
    @RequestMapping(value = "/canRefExcList")
    public ModelAndView canRefExcList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Object resultMap = mypageService.getCanRefExcList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/can_ref_exc_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 상품리뷰쓸수있는 리스트
    @RequestMapping(value = "/reviewlist")
    public ModelAndView reviewList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/reviews/reviewlist");
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Object resultMap = mypageService.getReviewWriteList(params);
        modelAndView.addObject("resultMap", resultMap);
        return modelAndView;

    }

    // [GYEONG] 마이페이지 상품리뷰 등록
    @RequestMapping(value = "/reviewRegi/{orderDetailUid}")
    public ModelAndView reviewRegi(@PathVariable String orderDetailUid, @RequestParam Map<String, Object> params,
            ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        params.put("orderDetailUid", orderDetailUid);
        Object resultMap = mypageService.getReviewWriteInfo(params);

        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/reviews/review_regi");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 상품리뷰 등록하기
    @RequestMapping(value = "/reviewRegiProcess", method = RequestMethod.POST)
    public ModelAndView reviewRegiProcess(@RequestParam Map<String, Object> params,
            ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Object resultMap = mypageService.insetReviewAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/reviews/reviewlist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 내가 작성한 리뷰 보기
    @RequestMapping(value = "/myReviewList")
    public ModelAndView myReviewList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        modelAndView.setViewName("/user/mypage/reviews/reviewlist");
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Object resultMap = mypageService.getMyReviewList(params);
        modelAndView.addObject("resultMap", resultMap);
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
    public ModelAndView changeUserInfo(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);

        Object resultMap = mypageService.getUserInfo(params);
        modelAndView.addObject("resultMap", resultMap);

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
