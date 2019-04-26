package com.lnn.service;

import java.util.List;

import com.lnn.entity.User;

public interface UserService {
	/**
	   * 
	   * @return
	   */
    public List<User> selectUser();
    /**
     * 
     * @param u
     * @return
     */
    public int insertUser(User u);
    /**
     * 
     * @param uid
     * @return
     */
    public int deleteUser(int uid);
    /**
     * 
     * @param uid
     * @return
     */
    public User selectByIdUser(int uid);
    /**
     * 
     * @param u
     * @return
     */
    public int updateUser(User u);
}
