package com.g9.workshop.g9_workshop.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.admin.dao.AdminDao;
import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class AdminBoardService {

    @Autowired
    AdminDao adminDao;

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    SharedDao sharedDao;

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

    public Object selectCs(Object dataMap) {
        String sqlMapId = "FaqMapper.selectFAQ";
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

    public Object getCsCategories() {
        Object result = adminDao.selectCsCategories();
        return result;
    }

    public Object updateOne(Map dataMap) {
        String isTopFixed = (String) dataMap.get("TOP_FIXED");
        if (isTopFixed != null) {
            isTopFixed = "YES";
        } else {
            isTopFixed = "NO";
        }
        dataMap.put("TOP_FIXED", isTopFixed);
        String sqlMapId = "BoardMapper.updateByPost";
        Object result = adminDao.update(sqlMapId, dataMap);
        return result;
    }

    public Object updateAndGetList(Map dataMap) {
        Object result = this.updateOne(dataMap);
        result = this.selectBoard(dataMap);
        return result;
    }

    public Object updateProduct(Map dataMap) {
        Object result = adminDao.updateProduct(dataMap);
        return result;
    }

    public Object createPost(Map dataMap) {
        String isTopFixed = (String) dataMap.get("TOP_FIXED");
        if (isTopFixed != null) {
            isTopFixed = "YES";
        } else {
            isTopFixed = "NO";
        }
        dataMap.put("TOP_FIXED", isTopFixed);
        String postUid = commonUtils.getUniqueSequence();
        dataMap.put("POST_UID", postUid);
        String sqlMapId = "BoardMapper.insertBoard";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object csPost(Map dataMap) {
        String FAQ_UID = commonUtils.getUniqueSequence();
        dataMap.put("FAQ_UID", FAQ_UID);
        String sqlMapId = "FaqMapper.insertFAQ";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object delete(Map dataMap) {
        String sqlMapId = "BoardMapper.deleteByPost";
        Object result = adminDao.delete(sqlMapId, dataMap);
        return result;
    }
    public Object deleteFaq(Map dataMap) {
        String sqlMapId = "FaqMapper.deleteFaq";
        Object result = adminDao.delete(sqlMapId, dataMap);
        return result;
    }

    public Object getFaqPost(Map dataMap) {
        String sqlMapId = "FaqMapper.getFaqPost";
        Object result = sharedDao.getOne(sqlMapId, dataMap);
        return result;
    }

    public Object updateFaqPost(Map dataMap) {
        String sqlMapId = "FaqMapper.updateFaqPost";
        Object result = sharedDao.update(sqlMapId, dataMap);
        return result;
    }

}
