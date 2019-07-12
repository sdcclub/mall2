package com.etc.controller;


import com.etc.model.service.CartService;
import com.etc.model.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"uid"})
@RequestMapping("/")
public class CartController {
    @Autowired
    private CartService cartService;

    @RequestMapping("checkout")
    public String showCart(Model model){
        //HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //int uid=Integer.parseInt(String.valueOf(request.getSession().getAttribute("uid")));
        System.out.println("hi");
        List<CartVO> cartVOList=cartService.getCart(1);
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
    public String payThings(@RequestParam(value="list[]",required = false) List<String> list){
        System.out.println("hi");
        System.out.println(list);
        List<Integer> resultList = new ArrayList<>();
        for (String s : list) {
            int i=Integer.parseInt(s);
            resultList.add(i);
        }
        cartService.payThings(resultList);
        return "payment";
    }
}
