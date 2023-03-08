package com.g9.workshop.g9_workshop.admin.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class AdminInquiryService {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;

    @Autowired
    SharedDao sharedDao;

    public Object getInquiryList(Object dataMap) {
        String sqlMapId = "AdminInquiryMapper.selectInquiryInfo";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getInquiryOne(Object dataMap) {
        String sqlMapId = "AdminInquiryMapper.selectInquiryDetail";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public void insertInquiryAnswer(Object dataMap) {
        ((HashMap) dataMap).put("PRIVATE_INQUIRY_ANSWER_UID", commonUtils.getUniqueSequence());
        String sqlMapId = "AdminInquiryMapper.insertInquiryAnswer";
        sharedDao.insert(sqlMapId, dataMap);

    }

    public Object insertAndGetInquiryList(Object dataMap) {
        this.insertInquiryAnswer(dataMap);
        Object result = getInquiryList(dataMap);
        return result;
    }

}