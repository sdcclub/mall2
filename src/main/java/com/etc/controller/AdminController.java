package com.etc.controller;

import com.etc.model.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"uid"})
@RequestMapping("/")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("admin")
    public String getGoods(Model model){
        model.addAttribute("list",adminService.findAll());
        return "admin";
    }

    @RequestMapping("removegood")
    public String removeGood(int gid){
        adminService.removeGood(gid);
        return "forward:/admin.html";
    }
}
