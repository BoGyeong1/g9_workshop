package com.g9.workshop.g9_workshop.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.configurations.PrincipalUser;
import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class MypageService {

    @Autowired
    SharedDao shareDao;

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    // [GYEONG] 주문내역 가져오기
    public Object getOrderList(Object dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        dataMap = new HashMap<>();
        ((HashMap<Object, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectOrderListWithPayment";
        return shareDao.getList(sqlMapId, dataMap);
    }

    // [GYEONG] 주문 상세 내역 가져오기
    public Object getOrderDetailList(Object dataMap) {
        String sqlMapId = "MypageMapper.selectOrderDetailList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 주문자 정보 가져오기
    public Object getOrderer(Object dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectOrderer";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 배송지 정보 가져오기
    public Object getShippingAddress(Object dataMap) {
        String sqlMapId = "MypageMapper.selectShippingAddress";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 배송장소 가져오기
    public Object getDeliveryLocations(Object dataMap) {
        String sqlMapId = "MypageMapper.selectDeliveryLocations";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 배송지 수정
    public Object editShippingAdress(Object dataMap) {
        String sqlMapId = "MypageMapper.updateShippingAddress";
        Object result = shareDao.update(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 배송지 수정하고 주문내역 가져오기
    public Object editShippingAndGetList(Object dataMap) {
        Object result = this.editShippingAdress(dataMap);
        result = this.getOrderList(dataMap);
        return result;

    }

    // [GYEONG] 취소/ 반품/ 교환 가능한 목록 출력
    public Object getApplicationList(Object dataMap) {
        dataMap = new HashMap<String, Object>();

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectApplicationList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 취소 신청할 정보 내역 출력
    public Object getCancelOrder(Object dataMap) {
        String sqlMapId = "MypageMapper.selectCancelOrder";
        Map result = (Map) shareDao.getOne(sqlMapId, dataMap);

        // null체크
        if (result == null) {
            return null;
        }
        return result;
    }

    public Object getCancelReason(Object dataMap) {
        String sqlMapId = "MypageMapper.selectCancelReason";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 취소신청하기
    // 중복방지
    public boolean checkCntCancel(Object dataMap) {
        String sqlMapId = "MypageMapper.checkCntCancel";
        int result = (int) shareDao.getOne(sqlMapId, dataMap);
        return result > 0;
    }

    public void insertCancelOrder(Map<String, Object> dataMap) throws IllegalArgumentException {

        // 유효성 검사: 주문 상태가 이미 "취소 신청" 상태인지 확인
        String orderConditionUid = (String) dataMap.get("ORDER_CONDITION_UID");
        if ("OC4".equals(orderConditionUid)) {
            throw new IllegalArgumentException("이미 취소 신청된 주문입니다.");
        }

        // 유효성 검사: 주문 UID로 이미 취소된 주문인지 확인
        String orderUid = (String) dataMap.get("ORDER_UID");
        Map<String, Object> checkMap = new HashMap<>();
        checkMap.put("ORDER_UID", orderUid);
        if (checkCntCancel(checkMap)) {
            throw new IllegalArgumentException("이미 취소된 주문입니다.");
        }

        dataMap.put("CANCELLED_ORDER_UID", commonUtils.getUniqueSequence());
        // 취소 주문 추가 및 주문 상태 업데이트
        String sqlMapId = "MypageMapper.insertCancelOrder";
        shareDao.insert(sqlMapId, dataMap);
        sqlMapId = "MypageMapper.updateCancelCondition";
        shareDao.update(sqlMapId, dataMap);
    }

    public Object insertCancelOrderGetList(Map dataMap) {
        this.insertCancelOrder(dataMap);
        Object result = this.getApplicationList(dataMap);
        return result;
    }

    // [GYEONG] 반품/교환신청하기
    // 목록가져오기
    public Object getOrderDetailUidsAndProductNames(Map dataMap) {
        String sqlMapId = "MypageMapper.selectRefundExchangeUidProductNameList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // 유저정보 가져오기
    public Object getOrderUserInfos(Map dataMap) {
        String sqlMapId = "MypageMapper.selectRefundExchangeUser";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // 교환반품사유 가져오기
    public Object getRefundExchangeReasons(Map dataMap) {
        String sqlMapId = "MypageMapper.selectRefundExchangeReasons";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;

    }

    // 교환반품신청입력
    public void insertOrderRefundExchange(Map dataMap) {
        String sqlMapId = "MypageMapper.insertrefundExchangeOrder";
        shareDao.insert(sqlMapId, dataMap);

        sqlMapId = "MypageMapper.updateRefundExchangeCondition";
        shareDao.update(sqlMapId, dataMap);
    }

    public Object insertOrderRefundExchangeGetList(Map dataMap) {
        this.insertOrderRefundExchange(dataMap);
        Object result = this.getApplicationList(dataMap);
        return result;
    }

    // [GYEONG] 취소교환환불내역 출력
    public Object getCanRefExcList(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectCanRefExcList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 라뷰 쓸수있는 내역 출력
    public Object getReviewWriteList(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectReviewWriteList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 리뷰 쓰기전 정보 가져오기
    public Object getReviewWriteInfo(Map dataMap) {
        String sqlMapId = "MypageMapper.selectReviewWriteInfo";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 리뷰 쓰기
    public Object insetReview(Map dataMap) {
        dataMap.put("REVIEW_UID", commonUtils.getUniqueSequence());
        String sqlMapId = "MypageMapper.insertReview";
        Object result = shareDao.insert(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 리뷰 쓰고 다시 리스트 출력
    public Object insetReviewAndGetList(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());

        Object result = this.insetReview(dataMap);
        result = this.getReviewWriteList(dataMap);
        return result;
    }

    // [GYEONG] 리뷰 쓴 내역 출력
    public Object getMyReviewList(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectMyReviewList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 회원정보불러오기
    public Object getUserInfo(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectUserInfo";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 회원정보 수정
    public void updateUserInfo(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.updateUserInfo";
        shareDao.update(sqlMapId, dataMap);
    }

    // [GYEONG] 비밀번호 변경
    public void updatePassword(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        dataMap.put("USER_UID", principal.getUserUid());

        String newPassword = (String) dataMap.get("newPassword");
        dataMap.put("PASSWORD", bcryptPasswordEncoder.encode(newPassword));
        String sqlMapId = "MypageMapper.updatePassword";
        shareDao.update(sqlMapId, dataMap);
    }

    // [GYEONG] 리뷰내용 가져오기
    public Object getReview(Object dataMap) {
        String sqlMapId = "MypageMapper.selectReview";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 리뷰수정
    public void updateReview(Map dataMap) {
        String sqlMapId = "MypageMapper.updateReview";
        shareDao.update(sqlMapId, dataMap);
    }

    // [GYEONG] 리뷰수정하고 작성한 리뷰 리스트 보기
    public Object updateReviewAndGetList(Map dataMap) {
        this.updateReview(dataMap);
        Object result = this.getMyReviewList(dataMap);
        return result;
    }

    // [GYEONG] 리뷰삭제하기
    public void deleteReview(Map dataMap) {
        String sqlMapId = "MypageMapper.deleteReview";
        shareDao.deleteOne(sqlMapId, dataMap);
    }

    // [GYEONG] 리뷰삭제하고 나의 리뷰 리스트 불러오기
    public Object deleteReviewAndGetList(Map dataMap) {
        this.deleteReview(dataMap);
        Object result = this.getMyReviewList(dataMap);
        return result;
    }

    // [GYEONG] 리뷰갯수 가져오기
    public Object getReviewCnt(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectReviewCnt";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 1:1문의 내역 가져오기
    public Object getInquiryList(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectInquiryList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 1:1문의 내역 카테고리 가져오기
    public Object getInquiryCategoryList(Map dataMap) {
        String sqlMapId = "MypageMapper.selectInquiryCategoryList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    public void insertPrivateInquiries(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        ((HashMap<String, Object>) dataMap).put("PRIVATE_INQUIRY_UID", commonUtils.getUniqueSequence());
        String sqlMapId = "MypageMapper.insertPrivateInquiries";
        shareDao.insert(sqlMapId, dataMap);
    }

    public Object insertPrivateInquiriesGetList(Map dataMap) {
        this.insertPrivateInquiries(dataMap);
        Object result = this.getInquiryList(dataMap);
        return result;
    }

    public Object getPrivateInquiries(Map dataMap) {
        String sqlMapId = "MypageMapper.selectPrivateInquiries";
        Object result = shareDao.getOne(sqlMapId, dataMap);
        return result;
    }

    // [GYEONG] 1:1문의 내역수정
    public void updateInquiries(Map dataMap) {
        String sqlMapId = "MypageMapper.updatePrivateInquiries";
        shareDao.update(sqlMapId, dataMap);
    }

    public Object updateInquiriesGetList(Map dataMap) {
        this.updateInquiries(dataMap);
        Object result = this.getInquiryList(dataMap);
        return result;
    }

    // [GYEONG] 1:1문의 내역삭제하기
    public void deleteInquiries(Map dataMap) {
        String sqlMapId = "MypageMapper.deletePrivateInquiries";
        shareDao.deleteOne(sqlMapId, dataMap);
    }

    public Object deleteInquiriesGetList(Map dataMap) {
        this.deleteInquiries(dataMap);
        Object result = this.getInquiryList(dataMap);
        return result;
    }

}
