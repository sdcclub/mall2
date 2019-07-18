package test.com.etc.model.service; 

import com.etc.model.dao.AdminMapper;
import com.etc.model.entity.User;
import com.etc.model.service.LoginService;
import com.etc.model.vo.UserVO;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;
import org.springframework.beans.factory.annotation.Autowired;

/** 
* LoginService Tester. 
* 
* @author <Authors name> 
* @since <pre>七月 17, 2019</pre>
* @version 1.0 
*/ 
public class LoginServiceTest extends BaseJunit4Test{

    private LoginService loginService;

    public LoginService getLoginService() {
        return loginService;
    }

    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    @Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
}

/** 
* 
* Method: checkAccount(UserVO userVO, boolean identification) 
* 
*/ 
@Test
public void testCheckAccount() throws Exception {
    UserVO userVO = new UserVO();
    userVO.setUsername("yunyun");
    userVO.setPassword("123456");
    //true for user
    assert loginService.checkAccount(userVO,false)!=-1;
    userVO.setUsername("linda");
    userVO.setPassword("123456");
    assert loginService.checkAccount(userVO,true)!=-1;
} 

/**
*
* Method: checkRepeat(String username)
*
*/
@Test
public void testCheckRepeat() throws Exception {
    assert !(loginService.checkRepeat("linda",-1));
}

/**
*
* Method: register(User user)
*
*/
@Test
public void testRegister() throws Exception {
    User user=new User();
    user.setUsername("123");
    user.setUpassword("123456");
    loginService.register(user);
}

/**
*
* Method: getInfo(int uid)
*
*/
@Test
public void testGetInfo() throws Exception {
    User user = loginService.getInfo(1);
    System.out.println(user.getUsername());
}

/**
*
* Method: modify(User user)
*
*/
@Test
public void testModify() throws Exception {
    User user=new User();
    user.setUid(18);
    user.setUsername("hhh");
    loginService.modify(user);
}


/** 
* 
* Method: checkUserAccount(UserVO userVO) 
* 
*/ 
@Test
public void testCheckUserAccount() throws Exception { 
//TODO: Test goes here... 
/* 
try { 
   Method method = LoginService.getClass().getMethod("checkUserAccount", UserVO.class); 
   method.setAccessible(true); 
   method.invoke(<Object>, <Parameters>); 
} catch(NoSuchMethodException e) { 
} catch(IllegalAccessException e) { 
} catch(InvocationTargetException e) { 
} 
*/ 
} 

/** 
* 
* Method: checkAdminAccount(UserVO userVO) 
* 
*/


    @Test
public void testCheckAdminAccount() throws Exception {

        //System.out.println(adminMapper.selectByPrimaryKey(1).toString());
/* 
try { 
   Method method = LoginService.getClass().getMethod("checkAdminAccount", UserVO.class); 
   method.setAccessible(true); 
   method.invoke(<Object>, <Parameters>); 
} catch(NoSuchMethodException e) { 
} catch(IllegalAccessException e) { 
} catch(InvocationTargetException e) { 
} 
*/ 
} 

} 
