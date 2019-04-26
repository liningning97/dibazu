package com.lnn.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.lnn.dao.UserDao;
import com.lnn.entity.User;
@Service
public class UserServiceImpl implements UserService {
	@Resource
   private UserDao userDao;
	@Override
	public List<User> selectUser() {
		// TODO Auto-generated method stub
		return userDao.selectUser();
	}

	@Override
	public int insertUser(User u) {
		// TODO Auto-generated method stub
		return userDao.insertUser(u);
	}

	@Override
	public int deleteUser(int uid) {
		// TODO Auto-generated method stub
		return userDao.deleteUser(uid);
	}

	@Override
	public User selectByIdUser(int uid) {
		// TODO Auto-generated method stub
		return userDao.selectByIdUser(uid);
	}

	@Override
	public int updateUser(User u) {
		// TODO Auto-generated method stub
		return userDao.updateUser(u);
	}

}
