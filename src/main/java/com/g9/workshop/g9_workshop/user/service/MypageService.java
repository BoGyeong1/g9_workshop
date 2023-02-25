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

        // 취소사유와 취소사유 ID를 , 기준으로 나누어서 배열로 만듦
        String cancelReasons = (String) result.get("CANCELLED_REASON");
        String[] reasons = cancelReasons.split(",");
        String cancelReasonIds = (String) result.get("CANCELLED_REASON_UID");
        String[] reasonIds = cancelReasonIds.split(",");

        // 배열을 다시 Map에 저장
        result.put("CANCELLED_REASON_LIST", reasons);
        result.put("CANCELLED_REASON_UID_LIST", reasonIds);
        return result;

    }

}
