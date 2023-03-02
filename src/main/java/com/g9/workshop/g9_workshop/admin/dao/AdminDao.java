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

    public Object selectProductInfos() {
        String sqlMapId = "AdminMapper.selectProductInfos";
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

    public Object selectProductEditInfo(String productUid) {
        String sqlMapId = "AdminMapper.selectProductEditInfo";
        Object result = sqlSessionTemplate.selectOne(sqlMapId, productUid);
        return result;
    }

    public Object updateProduct(Map dataMap) {
        String sqlMapId = "AdminMapper.updateProduct";
        Object result = sqlSessionTemplate.update(sqlMapId, dataMap);
        return result;
    }

    public Object insertOne(String sqlMapId, Map dataMap) {
        Object result = sqlSessionTemplate.insert(sqlMapId, dataMap);
        return result;
    }

    // 오버로딩
    public Object selectList(String sqlMapId, Map dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    // 오버로딩
    public Object selectList(String sqlMapId) {
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

    public Object selectOne(String sqlMapId, Object params) {
        Object result = sqlSessionTemplate.selectOne(sqlMapId, params);
        return result;
    }

    public Object updateOne(String sqlMapId, Object params) {
        Object result = sqlSessionTemplate.update(sqlMapId, params);
        return result;
    }

    public Object delete(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
        return result;
    }

}
