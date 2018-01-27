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
<script type="text/javascript">
	$(function(){
		
	});
	
</script>
</head>
<body>


	<c:forEach items="${list_attr_ext}" var="attr_ext" varStatus="status">
		${attr_ext.shxm_mch }:
		<div  class="${attr_ext.id }">
			<c:forEach items="${attr_ext.list_value }" var="val">
				${val.shxzh }${val.shxzh_mch } &nbsp;&nbsp;
			</c:forEach>
		</div>
	</c:forEach>

</body>
</html>