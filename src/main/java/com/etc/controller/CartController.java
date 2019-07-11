package com.etc.controller;


import com.etc.model.service.CartService;
import com.etc.model.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
}
