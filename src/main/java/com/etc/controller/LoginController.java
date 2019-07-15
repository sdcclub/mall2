package com.etc.controller;

import com.etc.model.entity.User;
import com.etc.model.service.LoginService;
import com.etc.model.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;

@RequestMapping("/")
@Controller
@SessionAttributes({"uid"})
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
    public String login(UserVO userVO, String identification, Model model, HttpSession session){
        System.out.println(identification);
        int re=loginService.checkAccount(userVO,identification==null);
        System.out.println(re);
        if(re!=-1) {
            session.setAttribute("uid",re);
            return "shop";
        }else {
            model.addAttribute("msg","用户名或密码错误，请重新登录");
            return "login";
        }
    }

    @RequestMapping("showregister")
    public String register(){
        return "register";
    }

    @RequestMapping("checkrepeat")
    @ResponseBody
    public boolean checkRepeat(String username){
        System.out.println("checking");
        return loginService.checkRepeat(username);
    }

    @RequestMapping("doregister")
    public String doRegister(User user){
        user.setUregistdate(new Date());
        loginService.register(user);
        return "shop";
    }
}
