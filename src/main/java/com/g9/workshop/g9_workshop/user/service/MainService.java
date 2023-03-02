package com.g9.workshop.g9_workshop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.MainDao;

@Service
public class MainService {

    @Autowired
    MainDao mainDao;

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

}
