package com.neuedu.service;

import java.util.Date;
import java.util.List;

import com.neuedu.entity.User;

public interface UserService {

	User login(String username, String password, int score);
	User retrieveUserPassword(String username,String password);
	boolean retrievePassword(String username,String phonenumber);
	
	User register(User user);
	
	List<User> getUserList(String username, String gender, String job, String begin, String end);
	
	boolean checkUsername(String username);
	
	boolean deleteUser(int userid);
	
	boolean deleteUser(String[] userids);
	
	boolean addRoom(int roomid,int userid,Date orderTime);
	
	boolean delRoom(int roomid,int userid);
	
}
