package dogo.test;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dogo.service.FunctionServiceI;
import dogo.service.UserServiceI;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-mybatis.xml" })
public class TestMybatis {

	private static final Logger logger = Logger.getLogger(TestMybatis.class);

	
	private UserServiceI userServiceI;
	
	private FunctionServiceI functionServiceI;
	
	
	public UserServiceI getUserServiceI() {
		return userServiceI;
	}
    @Autowired
	public void setUserServiceI(UserServiceI userServiceI) {
		this.userServiceI = userServiceI;
	}

	
	
	
	public FunctionServiceI getFunctionServiceI() {
		return functionServiceI;
	}
	@Autowired
	public void setFunctionServiceI(FunctionServiceI functionServiceI) {
		this.functionServiceI = functionServiceI;
	}
	@Test
	public void test1() {
		
	}

	
}
