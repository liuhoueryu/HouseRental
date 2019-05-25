<%@page import="com.neuedu.entity.User"%>
<%@page import="com.neuedu.util.StringUtil"%>
<%@page import="com.neuedu.entity.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>住房查询</title>

<link rel="stylesheet" href="css/starlight.css">
<link rel="stylesheet" href="css/table.css">
<link rel="stylesheet" href="layout/css/layui.css"  media="all">
  <link rel="stylesheet" href="css/index.css" />
  <link rel="icon" href="images/favicon.ico"/>
</head>
<%
	//登录检查
	if(session.getAttribute("user")==null){   //未登录
%>
		
		<script>
			alert("对不起，您尚未登录，请先登录");
			location = "user_login.jsp";
		</script>	
	 
<%		
		return;
	}
%>

<%
	//从session属性范围中取出用户名，积分,头像
	/* String username = ( String)session.getAttribute("username");
	int score = (Integer)session.getAttribute("score");
	String photo = (String)session.getAttribute("photo"); */
	
	//从session属性范围中取出user对象
	User user = (User)session.getAttribute("user");
	
	//从application属性范围中取出在线人数
%>



<div id="daohang" class="wall" align="center">	
<header
	style="height: 60px; background: #393D49; color: white">
	<div id="user">
		<ul class="layui-nav">
			<li class="layui-nav-item"><a href="user_information.jsp">通知消息<span
					class="layui-badge">9</span></a></li>
			<li class="layui-nav-item"><a href="user_zoon.jsp">个人中心<span
					class="layui-badge-dot"></span></a></li>
			<li class="layui-nav-item" lay-unselect=""><a
				href="javascript:;"><img src="image/photo/<%=user.getPhoto()%>"
					class="layui-nav-img"><%=user.getUsername() %></a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:location='user_register.jsp';">新用户注册</a>
					</dd>
					<dd>
						<a href="javascript:location='user_login.jsp';">切换账号</a>
					</dd>
					<dd>
						<a href="javascript:location='user_logout.jsp';">安全退出</a>
					</dd>
				</dl></li>
		</ul>
	</div>
	<div id="index">
		
		<span>
		<ul class="layui-nav">
			<li class="layui-nav-item"><a href="HotSellers.jsp">最新活动</a></li>
			<li class="layui-nav-item"><a href="javascript:;">相关下载</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="download/2.docx">隐私条约</a>
					</dd>
					<dd>
						<a href="">免责说明</a>
					</dd>
					<dd>
						<a href="download/1.docx">用户入住协议</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="">产品使用</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="house_query.jsp">全国价格分析</a>
					</dd>
					<dd>
						<a href="data.jsp">可视化</a>
					</dd>
					<dd>
						<a href="room_query.jsp">住房查询</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="javascript:;">待开发功能</a>
				<dl class="layui-nav-child">
					<dd class="layui-this">
						<a href="">正在开发</a>
					</dd>
					<dd class="layui-this">
						<a href="">敬请期待</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="user_query.jsp">高级</a></li>
		</ul>
		</span>
		<span><input id="bts" type="button" value="House" onclick="window.location.href='index.jsp'"/></span>
	</div>
</header>
</div>
<br>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	height: 100%;
}

</style>
<body
	style="background-image: url('img/bg_house.jpg'); background-repeat: no-repeat; background-position: center;">
	<script src="exjs/layui.all.js" charset="utf-8"></script>
	<script src="exjs/element.js" charset="utf-8"></script>

	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
	<%
		if (request.getAttribute("list") == null) {
			response.sendRedirect("RoomQueryServlet");
			return;
		}
	%>
	<%
		List<Room> list = (List<Room>) request.getAttribute("list");
		String type = (String) request.getAttribute("type");
		String minPrice = (String) request.getAttribute("minPrice");
		String maxPrice = (String) request.getAttribute("maxPrice");
		String minDistance = (String) request.getAttribute("minDistance");
		String maxDistance = (String) request.getAttribute("maxDistance");
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
		<div style="margin-top: 100px;" class="wall" align="center">
			<form action="RoomQueryServlet" method="post">
				<select id="text" name="type">
					<option value="标间">标间</option>
					<option value="三人间">三人间</option>
					<option value="套房">套房</option>
					<option value="钟点房">钟点房</option>
				</select>
				<input id="teo" type="text" readonly="readonly" value="价格范围">
				<select id="text" name="minPrice">
					<option value="200">200元</option>
					<option value="250">250元</option>
					<option value="300">300元</option>
					<option value="350">350元</option>
				</select>
				<select id="text" name="maxPrice">
					<option value="1000">1000元</option>
					<option value="600">600元</option>
					<option value="500">500元</option>
					<option value="400">400元</option>
				</select>
				<input id="teo" type="text" readonly="readonly" value="距离范围">
				<select id="text" name="minDistance">
					<option value="200">200米</option>
					<option value="1000">1公里</option>
					<option value="1500">1.5公里</option>
					<option value="2000">2公里</option>
				</select>
				<select id="text" name="maxDistance">
					<option value="3000">3公里</option>
					<option value="4000">4公里</option>
					<option value="5000">5公里</option>
				</select>
				&nbsp;
				<input id="btv" type="submit">
				<br>
				<br>
				<table border="1" style="width:50%;text-align: center;font-size: large;">
					<tr>
						<td>房号</td>
						<td>类型</td>
						<td>价格（元）</td>
						<td>距离（米）</td>
						<td>操作</td>
					</tr>
					<%
						for (Room room : list) {
					%>
					<tr>
						<td><%=room.getRoomid()%></td>
						<td><%=room.getType()%></td>
						<td><%=room.getPrice()%></td>
						<td><%=room.getDistance()%></td>
						<td><a href="OrderRoom?userid=<%=user.getUserid()%>&roomid=<%=room.getRoomid()  %>" 
							onclick="return confirm('是否预订房间号为【<%=room.getRoomid()%>】,类型为【<%=room.getType() %>】，价位【<%=room.getPrice() %>元】的房间')">预订</a></td>
					</tr>
					<%
						}
					%>


				</table>
				
			</form>

		</div>
		<div id="midground" class="wall"></div>
		<div id="foreground" class="wall"></div>
		<div id="top" class="wall"></div>

</body>
</html>