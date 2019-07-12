package com.etc.model.service;

import com.etc.model.dao.CartMapper;
import com.etc.model.dao.GoodsMapper;
import com.etc.model.entity.Cart;
import com.etc.model.entity.CartExample;
import com.etc.model.entity.Goods;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsService {
    private SqlSession session;

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

    public int selectCartByUidAndGid(int uid,int gid){
        CartExample ce = new CartExample();
        ce.createCriteria().andUidEqualTo(uid).andGidEqualTo(gid);
        List<Cart> list = session.getMapper(CartMapper.class).selectByExample(ce);
        if(list.isEmpty()){
            return 0;
        }else{
            return 1;
        }
    }

    public int updateCcountByUidAndGid(int uid,int gid,int ccount){
        CartExample ce = new CartExample();
        ce.createCriteria().andUidEqualTo(uid).andGidEqualTo(gid);
        Cart cart=new Cart();
        cart.setCcount(ccount);
        return cartMapper.updateByExampleSelective(cart,ce);
    }
}
