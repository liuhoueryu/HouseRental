<%@page import="com.neuedu.entity.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.neuedu.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="images/favicon.ico"/>
<link rel="stylesheet" href="exjs/layui.css" media="all">
<link rel="stylesheet" href="layout/css/layui.css"  media="all">
<link rel="stylesheet" href="css/index.css" />
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
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



	
<header
	style="height: 60px; background: #393D49; color: white">
	<div id="user">
		<ul class="layui-nav">
			<li class="layui-nav-item"><a href="">未读消息<span
					class="layui-badge">9</span></a></li>
			<li class="layui-nav-item"><a href="">个人中心<span
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
						<a href="">全国价格分析</a>
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
			<li class="layui-nav-item"><a href="">社区</a></li>
		</ul>
		</span>
		<span><input id="bts" type="button" value="House" onclick="window.location.href='index.jsp'"/></span>
	</div>
</header>
<body>
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
	<%
		if (request.getAttribute("list") == null) {
			response.sendRedirect("UserInformation?userid="+user.getUserid());
			return;
		}
	%>
	
	<%
		List<Room> list = (List<Room>) request.getAttribute("list");

	%>
	
	<div style="margin-top: 100px;" >

			<center><font style="font-size: xx-large;">您的消息</font></center>
			<div style="margin: 50px 300px;">
				<ul class="layui-timeline">
					
					<%
						for (Room room : list) {
					%>
  					<li class="layui-timeline-item">
    					<i class="layui-icon layui-timeline-axis"></i>
    						<div class="layui-timeline-content layui-text">
      						<div class="layui-timeline-title"><font size="4px;">您于<%=room.getOrderTime()%>时间，预定了房间</font></div>
    					</div>
  					</li>
					<%
						}
					%>


				</ul>
			</div>    

		</div>
		<script src="layout/layui.all.js" charset="utf-8"></script>
</body>
</html>