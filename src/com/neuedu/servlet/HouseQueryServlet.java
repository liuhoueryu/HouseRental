package com.neuedu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neuedu.entity.House;
import com.neuedu.service.HouseService;
import com.neuedu.service.impl.HouseServiceImpl;
import com.neuedu.vo.HousePage;

public class HouseQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String charSet = this.getServletContext().getInitParameter("charSet");
		request.setCharacterEncoding(charSet);

		// 转码
		// request.setCharacterEncoding("utf-8");
		// 接收数据
		String province = request.getParameter("province");
		String city = request.getParameter("city");
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

		if (city == null)
			city = "";
		if (province == null)
			province = "";

		HouseService houseService = new HouseServiceImpl();

		List<House> list = houseService.getHouseList(province, city,a.getCurrentPage());
		request.setAttribute("list", list);
		request.setAttribute("province", province);
		request.setAttribute("city", city);
		request.getRequestDispatcher("house_query.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
