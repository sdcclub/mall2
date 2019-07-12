package com.etc.controller;

import com.etc.model.dao.OrderMapper;
import com.etc.model.entity.Order;
import com.etc.model.entity.User;
import com.etc.model.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PayController {

    @Autowired
    PayService payService;

    @RequestMapping("payment")
    String pay(HttpServletRequest request, Model model, Order order){
        User user= (User) request.getSession().getAttribute("user");
        model.addAttribute("goodslist",payService.getPayList(user));
        model.addAttribute("order",order);
        return "forward:/payment.html";
    }
}
