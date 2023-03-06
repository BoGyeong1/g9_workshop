package com.g9.workshop.g9_workshop.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.admin.dao.AdminDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class AdminBoardService {
    @Autowired
    AdminDao adminDao;
    @Autowired
    CommonUtils commonUtils;

    public Object insertBoard(Map dataMap) {
        String sqlMapId = "BoardMapper.insertBoard";
        Object result = adminDao.insertOne(sqlMapId, dataMap);
        return result;
    }

    public Object selectBoard(Object dataMap) {
        String sqlMapId = "BoardMapper.selectBoard";
        Object result = adminDao.selectList(sqlMapId);
        return result;
    }

    public Object insertAdmin(Object dataMap) {
        String sqlMapId = "BoardMapper.insertBoard";
        ((Map) dataMap).put("POST_UID", commonUtils.getUniqueSequence());
        Object result = adminDao.insertOne(sqlMapId, dataMap);
        return result;
    }
    
    
    public Object getOne(Object dataMap) {
        String sqlMapId = "BoardMapper.selectBoardUID";
        Object result = adminDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object getBoardCategories() {
        Object result = adminDao.selectBoardCategories();
        return result;
    }

    public Object updateOne(Object dataMap) {
        String sqlMapId = "BoardMapper.updateByPost";
        Object result = adminDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object updateAndGetList(Object dataMap) {
        Object result = this.updateOne(dataMap);
        result = this.selectBoard(dataMap);
        return result;
    }

    public Object updateProduct(Map dataMap) {
        Object result = adminDao.updateProduct(dataMap);
        return result;
    }

}
