package test;

import com.etc.model.entity.Cart;
import com.etc.model.service.CartService;
import com.etc.model.vo.CartVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:test/Configuration.xml","classpath*:test/springmvc-servlet.xml"})
public class CartServiceTest {
    @Autowired
    CartService cartService;
    @Test
    public void getCart() {
        System.out.println("我get了");
        List<CartVO> list=cartService.getCart(1);
        for(CartVO cartVO:list)
            System.out.println(cartVO);
    }

    @Test
    public void removeCart() {
        System.out.println("我remove了");
        cartService.removeCart(2);
    }

    @Test
    public void minusCart() {
        System.out.println("minus");
        cartService.minusCart(2);
    }

    @Test
    public void plusCart() {
        System.out.println("plus");
        cartService.plusCart(1);
    }

    @Test
    public void payThings() {
        List<Integer> list=new ArrayList<>();
        list.add(2);
        list.add(3);
        cartService.payThings(list,1);
    }
}