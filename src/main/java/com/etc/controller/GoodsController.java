package com.etc.controller;

import com.etc.model.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@Controller
public class GoodsController {
    private GoodsService goodsService;

    public GoodsService getGoodsService() {
        return goodsService;
    }

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @RequestMapping("showgoods")
    public String showGoods(Model model){
        System.out.println("hhhhhh");
        System.out.println(goodsService.findAll().size());
        model.addAttribute("list",goodsService.findAll());
        return "shop";
    }
}
