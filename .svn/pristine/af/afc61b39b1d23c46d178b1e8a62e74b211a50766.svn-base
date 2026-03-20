<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
		<jsp:include page="include/h_superHead.jsp"></jsp:include>
		<script type="text/javascript">

		</script>
	</head>
	<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
		
		<div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" width="100" src="/images/${sessionScope.user.portrait==null?'portrait/default.jpg':sessionScope.user.portrait}" /></span>  <!-- default.jpg是默认图片 , 如果有图片 存放在 /images/ + ${portrait}下-->
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
	                                <span class="block m-t-xs">
	                                	<strong class="font-bold">${sessionScope.user.userName}</strong>
	                                </span>
	                                <span class="text-muted text-xs block">
		                                <c:choose>
		                                	<c:when test="${empty sessionScope.roles}">管理员</c:when>
		                                	<c:otherwise>
		                                		${sessionScope.defaultRole.name}<br/>${sessionScope.defaultRole.org_name}
		                                	</c:otherwise>
		                                </c:choose>
	                                	<b class="caret"></b>
	                                </span>                                
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <!-- <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                                </li> -->
                                <li><a class="J_menuItem" href="system/toPersonal">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="system/toPassword">修改密码</a>
                                <li><a class="J_menuItem" href="system/userRoleManage?editable=0&account=${sessionScope.user.account}">角色信息</a>  <!-- 不允许维护的角色信息 -->
                               <!--  </li>
                                <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                                </li>
                                <li><a class="J_menuItem" href="system/jobChangelist">切换角色</a> -->
                                <li class="divider"></li>
                                <li><a href="logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">IT</div>
                    </li>
                    <c:forEach items="${sessionScope.menuList}" var="p_menu">
                    	<c:choose>
                    		<c:when test="${!empty p_menu.childMenu}">
                    		<li>
                    			<a href="#">
	                            <i class="fa ${p_menu.icon}"></i>
	                            <span class="nav-label">${p_menu.name}</span>
	                            <span class="fa arrow"></span>
	                        	</a>
	                        	<ul class="nav nav-second-level">
	                        	<c:forEach items="${p_menu.childMenu}" var="s_menu">	                        		
	                        			<li>
                                			<a class="J_menuItem" href="${s_menu.url}" data-index='${s_menu.id}'>${s_menu.name}</a>
                            			</li>
	                        	</c:forEach>
	                        	</ul>
	                        </li>
                    		</c:when>
                    		<c:otherwise>
                    		<li>
                    			<a class="J_menuItem" href="${p_menu.url}"><i class="fa ${p_menu.icon}"></i> <span class="nav-label">${p_menu.name}</span></a>
                    		</li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                         <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#">
                         	<i class="fa fa-bars"></i> 
                         </a>
                         <h3 style="margin-top:20px">
                         	中图上海报刊系统
                         	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         	子系统：
                         	<select name="subsystemId" id="subsystemId">
                         		<c:forEach items="${sessionScope.subsystemList}" var="s_subsystem">	  
                         			<c:choose>
	                                	<c:when test="${subsystemId == s_subsystem.id}"><option value="${s_subsystem.id}" selected>${s_subsystem.name}</option></c:when>
	                                	<c:otherwise><option value="${s_subsystem.id}">${s_subsystem.name}</option></c:otherwise>
	                                </c:choose>
	                        	</c:forEach>
	                        </select>
                         </h3>
                    </div>                   
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="home">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${context}/home" frameborder="0" data-id="home" seamless id="home_page"></iframe>
            </div>
            <!-- <div class="footer">
                <div class="pull-right">&copy; 2017 <a href="#" target="_blank">BooCup</a>
                </div>
            </div> -->
        </div>
        <!--右侧部分结束-->
        
    </div>
		
	</body>
	<script type="text/javascript">
		$(document).ready(function () {
			if (${empty sessionScope.user.password_modify_time}) {
				alert("您的登录密码已经过期, 请马上修改登录密码！");
			}
		});
		
		/*$("input[name='subsystemId']").on('change', function () {
			alert(1);
		});*/
		
		$('#subsystemId').on('change', function () {
			//console.log("account="+${sessionScope.user.account});
			
			if($('#subsystemId').val() ==13){
				var account = "${sessionScope.user.account}";
				//var password = "${sessionScope.user.password}";
				
				window.location.href='http://localhost:8080/itoms/loginTZ?account='+account;
				//window.location.href='http://localhost:8080/itoms/loginTZ?account='+account +'&password='+password;
				//window.location.href='http://localhost:8080/itoms/loginTZ?account=wkh&password=1111';
			}else{
				window.location.href='?subsystemId=' + $('#subsystemId').val();
			}
			//window.location.href='?subsystemId=' + $('#subsystemId').val();
		});
	</script>
</html>