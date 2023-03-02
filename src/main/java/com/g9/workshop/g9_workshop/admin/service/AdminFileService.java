package com.g9.workshop.g9_workshop.admin.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.g9.workshop.g9_workshop.admin.dao.AdminDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class AdminFileService {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    AdminDao adminDao;

    public void fileInsert(MultipartHttpServletRequest request, Map<String, Object> params) {

        String productUid = commonUtils.getUniqueSequence();
        params.put("productUid", productUid);
        adminDao.insertProductInfo(params);

        Iterator<String> fileNames = request.getFileNames();
        String relativePath = "src/main/resources/static/files/";
        String absolutePath = commonUtils.getAbsolutePath(relativePath);
        String storePath = absolutePath + productUid + File.separator;
        File newPath = new File(storePath);
        newPath.mkdir();

        Map<String, Object> fileInsertMap;
        String fileUid;
        String fileName;
        MultipartFile file;
        String originFileName;
        String storeFileName;
        String physicalFileName;
        int thumbnailCnt = 1;
        int detailCnt = 1;

        while (fileNames.hasNext()) {
            fileName = fileNames.next();
            fileUid = commonUtils.getUniqueSequence();
            file = request.getFile(fileName);
            originFileName = file.getOriginalFilename();
            try {
                if (file != null && file.getSize() > 0) {
                    physicalFileName = fileName + originFileName.substring(originFileName.length() - 4);
                    storeFileName = storePath + physicalFileName;
                    file.transferTo(new File(storeFileName));
                    fileInsertMap = new HashMap<>();
                    fileInsertMap.put("IMG_UID", fileUid);
                    fileInsertMap.put("PRODUCT_UID", productUid);
                    fileInsertMap.put("ORIGIN_FILE_NAME", originFileName);
                    fileInsertMap.put("PHYSICAL_FILE_NAME", physicalFileName);
                    fileInsertMap.put("DIRECTORY_NAME", ("files/" + productUid + "/"));

                    if (fileName.charAt(0) == 't') {
                        fileInsertMap.put("EXPOSURE_ORDER", thumbnailCnt++);
                        adminDao.insertProductImgs("thumbnail", fileInsertMap);
                    } else if (fileName.charAt(0) == 'd') {
                        fileInsertMap.put("EXPOSURE_ORDER", detailCnt++);
                        adminDao.insertProductImgs("detail", fileInsertMap);
                    }
                }
            } catch (IOException exception) {

            }

        }

    }

    public void insertEventBanner(String eventUid, MultipartFile banner) {

        String eventBannerUid = commonUtils.getUniqueSequence();
        String directoryName = "files/" + eventBannerUid + "/";

        Map<String, Object> dataMap = new HashMap();
        dataMap.put("eventBannerUid", eventBannerUid);
        dataMap.put("eventUid", eventUid);
        dataMap.put("originFileName", banner.getOriginalFilename());
        dataMap.put("physicalFileName", banner.getOriginalFilename());
        dataMap.put("directoryName", directoryName);

        String relativePath = "src/main/resources/static/files/";
        String absolutePath = commonUtils.getAbsolutePath(relativePath);
        String storePath = absolutePath + eventBannerUid + File.separator;
        String storeFileName = storePath + banner.getOriginalFilename();
        File newPath = new File(storePath);
        newPath.mkdir();

        try {
            banner.transferTo(new File(storeFileName));
        } catch (IllegalStateException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        String sqlMapId = "EventMapper.insertEventBanner";
        adminDao.insertOne(sqlMapId, dataMap);
    }

}
