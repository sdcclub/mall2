package test;

import com.etc.model.entity.Cart;
import com.etc.model.entity.Goods;
import com.etc.model.service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;

/**
 * @Author: Carrie Xie
 * @Date: 2019/7/12 19:33
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:test/Configuration.xml","classpath*:test/springmvc-servlet.xml"})
public class GoodsServiceTest {
    GoodsService goodsService;

    public GoodsService getGoodsService() {
        return goodsService;
    }

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @Test
    public void selectCartByUidAndGid() {
        System.out.println("hhhh");
        List<Cart> list = goodsService.selectCartByUidAndGid(1,1);
        for (Cart cart:list) {
            System.out.println(cart);
        }
    }

    @Test
    public void updateCcountByUidAndGid() {
        System.out.println("hhhh");
        goodsService.updateCcountByUidAndGid(1,1,4);
    }

    @Test
    public void findByLike(){
        String string = "子";
        List<Goods> list = goodsService.findByLike(string);
        for(Goods goods:list){
            System.out.println(goods.getGname()+" ");
        }
    }

    @Test
    public void groupByType(){
        System.out.println("hhh");
        List<Map<String,Object>> maps = goodsService.groupByType();
        for(int i=0;i<maps.size();i++){
            System.out.println(maps.get(i).toString());
        }
    }
}