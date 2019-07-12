package com.etc.model.service;

import com.etc.model.dao.CartMapper;
import com.etc.model.dao.GoodsMapper;
import com.etc.model.entity.Cart;
import com.etc.model.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsService {
    private GoodsMapper goodsMapper;

    private CartMapper cartMapper;

    public CartMapper getCartMapper() {
        return cartMapper;
    }

    @Autowired
    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    public GoodsMapper getGoodsMapper() {
        return goodsMapper;
    }

    @Autowired
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    public List<Goods> findAll(){
        return goodsMapper.selectByExample(null);
    }

    public Goods findByGid(int gid){
        return goodsMapper.selectByPrimaryKey(gid);
    }

    public void insertCart(Cart cart){
        cartMapper.insert(cart);
    }
}
