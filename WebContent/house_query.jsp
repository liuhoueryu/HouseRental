<%@page import="com.neuedu.entity.House"%>
<%@page import="java.util.List"%>
<%@page import="com.neuedu.util.StringUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.neuedu.util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>住房大全</title>
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/starlight.css">
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	height: 100%;
}

div {
	width: 100%;
	height: 100%;
}
</style>
<body
	style="background-image: url('img/bg_house.jpg'); background-repeat: no-repeat; background-position: center;">
	<%
		if (request.getAttribute("list") == null) {
			response.sendRedirect("HouseQueryServlet");
			return;
		}
	%>
	<%
		List<House> list = (List<House>) request.getAttribute("list");
		String province = (String) request.getAttribute("province");
		String city = (String) request.getAttribute("city");
	%>
	<%
		//登录检查
		if (session.getAttribute("user") == null) { //未登录
	%>

	<script>
		alert("对不起，您尚未登录，请先登录");
		location = "user_login.jsp";
	</script>

	<%
		return;
		}
	%>	
		<div id="table" class="wall" align="center">
			<a style="background: rgba(255,255,255,0.5)" href="index.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;返回主页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
			<br> <br> <br>
			<form action="HouseQueryServlet" method="post">
				<font color="red"><b>请输入省份：</b></font><input type="text"
					name="province" value="<%=province%>" /> <font color="red"><b>请输入城市：</b></font><input
					type="text" name="city" value="<%=city%>" /> <input type="submit"
					value="查询" /><br /> <br> <br>
				<table border="1" style="background-color: white">
					<tr>
						<td>省份</td>
						<td>城市</td>
						<td>价格</td>
						<td>趋势</td>
						<td>发布日期</td>
					</tr>
					<%
						for (House house : list) {
					%>
					<tr>
						<td><%=StringUtil.convertKeyword(house.getProvince(), province)%></td>
						<td><%=StringUtil.convertKeyword(house.getCity(), city)%></td>
						<td><%=house.getPrice()%></td>
						<td><%=house.getTrend()%></td>
						<td><%=house.getDate()%></td>
					</tr>
					<%
						}
					%>


				</table>
				<br> <br>
				<button name="prepage">上一页</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button name="index">首 页</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button name="nextpage">下一页</button>

			</form>

		</div>
		<div id="midground" class="wall"></div>
		<div id="foreground" class="wall"></div>
		<div id="top" class="wall"></div>

</body>
</html>