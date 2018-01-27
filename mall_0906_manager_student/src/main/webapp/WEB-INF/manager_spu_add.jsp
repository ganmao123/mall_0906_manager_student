<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

</head>
<body>
		<div class="easyui-layout" data-options="fit:true">
			<form action="save_manager_spu.do" method="post" enctype="multipart/form-data">
				<div data-options="region:'north',split:true,border:false" style="height:50px">
					一级分类<select name="flbh1" id="spu_class_1_1" onchange="get_spu_class_2_2(this.value)"></select>	
					二级分类<select name="flbh2" id="spu_class_2_2"></select>	
					商品品牌<select name="pp_id" id="tm_class_1_1"></select><br/>
				</div>
				<div data-options="region:'west',split:true,border:false" style="width:100px"></div>
				<div data-options="region:'center',border:false">
					商品名称:<input name="shp_mch" type="text" value="测试商品spu输入"/><br/>
					商品描述:<textarea name="shp_msh">测试商品描述</textarea><br/>
					商品图片:<input name="files[0]" type="file"/>
					<br/>
					<input type="submit" value="提交"/>
				</div>
			</form>
		</div>
	
	
<script type="text/javascript">

	$(function(){
		$.getJSON("js/json/class_1.js", function(data){
			  $(data).each(function(i,json){
				  $("#spu_class_1_1").append("<option value="+json.id+">"+json.flmch1+"</option>");
			  });
		});
		
	});
	
	function get_spu_class_2_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#spu_class_2_2").empty();
			$(data).each(function(i,json){
				$("#spu_class_2_2").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});	
		get_tm_class_1(class_1_id);
	}
	function get_tm_class_1(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_class_1_1").empty();
			$(data).each(function(i,json){
				$("#tm_class_1_1").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});		
	}
	
</script>
</body>
</html>