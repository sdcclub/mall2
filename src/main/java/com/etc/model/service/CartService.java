package com.etc.model.service;

import com.etc.model.dao.CartMapper;
import com.etc.model.dao.GoodsMapper;
import com.etc.model.entity.Cart;
import com.etc.model.entity.CartExample;
import com.etc.model.entity.Goods;
import com.etc.model.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    public List<CartVO> getCart(int uid){
        System.out.println("hi");
        final CartExample cartExample=new CartExample();
        System.out.println("1");
        System.out.println(cartExample);
        cartExample.createCriteria().andUidEqualTo(uid);
        System.out.println("2");
        System.out.println(cartExample);
        List<Cart> cartList=cartMapper.selectByExample(cartExample);
        System.out.println("3");
        if(cartList!=null){
            System.out.println("不空的");
        }
        else {
            System.out.println("空的");
        }
        System.out.println(cartList.size());
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
        System.out.println(cartVOList.size());
        return cartVOList;
    }
}
