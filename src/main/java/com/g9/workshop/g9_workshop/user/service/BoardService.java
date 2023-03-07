package com.g9.workshop.g9_workshop.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.admin.dao.AdminDao;
import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.Paginations;

@Service
public class BoardService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    AdminDao adminDao;

    public Object selectBoard(Object dataMap) {
        String sqlMapId = "BoardMapper.selectBoard";
        Object result = sharedDao.getList(sqlMapId);
        return result;
    }

    public Object getBoardList(Object dataMap) {
        Map<String, Object> result = new HashMap();
        int postCnt = (int) this.getPostCount();
        int currentPage = (int) ((Map<String, Object>) dataMap).get("currentPage");
        Paginations paginations = new Paginations(postCnt, currentPage);
        result.put("paginations", paginations);
        ((Map) dataMap).put("pageBegin", paginations.getPageBegin());
        ((Map) dataMap).put("pageScale", paginations.getPageScale());
        result.put("postList", this.getPostList(dataMap));
        return result;
    }

    public Object getPostList(Object dataMap) {
        String sqlMapId = "BoardMapper.getPostList";
        Object result = sharedDao.getList(sqlMapId, dataMap);
        return result;
    }

    public Object getBoardUid(Object dataMap) {
        String sqlMapId = "BoardMapper.selectBoardUID ";
        Object result = sharedDao.getList(sqlMapId);
        return result;
    }

    public Object getOne(Object dataMap) {
        String sqlMapId = "BoardMapper.selectBoardLIst";
        Object result = adminDao.selectList(sqlMapId, dataMap);
        return result;
    }

    public Object getPostCount() {
        String sqlMapId = "BoardMapper.selectBoardCount";
        Object result = sharedDao.getOne(sqlMapId);
        return result;
    }

}
