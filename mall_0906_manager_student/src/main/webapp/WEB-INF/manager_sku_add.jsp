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

</head>
<body>
	<h2>商品库存单元添加</h2>
	<form action="save_manager_sku.do" method="post">
		一级分类<select name="flbh1" id="spu_class_1_sku" onchange="get_spu_class_2_sku(this.value)"></select>	
		二级分类<select name="flbh2" id="spu_class_2_sku" onchange="get_attr_list(this.value)"></select>	
		商品品牌<select name="pp_id" id="tm_class_1_sku" onchange="get_shpmch()"></select>
		商品名称<select id="shpmch" name="shp_id" onchange="show_sku_info()"></select>
		<hr/>
		<div id="attr_list_inner"></div>	
		
		<div id="sku_info" style="display:none;">
			商品库存名称：<input name="sku_mch" type="text" /><br/>
			商品库存数量：<input name="kc" type="text" /><br/>
			商品库存价格：<input name="jg" type="text" /><br/>
			商品库存地址：<input name="kcdz" type="text" /><br/>
		</div>
		
		<input type="submit" value="提交"/>	
	</form>
<script type="text/javascript">
	$(function(){
		$.getJSON("js/json/class_1.js", function(data){
			  $(data).each(function(i,json){
				  $("#spu_class_1_sku").append("<option value="+json.id+">"+json.flmch1+"</option>");
			  });
		});
		
	});
	
	function get_spu_class_2_sku(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#spu_class_2_sku").empty();
			$(data).each(function(i,json){
				$("#spu_class_2_sku").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});	
		get_tm_class_1(class_1_id);
	}
	function get_tm_class_1(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#tm_class_1_sku").empty();
			$(data).each(function(i,json){
				$("#tm_class_1_sku").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});		
	}
	
	function get_attr_list(class_2_id){
		$.get("get_sku_attr.do",{class_2_id:class_2_id},function(data){
			$("#attr_list_inner").html(data);
		});
	}
	
	function get_shpmch(){
		var flbh2 = $("#spu_class_2_sku").val();
		var pp_id = $("#tm_class_1_sku").val();
		$.get("get_shpmch_list.do",{flbh2:flbh2,pp_id:pp_id},function(data){
			$("#shpmch").empty();
			$.each(data,function(i,json){
				$("#shpmch").append("<option value="+json.id+">"+json.shp_mch+"</option>");
			});
		}); 
	}
	
	function show_sku_info(){
		$("#sku_info").show();
	}
</script>	
</body>
</html>