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

import java.util.List;

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

    public int checkAccount(UserVO userVO,boolean identification){
        if(identification) {
            return checkUserAccount(userVO);
        }
        else {
            return checkAdminAccount(userVO);
        }
    }

    private int checkUserAccount(UserVO userVO){
        UserExample ue=new UserExample();
        ue.createCriteria().andUsernameEqualTo(userVO.getUsername())
                .andUpasswordEqualTo(userVO.getPassword());
        List<User> users=userMapper.selectByExample(ue);
        int res=-1;
        if(users.size()>0) {
            res=users.get(0).getUid();
        }
        return res;
    }

    private int checkAdminAccount(UserVO userVO){
        AdminExample ue=new AdminExample();
        ue.createCriteria().andAnameEqualTo(userVO.getUsername())
                .andApasswordEqualTo(userVO.getPassword());
        List<Admin> users=adminMapper.selectByExample(ue);
        int res=-1;
        if(users.size()>0) {
            res=users.get(0).getAid();
        }
        return res;
    }

    public boolean checkRepeat(String username){
        UserExample ue = new UserExample();
        ue.createCriteria().andUsernameEqualTo(username);
        int row = userMapper.selectByExample(ue).size();
        return row==0;
    }

    public int register(User user){
        userMapper.insertSelective(user);
        UserExample ue=new UserExample();
        ue.createCriteria().andUsernameEqualTo(user.getUsername());
        return userMapper.selectByExample(ue).get(0).getUid();
    }

    public User getInfo(int uid){
        return userMapper.selectByPrimaryKey(uid);
    }

    public void modify(User user){
        UserExample ue=new UserExample();
        ue.createCriteria().andUidEqualTo(user.getUid());
        userMapper.updateByExampleSelective(user,ue);
    }
}
