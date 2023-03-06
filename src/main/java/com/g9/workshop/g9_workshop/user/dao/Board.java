package com.g9.workshop.g9_workshop.user.dao;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component

public class Board {
    private String TITLE;
    private String POST_CATEGORY_UID;
    private Date CREATE_DATE;
    private Date MODIFIED_DATE;
    
    public String getTITLE() {
        return TITLE;
    }

    public void setTITLE(String TITLE) {
        this.TITLE = TITLE;
    }

    public String getPOST_CATEGORY_UID() {
        return POST_CATEGORY_UID;
    }

    public void setPOST_CATEGORY_UID(String POST_CATEGORY_UID) {
        this.POST_CATEGORY_UID = POST_CATEGORY_UID;
    }

    public Date getCREATE_DATE() {
        return CREATE_DATE;
    }

    public void setCREATE_DATE(Date CREATE_DATE) {
        this.CREATE_DATE = CREATE_DATE;
    }

    public Date getMODIFIED_DATE() {
        return MODIFIED_DATE;
    }

    public void setMODIFIED_DATE(Date MODIFIED_DATE) {
        this.MODIFIED_DATE = MODIFIED_DATE;
    }
}