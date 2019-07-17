package com.etc.model.service;

import com.etc.model.dao.CartMapper;
import com.etc.model.dao.GoodsMapper;
import com.etc.model.dao.OrderMapper;
import com.etc.model.entity.Cart;
import com.etc.model.entity.CartExample;
import com.etc.model.entity.Goods;
import com.etc.model.entity.Order;
import com.etc.model.vo.CartVO;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private OrderMapper orderMapper;
    public List<CartVO> getCart(int uid){
        final CartExample cartExample=new CartExample();
        System.out.println(cartExample);
        cartExample.createCriteria().andUidEqualTo(uid);
        //System.out.println(cartExample);
        List<Cart> cartList=cartMapper.selectByExample(cartExample);
       //System.out.println(cartList.size());
        List<CartVO> cartVOList=new ArrayList<>();
        for(Cart cart:cartList){
            CartVO cartVO=new CartVO();
            Goods goods=goodsMapper.selectByPrimaryKey(cart.getGid());
            cartVO.setCid(cart.getCid());
            cartVO.setGid(goods.getGid());
            cartVO.setGname(goods.getGname());
            cartVO.setGcount(cart.getCcount());
            cartVO.setGpicture(goods.getGpicture());
            cartVO.setGprice(goods.getGprice());
            cartVOList.add(cartVO);
        }
        //System.out.println(cartVOList.size());
        return cartVOList;
    }
    public void removeCart(int cid){
        cartMapper.deleteByPrimaryKey(cid);
    }

    public void minusCart(int cid){
        Cart cart=cartMapper.selectByPrimaryKey(cid);
        int count=cart.getCcount()-1;
        cart.setCcount(count);
        cartMapper.updateByPrimaryKey(cart);
    }
    public void plusCart(int cid){
        Cart cart=cartMapper.selectByPrimaryKey(cid);
        int count=cart.getCcount()+1;
        cart.setCcount(count);
        cartMapper.updateByPrimaryKey(cart);
    }

    public void payThings(List<Integer> list){
        Random random=new Random();
        Order order=new Order();
        int n= random.nextInt(9999999)%+100000;
        //System.out.println(n);
        order.setOnumber(n);

        for(int cid:list){
            Cart cart=cartMapper.selectByPrimaryKey(cid);
            Goods goods=goodsMapper.selectByPrimaryKey(cart.getGid());
            goods.setGcount(goods.getGcount()-cart.getCcount());
            order.setGid(cart.getGid());
            order.setCcount(cart.getCcount());
            order.setOprice(cart.getCcount()*goods.getGprice());
            order.setUid(uid);
            order.setOrderdate(new Timestamp(System.currentTimeMillis()));
            order.setOpaydate(null);
            order.setOstatus("未支付");
            orderMapper.insert(order);
            cartMapper.deleteByPrimaryKey(cid);
            //减少库存
            goodsMapper.updateByPrimaryKey(goods);
        }
    }
}
