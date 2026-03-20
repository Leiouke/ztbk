<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%   
	String uri = request.getRequestURI(); // 获得的值类似于(/it/WEB-INF/pages/goods/goodsList.jsp)
	String[] splits = uri.split("/");
	request.setAttribute("moduleKeyName", splits[splits.length-2]);  //moduel关键字
	request.setAttribute("menuName", splits[splits.length-1]);  //具体菜单方法名
	
	String[] jspNames = uri.split("pages");
	String jspName = jspNames[1];
	
	// 首页不显示帮助了
	boolean no_help_page = jspName.equals("/index.jsp");
%>

<jsp:include page="h_importResource.jsp"></jsp:include>

<title>中图上海报刊系统</title>
<style>
#previewDiv{z-index: 9999;position:absolute;display:none;background:#fff;border-top:1px solid #999;border-bottom:1px solid #999;border-left:1px solid #999;border-right:1px solid #999;
opacity: 0.3;filter: "alpha(opacity=60)";color:blue;}
</style>

<div id="previewDiv" title="<%=jspName %>">
	业务规则
</div>
<script type="text/javascript">
  function show(){
    //添加并显示遮罩层
    $("#previewDiv").css({
      "position": "absolute",
      "top": 10,
      "left": 10
    });
    $("#previewDiv").show();
  }
  function hide(){
    $("#previewDiv").hide();
  }
  
  show();
  
  if (<%=no_help_page %>) {
	  hide();
  }
  
  $("#previewDiv").on("click", function(){
	  open_layer(2,'帮助信息','${context}/system/helpUpdate?jsp_address=<%=jspName %>', ['500px', '450px'],false);
  })
</script>