package test;

import com.etc.model.entity.Goods;
import com.etc.model.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:test/Configuration.xml","classpath*:test/springmvc-servlet.xml"})
public class AdminServiceTest {
    @Autowired
    AdminService adminService;

    @Test
    public void getStatisticalMapper() {
    }

    @Test
    public void setStatisticalMapper() {
    }

    @Test
    public void findAll() {
        System.out.println("findAll");
        List<Goods> goodsList=adminService.findAll();
        for(Goods good:goodsList){
            System.out.println(good);
        }
    }

    @Test
    public void removeGood() {
        adminService.removeGood(26);
    }

    @Test
    public void addGood() {
        Goods good=new Goods();
        good.setGname("test");
        good.setGpicture("a");
        good.setGcount(2);
        good.setGprice(12.8);
        good.setGid(26);
        adminService.addGood(good);
    }

    @Test
    public void selectGood() {
        Goods good=adminService.selectGood(1);
        System.out.println(good.getGname());
    }

    @Test
    public void editGood() {
        Goods good=new Goods();
        good.setGname("test");
        good.setGcount(2);
        good.setGprice(12.8);
        good.setGid(33);
        adminService.editGood(good);
    }

    @Test
    public void groupByType() {
    }
}