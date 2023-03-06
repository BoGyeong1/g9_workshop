package com.g9.workshop.g9_workshop.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.MainDao;
import com.g9.workshop.g9_workshop.user.dao.SharedDao;

@Service
public class MainService {

    @Autowired
    MainDao mainDao;

    @Autowired
    SharedDao sharedDao;

    public Object getEventList(String eventStatus) {
        String sqlMapId = null;
        if (eventStatus.equals("ongoing")) {
            sqlMapId = "EventMapper.selectOngoingEvent";
        } else if (eventStatus.equals("ended")) {
            sqlMapId = "EventMapper.selectEndedEvent";
        }
        Object result = mainDao.selectList(sqlMapId);
        return result;
    }

    public Object likeCheck(Map dataMap) {
        String sqlMapId = "CommonMapper.like";
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object dislikeCheck(Map dataMap) {
        String sqlMapId = "CommonMapper.dislike";
        Object result = sharedDao.deleteOne(sqlMapId, dataMap);
        return result;
    }

}
