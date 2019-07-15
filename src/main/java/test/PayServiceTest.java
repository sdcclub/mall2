package test;

import com.etc.model.entity.Goods;
import com.etc.model.entity.User;
import com.etc.model.service.PayService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:test/Test.xml","classpath*:test/springmvc-servlet.xml"})
public class PayServiceTest {

    PayService payService;

    public PayService getPayService() {
        return payService;
    }

    @Autowired
    public void setPayService(PayService payService) {
        this.payService = payService;
    }

    @Test
    public void getPayList() {

        User user=new User();
        user.setUid(1);
        System.out.println("asdfasdfsdf");
        List<Goods> goodsList=payService.getPayList(user);
        for(Goods goods:goodsList){
            System.out.println(goods);
        }
    }
}