package com.neuedu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.entity.Room;
import com.neuedu.service.RoomService;
import com.neuedu.service.impl.RoomServiceImpl;


public class UserInformation extends HttpServlet {
private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");	

		//获取out输出对象
		int userid = Integer.parseInt(request.getParameter("userid"));
		RoomService roomService = new RoomServiceImpl();
		List<Room> list =roomService.getUserInformation(userid);
		request.setAttribute("list", list);
		request.getRequestDispatcher("user_information.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

