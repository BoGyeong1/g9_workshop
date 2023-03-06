package com.g9.workshop.g9_workshop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;

@Service
public class BoardService {

    @Autowired
    SharedDao sharedDao;

    public Object selectBoard(Object dataMap) {
        String sqlMapId = "BoardMapper.selectBoard";
        Object result = sharedDao.getList(sqlMapId);
        return result;
    }

    public Object getBoardList() {
        String sqlMapId = "BoardMapper.selectBoardLIst";
        Object result = sharedDao.getList(sqlMapId);
        return result;
    }
}
