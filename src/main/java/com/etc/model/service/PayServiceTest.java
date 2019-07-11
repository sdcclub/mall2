package com.etc.model.service;

import com.etc.model.entity.Goods;
import com.etc.model.entity.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class PayServiceTest {

    @Autowired
    PayService payService;

    @Test
    public void getPayList() {
        User user=new User();
        user.setUid(1);
        List<Goods> goodsList=payService.getPayList(user);
        for(Goods goods:goodsList){
            System.out.println(goods);
        }
    }
}
