package com.g9.workshop.g9_workshop.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.g9.workshop.g9_workshop.configurations.PrincipalUser;
import com.g9.workshop.g9_workshop.user.service.CartService;
import com.g9.workshop.g9_workshop.user.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    CartService cartService;

    @Autowired
    OrderService orderService;

    @GetMapping("")
    public ModelAndView orderForm(ModelAndView modelAndView) {

        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userUid = principal.getUserUid();
        modelAndView.addObject("userUid", userUid);

        Object cartList = cartService.getCartList(userUid);
        modelAndView.addObject("cartList", cartList);

        Object addressList = orderService.getAddresses(userUid);
        modelAndView.addObject("addressList", addressList);

        Object deliveryLocations = orderService.getDeliveryLocations();
        modelAndView.addObject("deliveryLocations", deliveryLocations);

        Object userPoint = orderService.getUserPoint(userUid);
        modelAndView.addObject("userPoint", userPoint);

        Object paymentMethodList = orderService.getPaymentMethods();
        modelAndView.addObject("paymentMethodList", paymentMethodList);

        modelAndView.setViewName("user/order/orderform");
        return modelAndView;
    }

    @PostMapping("/add/address")
    public String addAddress(@RequestParam Map params) {

        String address = (String) params.get("address");
        String detail = (String) params.get("detail");

        if (!address.equals("") && address != null && !detail.equals("") && detail != null) {
            PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
            String userUid = principal.getUserUid();
            params.put("user-uid", userUid);
            orderService.insertAddress(params);
        }
        return "redirect:/order";
    }

    @ResponseBody
    @GetMapping("/address/getDetail")
    public Map<String, String> getAddressDetail(@RequestParam String addressUid) {
        Object result = orderService.getAddressDetail(addressUid);
        Map<String, String> addressInfo = (Map<String, String>) result;
        return addressInfo;
    }

    @ResponseBody
    @GetMapping("/getPrice")
    public Map<String, String> getPrice() {
        PrincipalUser principal = (PrincipalUser) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        String userUid = principal.getUserUid();
        Object cartList = cartService.getCartList(userUid);
        Map<String, String> resultMap = (Map<String, String>) orderService.getCalculatedPrice(cartList);
        return resultMap;
    }

}
