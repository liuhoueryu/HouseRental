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


public class DeleteOrderRoom extends HttpServlet {
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//设置输出内容类型  
		response.setContentType("text/html;charset=utf-8");	

		//获取out输出对象
		PrintWriter out = response.getWriter();		
		
		//接收数据
		int roomid = Integer.parseInt(request.getParameter("roomid"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		
		//调用业务方法
		UserService userService = new UserServiceImpl();
		
		if(userService.delRoom(roomid,userid)){
			out.println("<script>alert('取消成功');location='user_zoon.jsp'</script>");
		}else{
			out.println("<script>alert('取消失败');history.back()</script>");
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}