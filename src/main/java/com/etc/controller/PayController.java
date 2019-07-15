package com.etc.controller;

import com.etc.model.dao.OrderMapper;
import com.etc.model.entity.Goods;
import com.etc.model.entity.Order;
import com.etc.model.entity.User;
import com.etc.model.service.PayService;
import com.etc.model.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class PayController {

    @Autowired
    PayService payService;

    @RequestMapping("payment")
    String pay(HttpServletRequest request, Model model){
        //User user= (User) request.getSession().getAttribute("user");
        User user=new User();
        user.setUid(1);
        List<OrderVO> orderVOList=payService.getPayList(user);
        model.addAttribute("ordervolist",orderVOList);
        return "payment";
    }

    @RequestMapping("alipay")
    String alipay(HttpServletRequest request,Integer oid){
        //Order order=payService.getOrderByOid(2);
        Order order=payService.getOrderByOid(oid);
        //把当前订单放入session中，jsp就能get,下面的支付成功也能get
        request.getSession().setAttribute("order",order);
        return "alipay.trade.page.pay";
    }

    @RequestMapping("history_orders")
    String historyOrders(Model model){
        //User user= (User) request.getSession().getAttribute("user");
        User user=new User();
        user.setUid(1);

        List<List<OrderVO>> orders=payService.getHistoryOrdersByUid(user.getUid());
        model.addAttribute("orders",orders);
        return "history_order";
    }

    @RequestMapping("success")
    String success(HttpServletRequest request,Model model){
        //获取当前支付的订单
        Order order= (Order) request.getSession().getAttribute("order");
        //Order order=payService.getOrderByOid(1);

        //通过onumber修改所有的购买日期
        payService.updateOrdersPaydate(order.getOnumber());

        //User user= (User) request.getSession().getAttribute("user");
        User user=new User();
        user.setUid(1);

        List<List<OrderVO>> orders=payService.getHistoryOrdersByUid(user.getUid());
        model.addAttribute("orders",orders);
        return "history_order";
    }

}
