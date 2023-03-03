package com.g9.workshop.g9_workshop.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class CartService {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    SharedDao sharedDao;

    public Object getCartList(String userUid) {
        String sqlMapId = "CartMapper.selectCartList";
        Object result = sharedDao.getList(sqlMapId, userUid);
        return result;
    }

    public Object insertCart(Map dataMap) {
        String sqlMapId = "CartMapper.insertCart";
        dataMap.put("cart-uid", commonUtils.getUniqueSequence());
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object deleteCart(Map dataMap) {
        String sqlMapId = "CartMapper.deleteCart";
        Object result = sharedDao.deleteOne(sqlMapId, dataMap);
        return result;
    }

}