package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.g9.workshop.g9_workshop.configurations.PrincipalUser;
import com.g9.workshop.g9_workshop.user.service.MypageService;
import com.google.gson.Gson;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
    // TO-DO 마이페이지 - 정보 확인 및 수정 / 탈퇴 / 주문내역 조회
    @Autowired
    MypageService mypageService;

    @Autowired
    PasswordEncoder passwordEncoder;

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);
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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object resultMap = mypageService.getApplicationList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 취소 신청
    @RequestMapping(value = "/cancelApplication/{orderId}", method = RequestMethod.GET)
    public ModelAndView cancelApplication(@RequestParam Map<String, Object> params, @PathVariable String orderId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        params.put("orderId", orderId);
        Object resultMap = mypageService.insertCancelOrderGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/cancel_and_refund/cancel_application_list");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 주문 반품/교환 신청
    @RequestMapping(value = "/refundExchangeApplication/{orderId}", method = RequestMethod.GET)
    public ModelAndView refundExchangeApplication(@RequestParam Map<String, Object> params,
            @PathVariable String orderId, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
    public ModelAndView refundExchangeProcess(@RequestParam Map<String, Object> params,
            @RequestParam("ORDER_DETAIL_UID[]") String[] orderDetailUidArray, ModelAndView modelAndView) {

        if (orderDetailUidArray != null) {
            params.put("orderDetailUidArray", orderDetailUidArray);
        }

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        params.put("orderDetailUid", orderDetailUid);
        Object resultMap = mypageService.getReviewWriteInfo(params);

        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/reviews/review_regi");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 상품리뷰 등록하기
    @RequestMapping(value = "/reviewRegiInsert", method = RequestMethod.POST)
    public ModelAndView reviewRegiProcess(@RequestParam Map<String, Object> params,
            ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object resultMap = mypageService.insetReviewAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/reviews/reviewlist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 내가 작성한 리뷰 보기
    @RequestMapping(value = "/myReviewList")
    public ModelAndView myReviewList(@RequestParam Map<String, Object> params,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object resultMap = mypageService.getMyReviewList(params);

        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("/user/mypage/reviews/myReviewlist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 목록
    @RequestMapping(value = "/inquiryList")
    public ModelAndView inquiryList(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object resultMap = mypageService.getInquiryList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/inquiry/inquirylist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 등록
    @RequestMapping(value = "/inquiryRegi")
    public ModelAndView inquiryRegi(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object inquiryCategoryList = mypageService.getInquiryCategoryList(params);
        modelAndView.addObject("inquiryCategoryList", inquiryCategoryList);

        modelAndView.setViewName("/user/mypage/inquiry/inquiry_regi");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 인서트
    @RequestMapping(value = "/inquiryInsert", method = RequestMethod.POST)
    public ModelAndView inquiryInsert(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object resultMap = mypageService.insertPrivateInquiriesGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/inquiry/inquiry_regi");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 상세 내역
    @RequestMapping(value = "/inquiryView/{privateInquiryUid}")
    public ModelAndView inquiryUpdate(@RequestParam Map<String, Object> params, @PathVariable String privateInquiryUid,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        params.put("PRIVATE_INQUIRY_UID", privateInquiryUid);

        Object resultMap = mypageService.getPrivateInquiries(params);
        String json = new Gson().toJson(resultMap);
        Map<String, Object> map = new Gson().fromJson(json, Map.class);
        String content = (String) map.get("CONTENT");
        modelAndView.addObject("content", content);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/inquiry/inquiry_view");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 수정하기
    @RequestMapping(value = "/inquiryUpdate/{privateInquiryUid}")
    public ModelAndView inquiryView(@RequestParam Map<String, Object> params, @PathVariable String privateInquiryUid,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        params.put("PRIVATE_INQUIRY_UID", privateInquiryUid);

        Object resultMap = mypageService.getPrivateInquiries(params);
        String json = new Gson().toJson(resultMap);
        Map<String, Object> map = new Gson().fromJson(json, Map.class);
        String content = (String) map.get("CONTENT");
        modelAndView.addObject("content", content);
        modelAndView.addObject("resultMap", resultMap);

        Object inquiryCategoryList = mypageService.getInquiryCategoryList(params);
        modelAndView.addObject("inquiryCategoryList", inquiryCategoryList);

        modelAndView.setViewName("/user/mypage/inquiry/inquiry_regi");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 수정
    @RequestMapping(value = "/inquiryUpdate", method = RequestMethod.POST)
    public ModelAndView inquiryUpdate(@RequestParam Map<String, Object> params, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object resultMap = mypageService.updateInquiriesGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/inquiry/inquirylist");
        return modelAndView;

    }

    // [GYEONG] 마이페이지 1:1 문의 삭제
    @RequestMapping(value = "/inquiryDelete/{privateInquiryUid}")
    public ModelAndView inquiryDelete(@RequestParam Map<String, Object> params, @PathVariable String privateInquiryUid,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        params.put("PRIVATE_INQUIRY_UID", privateInquiryUid);

        Object resultMap = mypageService.deleteInquiriesGetList(params);
        modelAndView.addObject("resultMap", resultMap);

        modelAndView.setViewName("/user/mypage/inquiry/inquirylist");
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
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

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

    // 비밀번호 인증 후 회원정보 수정
    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    public String updateUserInfo(Model model, @RequestParam Map params, RedirectAttributes redirectAttributes) {
        String password = (String) params.get("PASSWORD"); // params 객체에서 비밀번호 정보를 가져옴

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();

            if (!passwordEncoder.matches(password, userDetails.getPassword())) {
                // 비밀번호가 일치하지 않는 경우
                String errorMessage = "비밀번호가 일치하지 않습니다.";
                redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
                return "redirect:/mypage/changeUserInfo";
            }
        }

        // 회원정보 수정 처리
        mypageService.updateUserInfo(params);

        return "redirect:/mypage/changeUserInfo";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changePassword(@RequestParam Map params) {
        Map<String, Object> response = new HashMap<>();
        String existingPassword = (String) params.get("existingPassword");
        String newPassword = (String) params.get("newPassword");
        String newPasswordConfirm = (String) params.get("newPasswordConfirm");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();

            if (!passwordEncoder.matches(existingPassword, userDetails.getPassword())) {
                // 현재 비밀번호가 일치하지 않는 경우
                response.put("success", false);
                response.put("message", "현재 비밀번호가 일치하지 않습니다.");
            } else if (!newPassword.equals(newPasswordConfirm)) {
                // 새로운 비밀번호와 새로운 비밀번호 확인이 일치하지 않는 경우
                response.put("success", false);
                response.put("message", "새로운 비밀번호와 새로운 비밀번호 확인이 일치하지 않습니다.");
            } else {
                // 비밀번호 변경
                mypageService.updatePassword(params);

                response.put("success", true);
                response.put("message", "비밀번호가 변경되었습니다.");
            }
        } else {
            // 로그인 되어 있지 않은 경우
            response.put("success", false);
            response.put("message", "로그인 되어 있지 않습니다.");
        }

        return response;
    }

    // [GYEONG] 리뷰 수정하러가기
    @RequestMapping(value = "/editReview/{reviewId}")
    public ModelAndView reviewRegiUpdate(@RequestParam Map params, @PathVariable String reviewId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        params.put("reviewId", reviewId);
        Object resultMap = mypageService.getReview(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("/user/mypage/reviews/review_regi");

        return modelAndView;
    }

    // [GYEONG] 리뷰 수정
    @RequestMapping(value = "/reviewRegiUpdate")
    public ModelAndView editReview(@RequestParam Map params, ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        Object resultMap = mypageService.updateReviewAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("/user/mypage/reviews/myReviewlist");

        return modelAndView;
    }

    // [GYEONG] 리뷰 삭제
    @RequestMapping(value = "/deleteReview/{reviewId}")
    public ModelAndView deleteReview(@RequestParam Map params, @PathVariable String reviewId,
            ModelAndView modelAndView) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        int point = principal.getPoint();
        String userName = principal.getMemberName();
        modelAndView.addObject("userUid", userUid);
        modelAndView.addObject("point", point);
        modelAndView.addObject("userName", userName);
        Object reviewCnt = mypageService.getReviewCnt(params);
        modelAndView.addObject("reviewCnt", reviewCnt);

        params.put("reviewId", reviewId);
        Object resultMap = mypageService.deleteReviewAndGetList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("/user/mypage/reviews/myReviewlist");

        return modelAndView;
    }
}
