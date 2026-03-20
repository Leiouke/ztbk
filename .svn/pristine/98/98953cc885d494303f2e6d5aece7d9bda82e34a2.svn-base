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
			   <input type="hidden" name="id" value="${dictionary.id}">
			   <input type="hidden" name="directoryId" value="${dictionary.directoryId}">
			       <div class="form-group">
			                  <label class="col-sm-3 control-label">名称：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="name" class="form-control" value="${dictionary.name }"> <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			         </div>
			         <div class="form-group" >
			                    <label class="col-sm-3 control-label">代码：</label>
			                    <div class="col-sm-9">
			                        <input type="text" class="form-control" name="code" value="${dictionary.code }">
			                    </div>
			        </div>
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">排序号：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="sortNo" class="form-control" value="${dictionary.sortNo }"> <!-- <span class="help-block m-b-none">说明文字</span> -->
			                    </div>
			         </div>
			        <div class="form-group" >
			                    <label class="col-sm-3 control-label" >是否启用：</label>
			                    <div class="col-sm-9">
			                        <select class="form-control" name="status">
			                        	<option value="1" <c:if test="${dictionary.status==true}">selected</c:if>>是</option> 
			                        	<option value="0" <c:if test="${dictionary.status==false}">selected</c:if>>否</option> 
			                        </select>
			                    </div>
			        </div>
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">备注：</label>
			                  <div class="col-sm-9">
			                        <input type="text" name="remark" class="form-control" value="${dictionary.remark}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
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
	$(document).ready(function () {
		$('#save').on('click', function () {
			$.ajax({ 
		        url: "editDictionary", 
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