<%@page import="com.neuedu.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>最新活动</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
<body style="height: 100%;">
<div id="container" style="height: 500px;width:500px;top: 70px;float: right;"></div>
<script>
		layui.use('element', function() {
			var element = layui.element; 

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
</script>
<div style="margin: 50px 300px;">
<ul class="layui-timeline">
  <li class="layui-timeline-item">
    <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">更新中，更多活动请持续关注！</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">3月8日，扮靓女人天，购物添光彩</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">3月6日，惊蛰，折扣复苏</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">2月19日，元宵佳节，团圆有家</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">2月14日，浪漫情人节，第二间半价</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">2月4日至5日，又是一年春来到，喜迎新春</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">1月13日，腊八节温馨陪伴，售价8.5折</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">1月5日，小寒不寒，热卖中。。。</font></div>
    </div>
  </li>
  <li class="layui-timeline-item">
    <i class="layui-icon layui-timeline-axis"></i>
    <div class="layui-timeline-content layui-text">
      <div class="layui-timeline-title"><font size="4px;">1月1日，元旦促销，全场房间白菜价</font></div>
    </div>
  </li>
</ul>
</div>            
          
<script src="layout/layui.all.js" charset="utf-8"></script>


<script type="text/javascript" src="echarts/echarts.min.js"></script>
<script type="text/javascript" src="echarts/jquery.min.js"></script>
<script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
    tooltip : {
        formatter: "{a} <br/>{b} : {c}%"
    },
    toolbox: {
        feature: {
            restore: {},
            saveAsImage: {}
        }
    },
    series: [
        {
            name: '业务指标',
            type: 'gauge',
            detail: {formatter:'{value}K'},
            data: [{value: 50, name: '实时交易量'}]
        }
    ]
};

setInterval(function () {
    option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
    myChart.setOption(option, true);
},2000);
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
</script>
</body>
</html>