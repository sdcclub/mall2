package com.etc.controller;

import com.etc.model.entity.Cart;
import com.etc.model.entity.Goods;
import com.etc.model.entity.User;
import com.etc.model.service.CartService;
import com.etc.model.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;

@RequestMapping("/")
@Controller
public class GoodsController {
    private GoodsService goodsService;

    private CartService cartService;

    public CartService getCartService() {
        return cartService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public GoodsService getGoodsService() {
        return goodsService;
    }

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @RequestMapping("showgoods")
    public String showGoods(Model model){
        model.addAttribute("list",goodsService.findAll());
        return "shop";
    }

    @RequestMapping("specificgood")
    public String specificGood(int gid,Model model){
        Goods good = goodsService.findByGid(gid);
        model.addAttribute("good",good);
        return "single";
    }

    @RequestMapping(value = "addcart",method = RequestMethod.POST)
    public String addCart(int gid, int ccount){
//        User user = (User)request.getSession().getAttribute("user");
//        int uid = user.getUid();
        Date date = new Date();
        int temp = 1;
        Timestamp time = new Timestamp(date.getTime());
        Cart cart = new Cart(temp,gid,ccount,time);
        cartService.insertCart(cart);
        return "forward:/showgoods.html";
    }
}
