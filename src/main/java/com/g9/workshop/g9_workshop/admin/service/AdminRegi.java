package com.g9.workshop.g9_workshop.admin.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class AdminRegi {
    @Autowired
    SharedDao shareDao;

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    public Object insertAdmin(Object dataMap) {
        String sqlMapId = "AdminMapper.insertAdmin";
        ((Map) dataMap).put("ADMIN_UID", commonUtils.getUniqueSequence());
        String password = (String) ((Map) dataMap).get("PASSWORD");
        ((Map) dataMap).put("PASSWORD", bcryptPasswordEncoder.encode(password));
        Object result = shareDao.insert(sqlMapId, dataMap);
        return result;
    }

}
