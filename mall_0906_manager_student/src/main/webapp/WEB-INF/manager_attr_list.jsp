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
		<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:true,border:false" style="height:50px">
					一级分类<select name="flbh1" class="easyui-combobox" id="class_1_attr_list">
								<option>请选择</option>
						  </select>	
					二级分类<select name="flbh2" class="easyui-combobox" id="class_2_attr_list" onchange="show_attr_list_inner(this.value)">
								<option>请选择</option>
						  </select>	
				</div>
				<div data-options="region:'west',split:true,border:false" style="width:100px"></div>
				<div data-options="region:'center',border:false">
					<div id="attr_inner"></div>
				</div>
		</div>

<script type="text/javascript">
	//使用easyui的combobox下拉框解决样式简单等问题
	$(function(){
		$('#class_1_attr_list').combobox({    
		    url:'js/json/class_1.js',    
		    valueField:'id',    
		    textField:'flmch1',
		    width:100,
		    onSelect:function get_class_2_attr_list(){
		    	var class_1_id = $(this).combobox("getValue");
				$('#class_2_attr_list').combobox({    
				    url:"js/json/class_2_"+class_1_id+".js",    
				    valueField:'id',    
				    textField:'flmch2',
				    width:100,
				    onSelect:function(){
				    	var class_2_id = $(this).combobox("getValue");
				    	show_attr_list_inner(class_2_id);
				    }
				}); 
		    }
		});  

	});

	$(function(){
		/* $.getJSON("js/json/class_1.js", function(data){
			  $(data).each(function(i,json){
				  $("#class_1_attr_list").append("<option value="+json.id+">"+json.flmch1+"</option>");
			  });
		}); */
		
	});
	
	function get_class_2_attr_list(class_1_id){
		$('#class_2_attr_list').combobox({    
		    url:"js/json/class_2_"+class_1_id+".js",    
		    valueField:'id',    
		    textField:'flmch2',
		    width:100
		}); 
		
		/* $.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#class_2_attr_list").empty();
			$(data).each(function(i,json){
				$("#class_2_attr_list").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});	 */
	}
	
	function show_attr_list_inner(class_2_id){
		//使用easyui的datagrid方式加载
		$('#attr_inner').datagrid({    
		    url:'get_manager_attr_list_json.do', 
		    queryParams: {
		    	class_2_id: class_2_id
			},	
		    columns:[[    
		        {field:'id',title:'属性id',width:100},    
		        {field:'shxm_mch',title:'属性名称',width:100},    
		        {field:'list_value',title:'属性值',width:300,
		        	formatter: function(value,row,index){
						var str = "";
						$(value).each(function(i,json){
							str = str+json.shxzh+json.shxzh_mch;
						});
		        		return str;
					}
		        },    
		        {field:'chjshj',title:'创建时间',width:150,
		        	formatter: function(value,row,index){
		        		return new Date(value).toLocaleString();
					}

		        }    
		    ]]    
		});  

		
		/* 
		//内嵌页方式
		$.get("get_manager_attr_list.do", 
			{ class_2_id: class_2_id},
		 	function(data){
	    		$("#attr_inner").html(data);
			}
		); */
	}
	
</script>	
</body>
</html>