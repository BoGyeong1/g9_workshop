package com.g9.workshop.g9_workshop.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MainDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    public Object selectList(String sqlMapId) {
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

}
