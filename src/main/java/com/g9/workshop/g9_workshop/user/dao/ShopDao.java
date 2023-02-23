package com.g9.workshop.g9_workshop.user.dao;

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

}
