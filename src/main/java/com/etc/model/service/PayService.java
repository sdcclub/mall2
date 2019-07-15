package com.etc.model.service;

import com.etc.model.dao.GoodsMapper;
import com.etc.model.dao.OrderMapper;
import com.etc.model.entity.*;
import com.etc.model.vo.OrderVO;
import com.etc.util.MyComparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

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

    //因为我在支付的时候用的也是这个函数，当前还没有支付时间，所以就在历史订单里另外加
    private OrderVO setOrderVO(Order order){
    //每个订单都会有gid属性，查找对应商品
        Goods goods=goodsMapper.selectByPrimaryKey(order.getGid());

        OrderVO orderVO=new OrderVO();
        orderVO.setCcount(order.getCcount());
        orderVO.setGoods(goods);
        orderVO.setOid(order.getOid());
        orderVO.setOnumber(order.getOnumber());
        orderVO.setOprice(order.getOprice());

        //日期格式化传过去
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        orderVO.setOrderdate(dateFormat.format(order.getOrderdate()));
        return orderVO;
    }

    public List<OrderVO> getPayList(User user) {
        OrderExample orderExample=new OrderExample();
        //获取当前用户待支付的所有订单
        orderExample.createCriteria().andUidEqualTo(user.getUid())
                .andOstatusEqualTo("未支付");
        if(orderMapper.selectByExample(orderExample)==null){
            System.out.println("什么也没查到");
            return null;
        }

        List<Order> orderList=orderMapper.selectByExample(orderExample);

        //按照oid降序排序
        Collections.sort(orderList,new MyComparator());
        //获取当前最新生成的onumber
        int onumber=orderList.get(0).getOnumber();

        //用一个循环找到当前所有待支付的gid,再查数据库把它放到商品list中
        List<OrderVO> orderVOList=new ArrayList<>();
        for(Order order:orderList){
            if(order.getOnumber()==onumber) {
                OrderVO orderVO = setOrderVO(order);
                orderVOList.add(orderVO);
            }else{
                break;
            }
        }
        return orderVOList;
    }

    public Order getOrderByOid(int oid){
        Order order=orderMapper.selectByPrimaryKey(oid);
        return order;
    }

    public List<List<OrderVO>> getHistoryOrdersByUid(Integer uid) {
        OrderExample orderExample=new OrderExample();
        //获取当前用户的所有订单
        orderExample.createCriteria().andUidEqualTo(uid);
        List<Order> orderList=orderMapper.selectByExample(orderExample);

        //先获取第一个订单的订单号，按照订单号给订单分类
        int onumber=orderList.get(0).getOnumber();

        List<List<OrderVO>> ordersByTime=new ArrayList();
        List<OrderVO> orderVOList=new ArrayList<>();
        //支付日期格式化传过去
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        for(int i=0;i<orderList.size();i++) {
            //涉及到一些操作，只能这么取order了
            Order order=orderList.get(i);
            //System.out.println(order);
            OrderVO orderVO = setOrderVO(order);

            //如果是已支付的订单
            if(order.getOpaydate()!=null) {
                orderVO.setOpaydate(dateFormat.format(order.getOpaydate()));
            }

            //如果是同一批订单
            if(onumber!=order.getOnumber()) {
                //如果是新的一批订单了，先把上一批加入list
                ordersByTime.add(orderVOList);
                //修改onumber
                onumber=order.getOnumber();

                //新整一个list存下一批
                orderVOList=new ArrayList<>();
            }
            orderVOList.add(orderVO);
        }
        //外围也要做加入list操作，因为不会遇见下一个不一致的onumber
        ordersByTime.add(orderVOList);

        return ordersByTime;
    }

    public void updateOrdersPaydate(Integer onumber) {
        OrderExample orderExample=new OrderExample();

        //找到所有的onumber的order
        orderExample.createCriteria().andOnumberEqualTo(onumber);
        List<Order> orderList=orderMapper.selectByExample(orderExample);
        Date date=new Date();

        //只能一个一个的改，因为timestamp本身带有特殊性，如果update的时候为空会自动补全最新时间
        for(Order order:orderList) {
            order.setOpaydate(date);
            order.setOstatus("已支付");
            System.out.println(order);
            orderMapper.updateByPrimaryKeySelective(order);
        }
    }

}
