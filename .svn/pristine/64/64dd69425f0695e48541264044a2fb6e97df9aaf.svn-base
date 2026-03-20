<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
		<div style="padding:20px;">
			<div class="col-md-12">
			   <form id="form" class="form-horizontal">
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">菜单名称：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="name" class="form-control" > <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			         </div>
			         <div class="form-group" >
			                    <label class="col-sm-3 control-label">菜单链接：</label>
			                    <div class="col-sm-9">
			                        <input type="text" class="form-control" name="url" >
			                    </div>
			        </div>
			        <div class="form-group" >
			                    <label class="col-sm-3 control-label">图标：</label>
			                    <div class="col-sm-9">
			                        <input type="text" class="form-control" name="icon" >
			                    </div>
			        </div>
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">排序标识：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="sortNo" class="form-control" > <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			         </div>
			         <div class="form-group">
			                  <label class="col-sm-3 control-label">父级菜单：</label>
			                  <div class="col-sm-9">
			                        <select class="form-control" name="pId">
			                        	<option value=''>无</option>
			                        </select>
			                  </div>
			         </div>
			        <div class="form-group" >
				                 <div class="col-sm-offset-4">
			                     <button id="save" class="btn btn-primary" type="button">保存</button>
			                     <button id="cancel" class="btn btn-white" type="button">取消</button>
		                     	 </div>
		            </div>
		       </form>
			 </div>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
		$.ajax({ 
	        url: "getTopMemuNode", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        //data: {productids:productids,level:configLevel},
	        success: function (data) { 
	        	for (i = 0; i < data.length; i++){
	        		/* alert('${my_pid}'+"__"+data[i].id); */
	        		if('${my_pid}'==data[i].id){
	        			$("[name='pId']").append("<option value=" + data[i].id + " selected>" + data[i].name + "</option>");
	        		}else{
	        			$("[name='pId']").append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
	        		}
	        	}
	        },
	        error:function(data){	
	        	alert("ajax请求失败!");	
	        }
	    });
		$(document).ready(function () {
			$('#save').on('click', function () {
				$.ajax({ 
			        url: "addMenu", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        data: $('#form').serialize(),
			        success: function (data) { 
			        	layer.msg('新增成功');
			        	setTimeout(function (){
			        		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		                    parent.layer.close(index);//something you want delayed
			        	   }, 1000); // how long do you want the delay to be? 
			        },
			        error:function(data){	
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