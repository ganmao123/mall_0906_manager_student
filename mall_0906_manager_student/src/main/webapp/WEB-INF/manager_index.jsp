<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base  href="${pageContext.request.contextPath }/"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>硅谷商城</title>
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	
		$(function(){
			var title = decodeURIComponent("${title}");
			var url = "${url}"; 
			open_tabs(title,url);
		});
	
		function open_tabs(title,url){
			var b = $('#tt').tabs('exists',title);
			if (b) {
				//存在,选中该选项卡
				$('#tt').tabs('select',title);
			}else{
				$('#tt').tabs('add',{    
				    title:title,    
				    href:url,    
				    closable:true,    
				    tools:[{    
				        iconCls:'icon-mini-refresh',    
				        handler:function(){    
				            alert('refresh');    
				        }    
				    }]    
				});
			}
		}
	</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
		<h2>后台管理首页</h2>
	</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:190px;padding:10px;">
		<div class="easyui-accordion" style="width:180px;height:300px;">
			<div title="内容管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
				<ul class="easyui-tree">
					<li>
						<span>后台管理</span>
						<ul>
							<li data-options="state:'closed'">
								<span>商品信息管理</span>
								<ul>
									<li>
										<span>商品信息查询</span>
									</li>
									<li>
										<a href="javascript:open_tabs('商品信息添加','goto_manager_spu_add.do');">商品信息添加</a>
									</li>
								</ul>
							</li>
							<li data-options="state:'closed'">
								<span>商品属性管理</span>
								<ul>
									<li>
										<a href="javascript:open_tabs('商品属性查询','goto_manager_attr_list.do');">商品属性查询</a>
									</li>
									<li>
										<a href="javascript:open_tabs('商品属性添加','goto_manager_attr_add.do');">商品属性添加</a>
									</li>
								</ul>
							</li>
							<li data-options="state:'closed'">
								<span>商品库存单元管理</span>
								<ul>
									<li>
										<span>商品库存单元查询</span>
									</li>
									<li>
										<a href="javascript:open_tabs('商品库存单元添加','goto_manager_sku_add.do');" >商品库存单元添加</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<div title="缓存管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			</div>
			<div title="订单管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			</div>
		</div>
		
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div id="tt" class="easyui-tabs" style="height:500px">   
		</div>  
	</div>
	
</body>
</html>