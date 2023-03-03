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

}