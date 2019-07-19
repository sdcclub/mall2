package test;

import com.etc.model.service.LoginService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:test/Configuration.xml","classpath*:test/springmvc-servlet.xml"})
public class LoginControllerTest {

    @Autowired
    LoginService loginService;

    @Test
    public void checkRepeat() {
        System.out.println(loginService.checkRepeat("xx",-1));
    }
}