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
import com.neuedu.vo.HousePage;

/**
 * Servlet implementation class RoomQueryServlet
 */
public class RoomQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String charSet = this.getServletContext().getInitParameter("charSet");
		request.setCharacterEncoding(charSet);

		// 转码
		// request.setCharacterEncoding("utf-8");
		// 接收数据
		String type = request.getParameter("type");
		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");
		String minDistance = request.getParameter("minPrice");
		String maxDistance = request.getParameter("maxDistance");
		String index=request.getParameter("index");
		String prepage=request.getParameter("prepage");
		String nextpage=request.getParameter("nextpage");
		HousePage a=HousePage.getInstance();
		if(index!=null) {
			a.setCurrentPage(0);
		}
		if(prepage!=null) {
			System.out.println("上一页");
			if(a.getCurrentPage()>=20)
				a.addPage(-20);
			System.out.println(a.getCurrentPage());
			System.out.println(a);
		}
		if(nextpage!=null) {
			System.out.println("下一页");
			a.addPage(20);
			System.out.println(a.getCurrentPage());
			System.out.println(a);
		}
		System.out.println("type:"+type);
		System.out.println("minPrice:"+minPrice);
		System.out.println("maxPrice:"+maxPrice);
		System.out.println("minDistance:"+minDistance);
		System.out.println("maxDistance:"+maxDistance);
		if (type == null)
			type = "";
		if (minPrice == null||minPrice == "")
			minPrice = "0";
		if (maxPrice == null||maxPrice == "")
			maxPrice = "1000";
		if (minDistance == null||minDistance =="")
			minDistance = "200";
		if (maxDistance == null||maxDistance =="")
			maxDistance = "5000";
		System.out.println("type:"+type);
		System.out.println("minPrice:"+minPrice);
		System.out.println("maxPrice:"+maxPrice);
		System.out.println("minDistance:"+minDistance);
		System.out.println("maxDistance:"+maxDistance);

		RoomService roomService = new RoomServiceImpl();

		List<Room> list = roomService.getRoomList(type, minPrice, maxPrice, minDistance, maxDistance,a.getCurrentPage());
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("maxPrice", maxPrice);
		request.setAttribute("minDistance", minDistance);
		request.setAttribute("maxDistance", maxDistance);
		request.getRequestDispatcher("room_query.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
