<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
	request.setAttribute("context",context);
%>    
<!-- css -->
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${context}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
   	<link href="${context}/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
   	<link href="${context}/css/animate.css" rel="stylesheet">
   	<link href="${context}/css/style.css?v=4.1.0" rel="stylesheet">
 <!-- js -->
 <!-- 全局js -->
    <script src="${context}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${context}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${context}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${context}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${context}/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${context}/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="${context}/js/contabs.js"></script>
    <!-- 通用查询grid 列渲染函数库 -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
	<script src="${context}/js/common/gridColumnFormat_bk.js"></script>
    <!-- common-->
    <script src="${context}/js/common/common.js"></script>
    <script src="${context}/js/common/common-bsSuggest.js"></script>
    <script src="${context}/js/common/common-bsSuggest-fc.js"></script>  <!-- 财务中心专用的 自动加载完成框 -->
    <script src="${context}/js/common/common-basic-fc.js"></script>  <!-- 财务专用的基础模块专用工具库 -->
    <script src="${context}/js/common/common-basic-bk.js"></script>  <!-- 报刊专用的基础模块专用工具库 -->
    <!-- 第三方插件 -->
    <script src="${context}/js/plugins/pace/pace.min.js"></script>