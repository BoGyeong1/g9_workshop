package com.g9.workshop.g9_workshop.user.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.ShareDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class SignUpService {

    @Autowired
    ShareDao shareDao;

    @Autowired
    CommonUtils commonUtils;

    public Object insertBasic(Object dataMap) {
        String sqlMapId = "SignUpMapper.insertWithUID";
        Object result = shareDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object insertAddress(Object dataMap) {
        String sqlMapId = "SignUpMapper.insertWithAddress";
        Object result = shareDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object signUp(Object dataMap) {
        Object result = this.insertBasic(dataMap);
        result = this.insertAddress(dataMap);
        return result;
    }

    public Object emailCheck(String email) {
        String sqlMapId = "SignUpMapper.selectCntEmailConfirm";
        Object result = shareDao.getOne(sqlMapId, email);
        return result;
    }

}
