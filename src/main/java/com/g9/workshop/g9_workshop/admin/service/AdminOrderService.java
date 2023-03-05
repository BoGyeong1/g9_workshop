package com.g9.workshop.g9_workshop.admin.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;
import com.g9.workshop.g9_workshop.utils.Paginations;

@Service
public class AdminOrderService {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    @Autowired
    SharedDao sharedDao;

    public Object getOrderList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectAdminOrderList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getOrderTotal(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectOrderCount";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getOrderListWithPagination(Object dataMap) {
        Map<String, Object> result = new HashMap<String, Object>();
        int totalCount = (int) this.getOrderTotal(dataMap);
        int currentPage = (int) ((Map) dataMap).get("currentPage");
        Paginations paginations = new Paginations(totalCount, currentPage);
        result.put("paginations", paginations);
        ((Map) dataMap).put("pageBegin", paginations.getPageBegin());
        ((Map) dataMap).put("pageScale", paginations.getPageScale());
        result.put("resultList", this.getOrderList(dataMap));
        return result;
    }

    public Object getOrdeDetailList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectAdminOrderDetailList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getOrdeDetailAddress(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectOrderAddress";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getCancelOrderList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectCancelOrderList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getCancelOrderStatistics(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectCancelOrderStatistics";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public int getCancelOrderCount(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectCancelOrderListCount";
        int result = (int) sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getCancelOrderListWithPagination(Object dataMap) {
        Map<String, Object> result = new HashMap<String, Object>();
        int totalCount = (int) this.getCancelOrderCount(dataMap);
        int currentPage = (int) ((Map) dataMap).get("currentPage");
        Paginations paginations = new Paginations(totalCount, currentPage);
        result.put("paginations", paginations);
        ((Map) dataMap).put("pageBegin", paginations.getPageBegin());
        ((Map) dataMap).put("pageScale", paginations.getPageScale());
        result.put("resultList", this.getCancelOrderList(dataMap));
        return result;
    }

    public Object getCancelOrderSearchList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectAdminOrderSearchList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getShippingList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectShippingList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getShippingListCount(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectShippingListCount";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getShippingListWithPagination(Object dataMap) {
        Map<String, Object> result = new HashMap<String, Object>();
        int totalCount = (int) this.getShippingListCount(dataMap);
        int currentPage = (int) ((Map) dataMap).get("currentPage");
        Paginations paginations = new Paginations(totalCount, currentPage);
        result.put("paginations", paginations);
        ((Map) dataMap).put("pageBegin", paginations.getPageBegin());
        ((Map) dataMap).put("pageScale", paginations.getPageScale());
        result.put("resultList", this.getShippingList(dataMap));
        return result;
    }

    public Object getShippingListRadio(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectShippingListRadio";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getLogisticsList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectLogistics";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getOrderConditions(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectOrderConditions";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getWaybillType(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectWaybillType";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getWaybillInfo(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectWaybill";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public void updateWaybillInfo(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.updateWaybill";
        sharedDao.update(sqlMapId, dataMap);
        sqlMapId = "AdminOrderMapper.updateOrderDetailWaybill";
        sharedDao.update(sqlMapId, dataMap);
    }

    public Object getListAndUpdateWaybillInfo(Object dataMap) {
        this.updateWaybillInfo(dataMap);
        Object result = this.getShippingList(dataMap);
        return result;
    }

    public void insertAndUpdateWayBills(Object dataMap) {
        ((Map<String, Object>) dataMap).put("WAYBILL_UID", commonUtils.getUniqueSequence());
        String sqlMapId = "AdminOrderMapper.insertWaybill";
        sharedDao.insert(sqlMapId, dataMap);
        sqlMapId = "AdminOrderMapper.insertOrderDetailWaybill";
        sharedDao.insert(sqlMapId, dataMap);
        sqlMapId = "AdminOrderMapper.updateOrderDetailOrdercondition";
        sharedDao.update(sqlMapId, dataMap);
    }

    public Object getRefundList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectRefundList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public void updateRefund(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.updateRefund";
        sharedDao.update(sqlMapId, dataMap);
    }

    public Object getListAndUpdateRefund(Object dataMap) {
        this.updateRefund(dataMap);
        Object result = this.getRefundList(dataMap);
        return result;
    }

    public Object getExchangeList(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectExchangeList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public void updateExchange(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.updateExchange";
        sharedDao.update(sqlMapId, dataMap);
    }

    public Object getListAndUpdateExchange(Object dataMap) {
        this.updateExchange(dataMap);
        Object result = this.getExchangeList(dataMap);
        return result;
    }

    public Object getRefundDetail(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectRefundDetail";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getExchageDetail(Object dataMap) {
        String sqlMapId = "AdminOrderMapper.selectExchangeDetail";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

}