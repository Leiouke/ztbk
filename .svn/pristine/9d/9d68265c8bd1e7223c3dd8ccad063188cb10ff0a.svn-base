<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ --> 
	    <jsp:include page="../include/h_importResource.jsp"></jsp:include>	
	</head>
	<body>
	<div style="padding:20px;">
		<div class="col-sm-2">
	        <select class="form-control" id="selectMode">
	        	<option value='0'>所属子系统菜单</option>
	        	<option value='1'>所有菜单</option>
	        </select>
        </div>
		<div class="col-md-12">
			<div id="treeview" class="test" style="margin-top:5px"></div>
			<div class="form-group" >
	            <div class="col-sm-offset-4">
	               <button id="save" class="btn btn-primary" type="button">保存</button>
	               <button id="cancel" class="btn btn-white" type="button">取消</button>
	            </div>
		    </div>
		</div>
	</div>
	</body>
	<script src="${context}/js/plugins/treeview/bootstrap-treeview.js"></script>
	<script type="text/javascript">
	$("#selectMode").on("change", function(){
		//alert($("#selectMode").val());
		//window.location.href = '?id=${param.id}&mode=' + $("#selectMode").val();
		renderTree($("#selectMode").val());
	});
	
	function getTree(selectMode) {
		var my_data='';
		var my_url = "getMenuTreeBySubsystem";
		if (selectMode == 1) {
			my_url = "getMemuTree";
		}
		$.ajax({ 
			//url: "getMemuTree", 
	        url: my_url,
	        method: "post",
	        dataType: "json",
	        async: false,
	        data: {'subsystemId':'${param.id}'},
	        success: function (data) { 
	        	//console.log(data);
	        	my_data=data
	        },
	        error:function(data){	
	        	alert("请求失败!");	
	        }
	    });
		return my_data;
	}
	
	function loadTree(selectMode){
		$('#treeview').treeview({			    
			data: getTree(selectMode),
			showCheckbox: true,
			onNodeChecked: function (event, node) {
				if(node.parentId!=null)
					$('#treeview').treeview('checkNode', node.parentId);
		     },
		 });		
	}
	function  getSubsystemMenu(){
		var menuIds=[];
		$.ajax({ 
	        url: "getSubsystemMenus", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        //async:false,
	        //传送请求数据
	        data: {'subsystemId':'${param.id}'},
	        success: function (data) {
	        	//console.log(data);
	        	$.each(data,function(index,data){
	        		menuIds.push(data.id);
	        	});
	        	var nodes=$('#treeview').treeview('getEnabled');
		    	$.each(nodes,function(idenx,data){
		    		if($.inArray(data.id, menuIds)!=-1){
		    			console.log(data);
		    			$('#treeview').treeview('checkNode',data);
		    		}	    			
		    	});
	        },
	        error:function(data){	
	        	alert("请求失败!");
	        }
	    });
		return menuIds;
		//console.log("return:"+menuIds);		
	}
	
	var my_menuIds
	function renderTree(selectMode) {
		//var node;
    	loadTree(selectMode);
    	//$('#treeview').treeview('checkAll');
    	my_menuIds = getSubsystemMenu();
	}

	$(document).ready(function () {
		renderTree(0);  // 默认渲染所属子系统菜单
    	
    	//console.log($('#treeview').treeview('getParent', node));
		$('#save').on('click', function () {
			var my_menuIds=[];
			var nodes=$('#treeview').treeview('getEnabled');
	    	$.each(nodes,function(idenx,data){
	    		if(data.state.checked)
	    			my_menuIds.push(data.id);
	    	});
	    	if(my_menuIds.length==0){
	    		layer.msg('至少选择一个菜单');
	    		return;
	    	}
			$.ajax({ 
		        url: "menuDefine", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {'menuIds':my_menuIds,'subsystemId':'${param.id}'},			        
		        success: function (data) { 
		        	layer.msg('修改成功');
		        	setTimeout(function (){
		        		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);  //something you want delayed
		        	   }, 1000);   // how long do you want the delay to be? 		        	
		        },
		        error:function(data) {	
		        	alert("请求失败!");
		        }
		    });			
		});
		
		$('#cancel').on('click', function () {
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);
		});
	});
	</script>
</html>