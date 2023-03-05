package com.g9.workshop.g9_workshop.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.g9.workshop.g9_workshop.user.dao.SharedDao;
import com.g9.workshop.g9_workshop.utils.CommonUtils;

@Service
public class OrderService {

    @Autowired
    SharedDao sharedDao;

    @Autowired
    CommonUtils commonUtils;

    public Object getAddresses(String userUid) {
        String sqlMapId = "OrderMapper.selectAddresses";
        Object result = sharedDao.getList(sqlMapId, userUid);
        return result;
    }

    public Object getAddressDetail(String addressUid) {
        String sqlMapId = "OrderMapper.selectAddressesWithAddressUid";
        Object result = sharedDao.getOne(sqlMapId, addressUid);
        return result;
    }

    public Object insertAddress(Map dataMap) {
        String sqlMapId = "OrderMapper.insertAddress";
        dataMap.put("address-uid", commonUtils.getUniqueSequence());
        Object result = sharedDao.insert(sqlMapId, dataMap);
        return result;
    }

    public Object getDeliveryLocations() {
        String sqlMapId = "OrderMapper.selectDeliveryLocations";
        Object result = sharedDao.getList(sqlMapId);
        return result;
    }

    public Object getUserPoint(String userUid) {
        String sqlMapId = "OrderMapper.selectUserPoint";
        Object result = sharedDao.getOne(sqlMapId, userUid);
        return result;
    }

    public Object getPaymentMethods() {
        String sqlMapId = "OrderMapper.selectPaymentMethods";
        Object result = sharedDao.getList(sqlMapId);
        return result;
    }

    public Object getCalculatedPrice(Object cartList) {
        int productPrice = 0;
        int price;
        int discountRate;
        int quantity;
        int totalPrice;
        int deliveryPrice;

        List list = (List) cartList;
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> cart = (Map<String, Object>) list.get(i);
            price = (int) cart.get("PRICE");
            discountRate = (int) cart.get("DISCOUNT_RATE");
            quantity = (int) cart.get("QUANTITY");
            totalPrice = price * (100 - discountRate) / 100 * quantity;
            productPrice += totalPrice;
        }

        if (productPrice < 50000) {
            deliveryPrice = 3000;
        } else {
            deliveryPrice = 0;
        }

        Map<String, String> resultMap = new HashMap<>();
        resultMap.put("productPrice", productPrice + "");
        resultMap.put("deliveryPrice", deliveryPrice + "");
        resultMap.put("totalPrice", (productPrice + deliveryPrice) + "");

        return resultMap;
    }

    public void orderSubmit(Map params) {
        String sqlMapId;
        String addressUid = (String) params.get("address-uid");
        String deliveryLocationUid = (String) params.get("delivery-location-uid");
        // 주소가 직접 입력인 경우
        if (addressUid.equals("self")) {
            addressUid = commonUtils.getUniqueSequence();
            params.put("address-uid", addressUid);
            sqlMapId = "OrderMapper.insertSelfAddress";
            sharedDao.insert(sqlMapId, params);
        }
        // 배송장소가 직접 입력인 경우
        if (deliveryLocationUid.equals("self")) {
            deliveryLocationUid = commonUtils.getUniqueSequence();
            params.put("delivery-location-uid", deliveryLocationUid);
            sqlMapId = "OrderMapper.insertSelfDeliveryLocation";
            sharedDao.insert(sqlMapId, params);
        }
        // 주문내역 생성
        String orderUid = commonUtils.getUniqueSequence();
        params.put("orderUid", orderUid);
        sqlMapId = "OrderMapper.insertOrder";
        sharedDao.insert(sqlMapId, params);

    }

}
