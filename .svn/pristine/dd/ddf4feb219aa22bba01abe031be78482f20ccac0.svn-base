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
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>	
	</head>
	<body>
	<div style="padding:20px;">
			<div class="col-md-12">
			   <form id="form" class="form-horizontal">
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">用户账号：</label>
			                  <input type="hidden" name="id" value="${user.id}">
			                  <div class="col-sm-9">
			                        <input type="text" name="account" class="form-control" placeholder="账号" value="${user.account}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			         </div>
			         <div class="form-group" >
			                    <label class="col-sm-3 control-label">用户密码：</label>
			                    <div class="col-sm-9">
			                        <input type="password" class="form-control" name="password" placeholder="请输入密码">
			                    </div>
			        </div>
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">工号：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="job_no" class="form-control" placeholder="工号" value="${user.job_no}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			        </div>
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">用户姓名：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="userName" class="form-control" placeholder="姓名" value="${user.userName}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			        </div>
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">联系电话：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="mobile" class="form-control" placeholder="联系电话" value="${user.mobile}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			        </div>
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">电子邮箱：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="email" class="form-control" placeholder="电子邮箱" value="${user.email}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			        </div>
			        <div class="form-group" >
			                    <label class="col-sm-3 control-label" >所属角色：</label>
			                    <div class="col-sm-9">
			                        <select class="form-control" name="roleId">
			                        
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
	
	<script type="text/javascript">
	$.ajax({ 
        url: "getAllRoles", 
        method: "post",
        dataType: "json",
        traditional:true,
        //传送请求数据
        //data: {productids:productids,level:configLevel},
        success: function (data) { 
        	for (i = 0; i < data.length; i++){
        		if ('${user.roleId}' == data[i].id){
        			$("[name='roleId']").append("<option value=" + data[i].id + " selected>" + data[i].name + "</option>");
        		} else {
        			$("[name='roleId']").append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
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
		        url: "editUser", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: $('#form').serialize(),
		        success: function (data) { 
		        	layer.msg('修改成功');
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