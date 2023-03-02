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
public class AdminMemberService {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    @Autowired
    SharedDao sharedDao;

    public Object getUserList(Object dataMap) {
        String sqlMapId = "AdminMemberMapper.selectMemberList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getTotal(Object dataMap) {
        String sqlMapId = "AdminMemberMapper.selectTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getUserListWithPagination(Object dataMap) {
        Map<String, Object> result = new HashMap<String, Object>();
        int totalCount = (int) this.getTotal(dataMap);
        int currentPage = (int) ((Map) dataMap).get("currentPage");
        Paginations paginations = new Paginations(totalCount, currentPage);
        result.put("paginations", paginations);
        ((Map) dataMap).put("pageBegin", paginations.getPageBegin());
        ((Map) dataMap).put("pageScale", paginations.getPageScale());
        result.put("resultList", this.getUserList(dataMap));
        return result;
    }

    public Object getUserInfo(Object dataMap) {
        String sqlMapId = "AdminMemberMapper.selectMemberInfo";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getUserConditions(Object dataMap) {
        String sqlMapId = "AdminMemberMapper.selectUserContions";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public void updateUserInfo(Object dataMap) {
        String sqlMapId = "AdminMemberMapper.updateUserInfo";
        sharedDao.update(sqlMapId, dataMap);
    }

    public Object updateUserInfoAndGetList(Object dataMap) {
        this.updateUserInfo(dataMap);
        Object result = this.getUserListWithPagination(dataMap);
        return result;
    }

    public Object getUserSearchList(Object dataMap) {
        String sqlMapId = "AdminMemberMapper.selectUserSearch";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getSearchTotal(Object dataMap) {
        String sqlMapId = "AdminMemberMapper.selectSearchTotal";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;

    }

    public Object getUserSearchListWithPagination(Object dataMap) {
        Map<String, Object> result = new HashMap<String, Object>();
        int totalCount = (int) this.getSearchTotal(dataMap);
        int currentPage = (int) ((Map) dataMap).get("currentPage");
        Paginations paginations = new Paginations(totalCount, currentPage);
        result.put("paginations", paginations);
        ((Map) dataMap).put("pageBegin", paginations.getPageBegin());
        ((Map) dataMap).put("pageScale", paginations.getPageScale());
        result.put("resultList", this.getUserSearchList(dataMap));
        return result;
    }

    public void deleteUserInfo(Object dataMap) {
        sharedDao.deleteOne("AdminMemberMapper.deleteUserInfo", dataMap);

    }

    public Object deleteUserInfoGetList(Object dataMap) {
        this.deleteUserInfo(dataMap);
        Object result = this.getUserListWithPagination(dataMap);
        return result;
    }

}
