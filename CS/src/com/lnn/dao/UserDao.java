package com.lnn.dao;

import java.util.List;

import com.lnn.entity.User;

public interface UserDao {
	  /**
	   * 
	   * @return
	   */
      List<User> selectUser();
      /**
       * 
       * @param u
       * @return
       */
      int insertUser(User u);
      /**
       * 
       * @param uid
       * @return
       */
      int deleteUser(int uid);
      /**
       * 
       * @param uid
       * @return
       */
      User selectByIdUser(int uid);
      /**
       * 
       * @param u
       * @return
       */
      int updateUser(User u);
}
