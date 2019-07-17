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
            if(goods.getGcount()>=cart.getCcount()) {
                cartVO.setGcount(cart.getCcount());
            }else if(goods.getGcount()>0&&goods.getGcount()<cart.getCcount()){
                //如果购物车超库存了，并且库存还有，就改数量为库存
                cartVO.setGcount(goods.getGcount());
                Cart cart1=new Cart();
                cart1.setCid(cart.getCid());
                cart1.setCcount(goods.getGcount());
                cartMapper.updateByPrimaryKeySelective(cart1);
            }else{
                //当前vo不要加入购物车中
                cartMapper.deleteByPrimaryKey(cart.getCid());
                continue;
            }
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
        int count=cart.getCcount();
        if(count>0){
            count--;
        }
        cart.setCcount(count);
        cartMapper.updateByPrimaryKey(cart);
    }
    public void plusCart(int cid){
        Cart cart=cartMapper.selectByPrimaryKey(cid);
        int count=cart.getCcount();
        Goods goods=goodsMapper.selectByPrimaryKey(cart.getGid());
        //如果库存大于购物车数量
        if(goods.getGcount()>count){
            count++;
        }
        cart.setCcount(count);
        cartMapper.updateByPrimaryKey(cart);
    }

    public void payThings(List<Integer> list,int uid){
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
