package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.service.UserService;
import com.neuedu.service.impl.UserServiceImpl;


public class OrderRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//���������������  
		response.setContentType("text/html;charset=utf-8");	

		//��ȡout�������
		PrintWriter out = response.getWriter();		
		
		//��������
		int roomid = Integer.parseInt(request.getParameter("roomid"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		
		//����ҵ�񷽷�
		UserService userService = new UserServiceImpl();
		
		if(userService.addRoom(roomid,userid,new Date())){
			out.println("<script>alert('ԤԼ�ɹ�');location='user_zoon.jsp'</script>");
		}else{
			out.println("<script>alert('ԤԼʧ��');history.back()</script>");
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}