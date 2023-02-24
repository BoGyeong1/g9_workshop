package com.g9.workshop.g9_workshop.admin.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class AdminDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    public Object insertProductImgs(String type, Map dataMap) {
        String sqlMapId;
        if (type.equals("thumbnail")) {
            sqlMapId = "AdminMapper.insertThumbnail";
        } else {
            sqlMapId = "AdminMapper.insertDetail";
        }
        Object result = sqlSessionTemplate.insert(sqlMapId, dataMap);
        return result;
    }

    public Object insertProductInfo(Map dataMap) {
        String sqlMapId = "AdminMapper.insertProductInfo";
        Object result = sqlSessionTemplate.insert(sqlMapId, dataMap);
        return result;
    }

    public Object selectCategories() {
        String sqlMapId = "AdminMapper.selectCategories";
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

    public Object selectPurposes() {
        String sqlMapId = "AdminMapper.selectPurposes";
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

    public Object selectBrands() {
        String sqlMapId = "AdminMapper.selectBrands";
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

    public Object selectOrigins() {
        String sqlMapId = "AdminMapper.selectOrigins";
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

}
