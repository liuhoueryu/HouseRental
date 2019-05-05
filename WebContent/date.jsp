<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="laydate/laydate.js"></script>
<script>
laydate.render({
  	elem: '#tes' //指定元素
});
laydate.render({
  	elem: '#teb' //指定元素
});
</script>
<body>
从<input type="text" name="begin" id="teb" readonly="readonly"/>
到<input type="text" name="end" id="tes" readonly="readonly"/>
</body>
</html>