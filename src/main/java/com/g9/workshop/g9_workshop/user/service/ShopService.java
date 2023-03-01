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

    public Object getProductList(String category) {
        Object result = null;
        String sqlMapId;
        if (category.equals("WHOLE")) {
            sqlMapId = "ShopMapper.getWholeProduct";
            result = shopDao.getWholeProduct(sqlMapId);
        } else if (category.equals("SALE")) {
            sqlMapId = "ShopMapper.getSaleProduct";
            result = shopDao.getWholeProduct(sqlMapId);
        } else {
            switch (category) {
                case "PAPPER", "FABRIC", "PLASTIC", "GLASS" -> {
                    sqlMapId = "ShopMapper.getProductByCategory";
                    result = shopDao.getProductByCategoryOrPrupose(sqlMapId, category);
                }
                case "LIVING", "KITCHEN", "STATIONERY", "ACCESSORIES" -> {
                    sqlMapId = "ShopMapper.getProductByPurpose";
                    result = shopDao.getProductByCategoryOrPrupose(sqlMapId, category);
                }
            }
        }
        return result;
    }

}
