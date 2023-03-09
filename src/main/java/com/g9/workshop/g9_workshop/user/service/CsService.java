package com.g9.workshop.g9_workshop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;

@Service
public class CsService {
    @Autowired
    SharedDao sharedDao;

    public Object getCSList(Object dataMap) {
        String sqlMapId = "FaqMapper.selectFAQ";
        Object result = sharedDao.getList(sqlMapId);
        return result;
    }


}
