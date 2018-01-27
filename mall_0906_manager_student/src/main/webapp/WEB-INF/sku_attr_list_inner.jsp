<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath }/"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h2>选择平台属性列表</h2>
	<c:forEach items="${list_attr_ext}" var="attr_ext" varStatus="status">
		<input name="list_sku_av[${status.index }].shxm_id" type="checkbox" id="${attr_ext.id }" value="${attr_ext.id }" onclick="show_list_value(${attr_ext.id })"/>${attr_ext.shxm_mch }
	</c:forEach>
	<hr/>
	<c:forEach items="${list_attr_ext}" var="attr_ext" varStatus="status">
		<div  class="${attr_ext.id }" style="display:none;">
			<c:forEach items="${attr_ext.list_value }" var="val">
				<input type="radio" name="list_sku_av[${status.index }].shxzh_id" value="${val.id}"/>${val.shxzh }
			</c:forEach>
		</div>
	</c:forEach>
<script type="text/javascript">
	$(function(){
		
	});
	function show_list_value(attr_ext_id){
		var check = $('#'+attr_ext_id)[0].checked;
		if (check) {
			$('.'+attr_ext_id).show();
		} else{
			$('.'+attr_ext_id).hide();
		}
		
	}
</script>
</body>
</html>