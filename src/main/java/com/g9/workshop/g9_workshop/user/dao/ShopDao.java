package com.g9.workshop.g9_workshop.user.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class ShopDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public Object getList(String sqlMapId) {
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

    public Object getWholeProduct(String sqlMapId) {
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

    public Object getProductByCategoryOrPrupose(String sqlMapId, String category) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, category);
        return result;
    }

    public Object getList(String sqlMapId, Map dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    public Object getMap(String sqlMapId, Map dataMap) {
        Object result = sqlSessionTemplate.selectOne(sqlMapId, dataMap);
        return result;
    }

    public Object deleteOne(String sqlMapId, Map dataMap) {
        Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
        return result;
    }

}
