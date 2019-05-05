<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>开始使用layer</title>
</head>
<body>

  
  
 <script src="js/jquery.min.js"></script> <!-- 你必须先引入jQuery1.8或以上版本 -->
 <script src="layout/layui.js" charset="utf-8"></script>
 <script>
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
  function close(){
	  layui.use('layer',function(){
		  var layer = layui.layer;
		  layer.closeAll();
		  var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		  parent.layer.close(index);
	  
  });
  }
</script>
<script type="text/javascript">

  close();
</script>
</body>
</html>