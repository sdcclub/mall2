package com.etc.model.service;

import com.etc.model.dao.AdminMapper;
import com.etc.model.dao.UserMapper;
import com.etc.model.entity.Admin;
import com.etc.model.entity.AdminExample;
import com.etc.model.entity.User;
import com.etc.model.entity.UserExample;
import com.etc.model.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    private AdminMapper adminMapper;
    private UserMapper userMapper;

    public AdminMapper getAdminMapper() {
        return adminMapper;
    }

    @Autowired
    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public UserMapper getUserMapper() {
        return userMapper;
    }

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public boolean checkAccount(UserVO userVO,boolean identification){
        System.out.println("Login Service");
        if(identification)
            return checkUserAccount(userVO);
        else
            return checkAdminAccount(userVO);
    }

    private boolean checkUserAccount(UserVO userVO){
        System.out.println("Check User");
        UserExample ue=new UserExample();
        ue.createCriteria().andUsernameEqualTo(userVO.getUsername())
                .andUpasswordEqualTo(userVO.getPassword());
        int row=userMapper.selectByExample(ue).size();
        return row>0;
    }

    private boolean checkAdminAccount(UserVO userVO){
        System.out.println("Check Admin");
        AdminExample ue=new AdminExample();
        System.out.println(ue);
        ue.createCriteria().andAnameEqualTo(userVO.getUsername())
                .andApasswordEqualTo(userVO.getPassword());
        int row=adminMapper.selectByExample(ue).size();
        return row>0;
    }
}
