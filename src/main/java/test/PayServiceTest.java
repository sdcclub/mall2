package test;

import com.etc.model.entity.User;
import com.etc.model.service.PayService;
import com.etc.model.vo.OrderVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:test/Configuration.xml","classpath*:test/springmvc-servlet.xml"})
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
        //System.out.println("asdfasdfsdf");
        List<OrderVO> goodsList=payService.getPayList(user.getUid());
        for(OrderVO goods:goodsList){
            System.out.println(goods);
        }
    }

    @Test
    public void getOrderByOid() {
        System.out.println(payService.getOrderByOid(1));
    }
}