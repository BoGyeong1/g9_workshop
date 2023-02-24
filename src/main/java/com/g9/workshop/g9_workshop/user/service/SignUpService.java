package com.g9.workshop.g9_workshop.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class SignUpService {

    @Autowired
    SharedDao shareDao;

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    public Object insertBasic(Object dataMap) {
        String sqlMapId = "SignUpMapper.insertWithUID";
        ((Map) dataMap).put("USER_UID", commonUtils.getUniqueSequence());
        String password = (String) ((Map) dataMap).get("PASSWORD");
        ((Map) dataMap).put("PASSWORD", bcryptPasswordEncoder.encode(password));
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
