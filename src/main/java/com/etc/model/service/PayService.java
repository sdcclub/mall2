package com.etc.model.service;

import com.etc.model.dao.GoodsMapper;
import com.etc.model.dao.OrderMapper;
import com.etc.model.entity.*;
import com.etc.util.MyComparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import static java.lang.System.exit;

@Service
public class PayService {

    OrderMapper orderMapper;
    GoodsMapper goodsMapper;

    public OrderMapper getOrderMapper() {
        return orderMapper;
    }

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    public GoodsMapper getGoodsMapper() {
        return goodsMapper;
    }

    @Autowired
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    public List<Goods> getPayList(User user) {
        OrderExample orderExample=new OrderExample();
        //获取当前用户待支付的所有订单
        orderExample.createCriteria().andUidEqualTo(user.getUid())
                .andOstatusEqualTo("待支付");
        if(orderMapper.selectByExample(orderExample)==null){
            System.out.println("什么也没查到");
            exit(-1);
        }
        List<Order> orderList=orderMapper.selectByExample(orderExample);



        //把订单按照onumber进行倒序排序
        Comparator comparator=new MyComparator();
        Collections.sort(orderList, comparator);

        //取list中的第一个元素，获取最大的onumber
        int maxOnumber=orderList.get(0).getOnumber();

        //用一个循环找到当前所有符合的gid,再查数据库把它放到商品list中
        List<Goods> goodsList=new ArrayList<>();
        for(Order order:orderList){
            if(order.getOnumber()==maxOnumber){
                Goods goods=goodsMapper.selectByPrimaryKey(order.getGid());
                goodsList.add(goods);
            }
        }

        return goodsList;
    }
}
