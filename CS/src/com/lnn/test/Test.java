package com.lnn.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lnn.entity.User;
import com.lnn.service.UserServiceImpl;

public class Test {

	public static void main(String[] args) throws ParseException {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContent.xml");
		UserServiceImpl bean = context.getBean(UserServiceImpl.class);
		/*
		 * List<User> selectUser = bean.selectUser(); 
		 * System.out.println(selectUser);
		 */
		/*
		 * User user=new User(); 
		 * user.setUname("张三");
		 *  user.setUpass("123456");
		 * user.setAge(20); 
		 * SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 * Date parse = sdf.parse("2001-09-08");
		 *  user.setBirthday(parse); 
		 *  int i =bean.insertUser(user);
		 *  System.out.println(i);
		 */
		User user=new User();
		int i = bean.deleteUser(1);
		System.out.println(i);
	}

}
