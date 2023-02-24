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

    public Object getOrderList(Object dataMap) {
        dataMap = new HashMap<String, Object>();

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        ((HashMap<String, Object>) dataMap).put("USER_UID", principal.getUserUid());
        String sqlMapId = "MypageMapper.selectOrderList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getOrderDetailList(Object dataMap) {
        String sqlMapId = "MypageMapper.selectOrderDetailList";
        Object result = shareDao.getList(sqlMapId, dataMap);
        return result;
    }

}
