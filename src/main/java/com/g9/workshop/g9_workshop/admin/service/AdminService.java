package com.g9.workshop.g9_workshop.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.admin.dao.AdminDao;

@Service
public class AdminService {

    @Autowired
    AdminDao adminDao;

    public Object getCategotyList() {
        Object result = adminDao.selectCategories();
        return result;
    }

    public Object getPurposeList() {
        Object result = adminDao.selectPurposes();
        return result;
    }

    public Object getBrandList() {
        Object result = adminDao.selectBrands();
        return result;
    }

    public Object getOriginList() {
        Object result = adminDao.selectOrigins();
        return result;
    }

    public Object getProductInfoList() {
        Object result = adminDao.selectProductInfos();
        return result;
    }

    public Object getProductEditInfo(String productUid) {
        Object result = adminDao.selectProductEditInfo(productUid);
        return result;
    }

    public Object updateProduct(Map dataMap) {
        Object result = adminDao.updateProduct(dataMap);
        return result;
    }

    public Object insertEvent(Map dataMap) {
        String sqlMapId = "EventMapper.insertEvent";
        Object result = adminDao.insertOne(sqlMapId, dataMap);
        return result;
    }

    public Object getEventInfos() {
        String sqlMapId = "EventMapper.selectEventList";
        Object result = adminDao.selectList(sqlMapId);
        return result;
    }

    public Object getEventInfos(String evenet_uid) {
        String sqlMapId = "EventMapper.selectEventList";
        Object result = adminDao.selectOne(sqlMapId, evenet_uid);
        return result;
    }

}
