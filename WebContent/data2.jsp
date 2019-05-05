<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layout/css/layui.css" media="all">
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<input type="button" value="测试" onclick="javascript:button_onclick();" />
<script src="layout/layui.js" charset="utf-8"></script>
<script type="text/javascript">
function login(){
		layui.use('layer', function(){
  		var layer = layui.layer;
 		 layer.open({
	  		type: 2, 
	  		content: 'index.html' ,
	  		area: ['500px', '370px']
	}); 
});
}
function tell(){
	layui.use('layer', function(){
		var layer = layui.layer;
		layer.alert("对不起，您尚未登录，请先登录", {icon: 5});
});
}
</script>
<script type="text/javascript">
	tell();
</script>
</body>
</html>