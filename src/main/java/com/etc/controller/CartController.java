package com.etc.controller;


import com.etc.model.service.CartService;
import com.etc.model.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class CartController {
    @Autowired
    private CartService cartService;

    @RequestMapping("checkout")
    public String showCart(Model model, HttpSession session){
        int uid=(Integer)session.getAttribute("uid");
        List<CartVO> cartVOList=cartService.getCart(uid);
        System.out.println(cartVOList.size());
        model.addAttribute("cartVOList",cartVOList);

        return "checkout";
    }
    @RequestMapping("removecart")
    public String removeCart(int cid){
        cartService.removeCart(cid);
        return "forward:/checkout.html";
    }

    @RequestMapping("minuscart")
    public String  minusCart(int cid){
        System.out.println("-");
        cartService.minusCart(cid);
        return "forward:/checkout.html";
    }
    @RequestMapping("pluscart")
    public String  plusCart(int cid){
        System.out.println("+");
        cartService.plusCart(cid);
        return "forward:/checkout.html";
    }

    @RequestMapping("paythings")
    @ResponseBody
    public String payThings(@RequestParam(value="list[]",required = false) List<String> list, HttpSession session){
        System.out.println(list);
        List<Integer> resultList = new ArrayList<>();
        for (String s : list) {
            int i=Integer.parseInt(s);
            resultList.add(i);
        }
        int uid=(Integer)session.getAttribute("uid");
        cartService.payThings(resultList,uid);
        return "pay";
    }
}
