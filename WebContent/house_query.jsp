<%@page import="com.neuedu.entity.User"%>
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
<title>房间查询</title>

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
	style="height: 60px; background: #393D49; color: white;">
	<div id="user">
		<ul class="layui-nav">
			<li class="layui-nav-item"><a href="">未读消息<span
					class="layui-badge">9</span></a></li>
			<li class="layui-nav-item"><a href="">个人中心<span
					class="layui-badge-dot"></span></a></li>
			<li class="layui-nav-item" lay-unselect=""><a
				href="javascript:;"><img src="image/photo/<%=user.getPhoto()%>"
					class="layui-nav-img">我</a>
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
			<li class="layui-nav-item"><a href="">最新活动</a></li>
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
			<li class="layui-nav-item"><a href="">大数据</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="">全国价格分析</a>
					</dd>
					<dd>
						<a href="">可视化</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
				<dl class="layui-nav-child" >
					<dd>
						<a style="z-index: 999;" href="">移动模块</a>
					</dd>
					<dd>
						<a style="z-index: 999;" href="">后台模版</a>
					</dd>
					<dd class="layui-this">
						<a href="">选中项</a>
					</dd>
					<dd>
						<a href="">电商平台</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item"><a href="">社区</a></li>
		</ul>
		</span>
		<span><input id="bts" type="button" value="House" onclick="window.location.href='index.jsp'"/></span>
	</div>
</header>
</div>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	height: 100%;
}


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
		<div style="margin-top: 100px;" class="wall" align="center">
			
			<form action="HouseQueryServlet" method="post">
				<input type="text" id="tet" name="province" value="<%=province%>" /> 
				<input type="text" id="tet" name="city" value="<%=city%>" /> 
				&nbsp;
				<input type="submit" id="btv" value="查询" /><br /> <br> <br>
				<table border="1" style="width:50%;text-align: center;font-size: large;">
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
				<button id="btv" name="prepage">上一页</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btv" name="index">首 页</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="btv" name="nextpage">下一页</button>

			</form>

		</div>
		<div id="midground" class="wall"></div>
		<div id="foreground" class="wall"></div>
		<div id="top" class="wall"></div>

</body>
</html>