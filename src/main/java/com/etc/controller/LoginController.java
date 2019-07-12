package com.etc.controller;

import com.etc.model.service.LoginService;
import com.etc.model.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@Controller
public class LoginController {

    private LoginService loginService;

    public LoginService getLoginService() {
        return loginService;
    }

    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    @RequestMapping("login")
    public String login(UserVO userVO, String identification, Model model){
        System.out.println(identification);
        boolean re=loginService.checkAccount(userVO,identification==null);
        System.out.println(re);
        if(re) {
            return "index";
        }else {
            model.addAttribute("msg","用户名或密码错误，请重新登录");
            return "login";
        }
    }
}
