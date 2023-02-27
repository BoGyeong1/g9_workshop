package com.g9.workshop.g9_workshop.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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

    // [GYEONG] 주문내역 가져오기
    public Object getOrderList(Object dataMap) {
        dataMap = new HashMap<String, Object>();

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectOrderList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
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
        dataMap.put(dataMap.get("refundExchangeType") + "_ORDER_UID", commonUtils.getUniqueSequence());
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

    //
    public Object getCanRefExcList(Map dataMap) {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectCanRefExcList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

}
