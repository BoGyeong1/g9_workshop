package com.g9.workshop.g9_workshop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.ShopDao;

@Service
public class ShopService {

    @Autowired
    ShopDao shopDao;

    public Object getCategories() {
        String sqlMapId = "ShopMapper.getCategories";
        Object result = shopDao.getList(sqlMapId);
        return result;
    }

    public Object getPurposes() {
        String sqlMapId = "ShopMapper.getPurposes";
        Object result = shopDao.getList(sqlMapId);
        return result;
    }

}
