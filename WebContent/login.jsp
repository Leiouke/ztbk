<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
	request.setAttribute("context",context);
%> 
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
 	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">

    </head>
    <title>中图上海报刊系统</title>
    <body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <!-- <div class="logopanel m-b">
                        <h1>[ 人力资源 ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>人力资源</strong>系统</h4>	
					员工用工号登录, 默认密码：1111<br> -->
                </div>
            </div>
            <div class="col-sm-5">
                <form id="login_form" onsubmit="return false">
                    <h4 class="no-margins">欢迎使用报刊系统</h4>
                    <p class="m-t-md"></p>
                    <input type="text" name="account" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="password" class="form-control pword m-b" placeholder="密码" />
                    <button type="submit" class="btn btn-success btn-block" id="submit">登录</button>
                </form>
            </div>
        </div>
        <!-- <div class="signup-footer">
            <div class="pull-left">
                
            </div>
        </div> -->
    </div>
</body>
    <script src="${context}/js/jquery.min.js?v=2.1.4"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>    
     <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
        $(document).ready(function() {
        	$("#submit").click(function(){
        		$.ajax({
       			 url:"login",
       			 type:"post",
       			 data:$("#login_form").serialize(),
       			 success:function(returnData){
       					 if(returnData.success){
       						 window.location.href = "index";
       					 }else{
       						layer.msg(returnData.errorMsg);
    			        	setTimeout(function (){
    			        		window.location.reload();//something you want delayed
    			        	   }, 1000); // how long do you want the delay to be? 
       						 
       					 }
       					 },
       			 error:function(data,text){
       				 alert("connection fail");
       			 },
       			 dataType:"json"
       			});
        	});
        });
        
    </script>
</html>
    