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
	<div class="wrapper wrapper-content  animated fadeInRight article">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">                        
                        <div class="text-center article-title">
                        <c:if test="${one.messageType=='公告'}">
                        <h1>
                                   ${one.title}
                                </h1>
                        </c:if>
                            
                        </div>
                        <div class="text-center">
                            <h3>
                                   ${one.sender}_${one.sender_name}<br>${one.sendTime.toString().substring(0,10)}
                            </h3>
                        </div>
                        ${one.content}
                        <hr>
                    </div>
                </div>
            </div>
        </div>

    </div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
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
	        		$("[name='roleId']").append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
	        	}
	        },
	        error:function(data){	
	        	alert("ajax请求失败!");	
	        }
	    });
		$(document).ready(function () {
			$('#save').on('click', function () {
				$.ajax({ 
			        url: "addUser", 
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