package com.g9.workshop.g9_workshop.user.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SignUpDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class SignUpService {

    @Autowired
    SignUpDao signUpDao;

    @Autowired
    CommonUtils commonUtils;

    public Object insertBasic(Object dataMap) {
        String sqlMapId = "SignUpMapper.insertWithUID";
        Object result = signUpDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object insertAddress(Object dataMap) {
        String sqlMapId = "SignUpMapper.insertWithAddress";
        Object result = signUpDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object signUp(Object dataMap) {
        Object result = this.insertBasic(dataMap);
        result = this.insertAddress(dataMap);
        return result;

    }

    public Object select(Object dataMap) {
        String sqlMapId = "SignUpMapper.select";
        Object result = signUpDao.getOne(sqlMapId, dataMap);
        return result;

    }

}
