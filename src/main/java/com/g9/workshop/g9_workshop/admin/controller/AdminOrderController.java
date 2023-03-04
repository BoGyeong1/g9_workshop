package com.g9.workshop.g9_workshop.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.admin.service.AdminOrderService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    AdminOrderService adminOrderService;

    // [GYEONG] 주문내역 pagination
    @GetMapping("/orderList/{currentPage}")
    public ModelAndView userListWithPagination(@RequestParam Map params, @PathVariable String currentPage,
            ModelAndView modelAndView) {
        params.put("currentPage", Integer.parseInt(currentPage));
        Object resultMap = adminOrderService.getOrderListWithPagination(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/order/list");
        return modelAndView;
    }

    @PostMapping("/search")
    public ModelAndView orderSearch(@RequestParam Map params, ModelAndView modelAndView) {
        Object resultMap = adminOrderService.getCancelOrderSearchList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/order/search");
        return modelAndView;
    }

    // [GYEONG] 주문 상세내역 출력
    @GetMapping("/orderDetail/{orderUid}")
    public ModelAndView orderDetail(@RequestParam Map params, @PathVariable String orderUid,
            ModelAndView modelAndView) {
        params.put("ORDER_UID", orderUid);
        Object resultMap = adminOrderService.getOrdeDetailList(params);
        modelAndView.addObject("resultMap", resultMap);
        Object address = adminOrderService.getOrdeDetailAddress(params);
        modelAndView.addObject("address", address);
        modelAndView.setViewName("admin/order/detaillist");
        return modelAndView;
    }

    // [GYEONG] 주문 취소내역
    @GetMapping("/cancelOrder/{currentPage}")
    public ModelAndView cancelOrder(@RequestParam Map params, @PathVariable String currentPage,
            ModelAndView modelAndView) {
        params.put("currentPage", Integer.parseInt(currentPage));
        Object resultMap = adminOrderService.getCancelOrderListWithPagination(params);
        modelAndView.addObject("resultMap", resultMap);
        Object statistics = adminOrderService.getCancelOrderStatistics(params);
        modelAndView.addObject("statistics", statistics);
        modelAndView.setViewName("admin/order/cancel_list");
        return modelAndView;
    }

    // // [GYEONG] 배송내역
    // @GetMapping("/shppingList/{currentPage}")
    // public ModelAndView shppingListWithPagination(@RequestParam Map params,
    // @PathVariable String currentPage,
    // ModelAndView modelAndView) {
    // params.put("currentPage", Integer.parseInt(currentPage));
    // Object resultMap = adminOrderService.getShippingListWithPagination(params);
    // modelAndView.addObject("resultMap", resultMap);
    // modelAndView.setViewName("admin/order/shipping");
    // return modelAndView;
    // }

    // [GYEONG] 배송내역
    @GetMapping("/shppingList")
    public ModelAndView shppingList(@RequestParam Map params, ModelAndView modelAndView) {
        Object resultMap = adminOrderService.getShippingList(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/order/shipping");
        return modelAndView;
    }

    // [GYEONG] 배송내역
    @PostMapping("/shppingList/condition")
    @ResponseBody
    public List<Map<String, Object>> shppingListWithRadio(@RequestParam String condition) {
        List<Map<String, Object>> shippingList = (List<Map<String, Object>>) adminOrderService
                .getShippingListRadio(condition);
        return shippingList;
    }

    // [GYEONG] 운송장등록
    @GetMapping("/waybillCode/{orderDetailUid}")
    public ModelAndView waybillCode(@RequestParam Map params, @PathVariable String orderDetailUid,
            ModelAndView modelAndView) {
        params.put("ORDER_DETAIL_UID", orderDetailUid);
        Object logistics = adminOrderService.getLogisticsList(params);
        Object orderConditions = adminOrderService.getOrderConditions(params);
        Object waybill = adminOrderService.getWaybillInfo(params);
        modelAndView.addObject("logistics", logistics);
        modelAndView.addObject("orderConditions", orderConditions);
        modelAndView.addObject("waybills", waybill);
        modelAndView.setViewName("admin/order/waybillCode");
        return modelAndView;
    }

    // [GYEONG] 운송장등록
    @PostMapping("/waybillCodeUpdate")
    public ModelAndView waybillCodeUpdate(@RequestParam Map params,
            ModelAndView modelAndView) {
        Object resultMap = adminOrderService.getListAndUpdateWaybillInfo(params);
        modelAndView.addObject("resultMap", resultMap);
        modelAndView.setViewName("admin/order/shipping");
        return modelAndView;
    }

    // [GYEONG] 환불 내역
    @GetMapping("/refundList")
    public ModelAndView refundList(@RequestParam Map params,
            ModelAndView modelAndView) {
        Object refund = adminOrderService.getRefundList(params);
        modelAndView.addObject("refund", refund);
        Object exchange = adminOrderService.getExchangeList(params);
        modelAndView.addObject("exchange", exchange);
        modelAndView.setViewName("admin/order/ref_exc_list");
        return modelAndView;
    }

    // [GYEONG] 환불완료처리
    @GetMapping("/updateRefund/{orderDetailUid}")
    public ModelAndView updateRefund(@RequestParam Map params, @PathVariable String orderDetailUid,
            ModelAndView modelAndView) {
        params.put("ORDER_DETAIL_UID", orderDetailUid);
        Object refund = adminOrderService.getListAndUpdateExchange(params);
        modelAndView.addObject("refund", refund);
        Object exchange = adminOrderService.getExchangeList(params);
        modelAndView.addObject("exchange", exchange);
        modelAndView.setViewName("admin/order/ref_exc_list");
        return modelAndView;
    }

    // [GYEONG] 교환완료처리
    @GetMapping("/updateExchange/{orderDetailUid}")
    public ModelAndView updateExchange(@RequestParam Map params, @PathVariable String orderDetailUid,
            ModelAndView modelAndView) {
        params.put("ORDER_DETAIL_UID", orderDetailUid);
        Object refund = adminOrderService.getRefundList(params);
        modelAndView.addObject("refund", refund);
        Object exchange = adminOrderService.getListAndUpdateExchange(params);
        modelAndView.addObject("exchange", exchange);
        modelAndView.setViewName("admin/order/ref_exc_list");
        return modelAndView;
    }

    // [GYEONG] 환불상세사유
    @GetMapping("/refundDetail/{refundOrderUid}")
    public ModelAndView refundDetail(@RequestParam Map params, @PathVariable String refundOrderUid,
            ModelAndView modelAndView) {
        params.put("REFUND_ORDER_UID", refundOrderUid);

        Object resultMap = adminOrderService.getRefundDetail(params);
        String json = new Gson().toJson(resultMap);
        Map<String, Object> map = new Gson().fromJson(json, Map.class);
        String content = (String) map.get("REASON_DETAIL");
        modelAndView.addObject("content", content);
        modelAndView.setViewName("admin/order/reason_detail");
        return modelAndView;
    }

    // [GYEONG] 교환상세사유
    @GetMapping("/exchangeDetail/{exchangeOrderUid}")
    public ModelAndView exchangeDetail(@RequestParam Map params, @PathVariable String exchangeOrderUid,
            ModelAndView modelAndView) {
        params.put("EXCHANGE_ORDER_UID", exchangeOrderUid);

        Object resultMap = adminOrderService.getExchageDetail(params);
        String json = new Gson().toJson(resultMap);
        Map<String, Object> map = new Gson().fromJson(json, Map.class);
        String content = (String) map.get("REASON_DETAIL");
        modelAndView.addObject("content", content);
        modelAndView.setViewName("admin/order/reason_detail");
        return modelAndView;
    }

}
