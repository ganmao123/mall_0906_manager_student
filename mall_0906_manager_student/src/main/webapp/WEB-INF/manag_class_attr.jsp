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
	<select name="flbh1" id="spu_class_1_attr" onchange="get_spu_class_2_attr(this.value)">
		<option>请选择</option>
	</select>	
	<select name="flbh2" id="spu_class_2_attr">
		<option>请选择</option>
	</select>

<script type="text/javascript">
$(function(){
	$.getJSON("js/json/class_1.js", function(data){
		  $(data).each(function(i,json){
			  $("#spu_class_1_attr").append("<option value="+json.id+">"+json.flmch1+"</option>");
		  });
	});
	
});

function get_spu_class_2_attr(class_1_id){
	$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
		$("#spu_class_2_attr").empty();
		$(data).each(function(i,json){
			$("#spu_class_2_attr").append("<option value="+json.id+">"+json.flmch2+"</option>");
		});
	});	
}
</script>
</body>
</html>