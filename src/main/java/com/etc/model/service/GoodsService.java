package com.etc.model.service;

import com.etc.model.dao.CartMapper;
import com.etc.model.dao.GoodsMapper;
import com.etc.model.dao.StatisticalMapper;
import com.etc.model.entity.Cart;
import com.etc.model.entity.CartExample;
import com.etc.model.entity.Goods;
import com.etc.model.entity.GoodsExample;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class GoodsService {
    private GoodsMapper goodsMapper;
    private CartMapper cartMapper;

    int usedCount;

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

    public List<Cart> selectCartByUidAndGid(int uid,int gid){
        CartExample ce = new CartExample();
        ce.createCriteria().andUidEqualTo(uid).andGidEqualTo(gid);
        List<Cart> list = cartMapper.selectByExample(ce);
        for(Cart cart:list){
            usedCount+=cart.getCcount();
        }
        return list;
    }

    public int updateCcountByUidAndGid(int uid,int gid,int ccount){
        CartExample ce = new CartExample();
        ce.createCriteria().andUidEqualTo(uid).andGidEqualTo(gid);
        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        Cart cart=new Cart();
        cart.setCcount(ccount+usedCount);
        cart.setCadddate(time);
        return cartMapper.updateByExampleSelective(cart,ce);
    }

    public List<Goods> findByLike(String string){
        GoodsExample ge = new GoodsExample();
        ge.createCriteria().andGnameLike("%"+string+"%");
        return goodsMapper.selectByExample(ge);
    }

    public boolean checkGcount(int num, int gid) {
        Goods goods=goodsMapper.selectByPrimaryKey(gid);
        if(goods.getGcount()>num){
            return true;
        }else{
            return false;
        }

    }
}
