package com.etc.model.service;

import com.etc.model.dao.CartMapper;
import com.etc.model.dao.GoodsMapper;
import com.etc.model.dao.StatisticalMapper;
import com.etc.model.entity.Cart;
import com.etc.model.entity.CartExample;
import com.etc.model.entity.Goods;
import com.etc.model.entity.GoodsExample;
import com.etc.model.util.RecommendSet;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class GoodsService {
    private GoodsMapper goodsMapper;
    private CartMapper cartMapper;

    int usedCount;

    private List<RecommendSet> recommend;

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
        List<Goods> list = goodsMapper.selectByExample(null);
        List<Goods> goods = new ArrayList<>();
        for (Goods good:list){
            if(good.getGcount()>0){
                goods.add(good);
            }
        }
        return goods;
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
        List<Goods> list = goodsMapper.selectByExample(ge);
        List<Goods> goods = new ArrayList<>();
        for (Goods good:list){
            if(good.getGcount()>0){
                goods.add(good);
            }
        }
        return goods;
    }


    public boolean checkGcount(int num, int gid) {
        Goods goods=goodsMapper.selectByPrimaryKey(gid);
        if(goods.getGcount()>num){
            return true;
        }else{
            return false;
        }

    }

    public List<Goods> getRecomendList(int uid){
        List<Integer> cart = cartMapper.selectGidByUid(uid);
        return cart2RecommendList(cart);
    }

    private List<Goods>cart2RecommendList(List<Integer> cart){
        List<Integer> gids = new ArrayList<>();
        if(recommend==null) {
            return null;
        }
        System.out.println(recommend);
        for (RecommendSet r:recommend){
            List<Integer> forzen = r.getForzen();
            int i=-1;
            for (i=0;i<forzen.size();i++) {
                if (!cart.contains(forzen.get(i))) {
                    break;
                }
            }
            if(i==forzen.size()) {
                gids.add(r.getRecomend());
            }
        }

        GoodsExample ge = new GoodsExample();
        ge.createCriteria().andGidIn(gids);
        return goodsMapper.selectByExample(ge);
    }

    public void readRelationFile(String filename){
            List<RecommendSet> result = new ArrayList<>();

            try(FileReader reader = new FileReader(filename);
                BufferedReader br = new BufferedReader(reader)){
                String line;
                while((line = br.readLine()) != null){
                    line = line.replaceAll("\r|\n", "");
                    String forzen = line.substring(line.indexOf("{")+1,line.indexOf("}"));
                    String[] forzens = forzen.split(",");
                    List<Integer> haveAlready=new ArrayList<>();
                    RecommendSet temp = new RecommendSet();
                    for(String a:forzens){
                        haveAlready.add(Integer.parseInt(a));
                    }
                    int recomend = Integer.parseInt(line.substring(line.indexOf("}")+1));
                    temp.setForzen(haveAlready);
                    temp.setRecommend(recomend);
                    result.add(temp);
                }
            }catch (Exception e){
            System.out.println("推荐文件读取错误！");
        }
        recommend = result;
    }

}
