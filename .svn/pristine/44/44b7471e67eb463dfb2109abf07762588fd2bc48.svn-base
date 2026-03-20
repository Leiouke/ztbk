<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%   
	String uri = request.getRequestURI(); // 获得的值类似于(/it/WEB-INF/pages/goods/goodsList.jsp)
	String[] splits = uri.split("/");
	request.setAttribute("moduleKeyName", splits[splits.length-2]);  //moduel关键字
	request.setAttribute("menuName", splits[splits.length-1]);  //具体菜单方法名
%>

<jsp:include page="importResource.jsp"></jsp:include>

<link href="../css/baseshen.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .header{ width:100%;height:78px; background:#e5e5e5;}
    .headerup{ height:46px; background:#51b7ec; line-height:46px; padding: 0 0 0 20px;}
    .headerdown{ height:30px; background:#efefef; clear:both; padding: 0 0 0 40px;}
    .h_logo{ float:left; width:200px; text-align:center; line-height:46px; border:0px solid #efefef;}
    .h_about{ float:right; margin:0 10px 0 0;}
    .h_cnav li,.h_nav li,.h_about li{ float:left; margin:0 1px 0 0; padding:0 24px; text-align:center; border-radius:3px; }
    .h_nav li a,.h_about li a{ display:inline-block; width:100%; height:100%; line-height:46px; font-weight:900;color:#eeeeee; }
    .h_nav li:hover,.h_about li:hover{ animation:myfirst 0.8s forwards; -webkit-animation: myfirst 0.8s forwards; background:#145ccd; color:#ffffff; }
    .h_cnav{ margin:0px;}
    .h_cnav li a{ display:inline-block; width:100%; height:100%; line-height:30px; color:#145ccd;}
    .h_cnav li:hover{ animation:mysecond 0.8s forwards; -webkit-animation: mysecond 0.8s forwards;background:#d1d1d1;  }
    
    .dropdown{ position:relative;}
    .dropdown>a{ position: relative;}
    .u_myself{ width:100%; display:none; position:relative; top:1px; left:1px; position: absolute; top:100%; background:#ffffff;border-radius: 2px;box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176);font-size: 14px;z-index: 1000;}
    .u_myself li{ width:100%; height:32px; padding:0; border-radius:3px;}
    .u_myself li a{ color:#000000; font-weight:900;line-height:32px; font-size:12px;}
    .dropdown:hover .u_myself{ display:block;}
    .u_myself li a:hover{ color:#ffffff;}
    
    .nav_active{ color:#ffffff; background:#145ccd;}
    .cnav_active{ background:#d1d1d1;}
    @keyframes myfirst{
        0%{background:#51b7ec; color:#eeeeee;}
        100% {background:#145ccd; color:#ffffff;}
    }
    @-webkit-keyframes myfirst{
        0%{background:#51b7ec; color:#eeeeee;}
        100% {background:#145ccd; color:#ffffff;}
    }
    
    @keyframes mysecond{
        0%{background:#efefef; }
        100% {background:#d1d1d1; }
    }
    @-webkit-keyframes mysecond{
        0%{background:#efefef; }
        100% {background:#d1d1d1; }
    }
</style>

<div class="header">
    <div class="headerup">
        <div class="h_logo"><img src="../images/logo.gif" width="40" height="40"/></div>
        <div class="h_logo">中国图书进出口上海公司</div>
        <div class="h_logo">${sessionScope.role==null?'管理员':sessionScope.role.name}系统</div>
        <ul class="h_about">
            <li class="dropdown">
                <a href="javascript://">欢迎${sessionScope.user.account}<span class="jiantouxia"></span></a>
                <ul class="u_myself">
                   <li><a data-toggle="modal" href="../system/toPersonal" data-target="#modal-personal">个人档案</a></li>
                   <li><a data-toggle="modal" href="../system/toPassword" data-target="#modal-personal">更改密码</a></li>
                </ul>
            </li>
            <li><a href="../system/logout">退出</a></li>
            <li><a data-toggle="modal" href="javascript:;" data-target="#modal-about">关于</a></li>
        </ul>
    </div>
    <div class="headerdown">
        <ul class="h_cnav"> 
        	<c:forEach items="${sessionScope.menuList}" var="menu">		
       			<li <c:if test="${menuName.contains(menu.keyName)}">class="cnav_active"</c:if>><a href="${menu.url}">${menu.name}</a></li>	
            </c:forEach>
        </ul>
    </div>
</div>

<div class="modal fade" id="modal-personal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      
    </div>
  </div>
</div>

<div class="modal fade" id="modal-about" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">关于本软件</h4>
	    </div>
	    <div class="modal-body">     	
	   		<p>电脑部信息技术科出品</p>
	   		<p>版本号：V1.2</p>
	    </div>
	    <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	    </div>
    </div>
  </div>
</div>