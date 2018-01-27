<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>硅谷商城</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>
	<h1>属性添加页</h1>
	<form action="save_manager_attr.do" method="post">
		<jsp:include page="manag_class_attr.jsp"></jsp:include>
		<hr>
		<table border="1">
			<tr><td>属性名：<input type="text" value="爱心" name="list_attr[0].shxm_mch" /></td><td></td><td>添加值</td></tr>
			<tr><td>属性值：<input type="text" value="没有" name="list_attr[0].list_value[0].shxzh" /></td><td>单位：<input type="text" value="mg" name="list_attr[0].list_value[0].shxzh_mch" /></td><td>删除</td></tr>
			<tr><td>属性值：<input type="text" value="很少" name="list_attr[0].list_value[1].shxzh" /></td><td>单位：<input type="text" value="mg" name="list_attr[0].list_value[1].shxzh_mch" /></td><td>删除</td></tr>
		</table>
		<br><br>
		<table border="1">
			<tr><td>属性名：<input type="text" value="想死" name="list_attr[1].shxm_mch" /></td><td></td><td>添加值</td></tr>
			<tr><td>属性值：<input type="text" value="有1" name="list_attr[1].list_value[0].shxzh" /></td><td>单位：<input type="text" value="kg" name="list_attr[1].list_value[0].shxzh_mch" /></td><td>删除</td></tr>
			<tr><td>属性值：<input type="text" value="有2" name="list_attr[1].list_value[1].shxzh" /></td><td>单位：<input type="text" value="kg" name="list_attr[1].list_value[1].shxzh_mch" /></td><td>删除</td></tr>
		</table>
		<input type="submit" value="提交"/>
	</form>
	
</body>
</html>