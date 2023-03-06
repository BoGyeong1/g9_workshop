package com.g9.workshop.g9_workshop.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.user.dao.ShopDao;

@Service
public class ShopService {

    @Autowired
    ShopDao shopDao;

    @Autowired
    SharedDao sharedDao;

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

    public Object getProductDetailInfo(Map dataMap) {
        String sqlMapId = "ShopMapper.getProductDetail";
        Object result = shopDao.getMap(sqlMapId, dataMap);
        return result;
    }

    public Object getThumbnailImgs(Map dataMap) {
        String sqlMapId = "ShopMapper.getThumbmailImgs";
        Object result = shopDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getDetailImgs(Map dataMap) {
        String sqlMapId = "ShopMapper.getDetailImgs";
        Object result = shopDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getFavorite(Map dataMap) {
        String sqlMapId = "ShopMapper.getFavorite";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getReview(Map dataMap) {
        String sqlMapId = "ShopMapper.getReview";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

}
