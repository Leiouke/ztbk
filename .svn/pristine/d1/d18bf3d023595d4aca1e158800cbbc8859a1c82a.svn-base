<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();
	request.setAttribute("context",context);
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
		
		<script type="text/javascript">
		</script>
	</head>
	<body>
	<div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">
                            <h3>预警列表</h3>
                            <ul class="folder-list dictionaryMenu" style="padding: 0">
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
            	<div class="ibox float-e-margins">
		            <div class="ibox-title">
		                <h5>查询</h5>
		                <div class="ibox-tools">
		                    <a class="collapse-link">
		                        <i class="fa fa-chevron-up"></i>
		                    </a>
		                </div>
		            </div>
		            <div class="ibox-content search-content">
			            <form id="form_search" class="form-inline">
			            <input type="hidden" name="status" value=0>
			            <div class="col-xs-11">
			            	  <div class="form-group inline-small">
							    <label >员工账号：</label>
							    <input type="text" name="account" class="form-control search-items" >
							  </div>
							  <div class="form-group inline-small">
							    <label >员工姓名：</label>
							    <input type="text" name="userName" class="form-control search-items" >
							  </div>			  
							  <div class="form-group inline-small">
							    <label >角色：</label>
							    <select name="approve_role" class="form-control dictionary search-items">
							    	<option></option>
							    </select>
							  </div>
							  <div class="form-group inline-small">
							    <label >部门：</label>
							    <select name="dep_org_code" class="form-control search-items" id="dep_org_code">
							    	<option></option>
							    </select>
							  </div>
						 </div>
						 <div class="col-xs-1 search-group-button">
							  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
							  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
						 </div>
						</form>
		            </div>
		        </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
					<form id="userlist">
					<input type="hidden" name="tableId" value="${param.wariningId}"/>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan=3>用户列表-${description }</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </form>
                        <c:if test="${not empty param.wariningId}">
                        	<button id="save" class="btn btn-primary" type="button" style="float:right">保存</button>
                        </c:if>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>    
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<%--     <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script> --%>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
		 $(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			$.ajax({
			        url: "getAllWarning", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        //data: {productids:productids,level:configLevel},
			        success: function (data) { 
			        	for (i = 0; i < data.length; i++){
			        		$(".dictionaryMenu").append("<li><a href=\"warningManage?wariningId="+data[i].tableId+"\"><i class=\"fa fa-folder\"></i>"+data[i].description+"</a></li>");
			        	}
			        },
			        error:function(data){	
			        	alert("ajax请求失败!");	
			        }
			});
			createTable();
			$("#search").on('click',function(){
				$("table tbody").empty();
				createTable();
			 });
			$('#save').on('click', function () {
				$.ajax({ 
			        url: "commitWarningAccount", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        data: $('#userlist').serialize(),
			        success: function (data) { 
			        	layer.msg('保存成功');
			        },
			        error:function(data){	
			        	alert("请求失败!");	
			        }
			    });
			});
			
			
			//获得所有部门
			$.ajax({ 
			        url: "../organization/getOrgListSearch", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        data: {org_type: 0},
			        success: function (data) { 
			        	for (i = 0; i < data.rows.length; i++) {
			        		$("[name='dep_org_code']").append("<option value=" + data.rows[i].org_code + ">" + data.rows[i].org_name + "</option>");
			        	}
			        },
			        error:function(data){	
			        	alert("ajax请求失败!");	
			        }
			 });
	     });
		 function createTable(){
			 if('${param.wariningId}'!=''&&'${param.wariningId}'!='undefined'){
					$.ajax({ 
					        url: "getStaff", 
					        method: "post",
					        dataType: "json",
					        traditional:true,
					        //传送请求数据
					        data: $("#form_search").serialize(),
					        success: function (data) {
					        	for (i = 0; i < data.length; i+=3){
					        		var item="<tr><td><input type=\"checkbox\" name=\"accounts\" value=\""+data[i].account+"\" onClick=\"checkboxClick(this)\"/>"+data[i].userName+"</td>";
					        		if(i+1<data.length){
					        			item+="<td><input type=\"checkbox\" name=\"accounts\" value=\""+data[i+1].account+"\" onClick=\"checkboxClick(this)\"/>"+data[i+1].userName+"</td>";
					        		}
					        		if(i+2<data.length){
					        			item+="<td><input type=\"checkbox\" name=\"accounts\" value=\""+data[i+2].account+"\" onClick=\"checkboxClick(this)\"/>"+data[i+2].userName+"</td>";
					        		}
					        		item+="</tr>";
					        		$("table tbody").append(item);
					        	};
					        	$("table tbody").append("<tr><td><input type=\"checkbox\" id=\"allcheck\" onClick=\"allCheckClick()\">全选</td>");
					        	$.ajax({ 
							        url: "getWarningAccount", 
							        method: "post",
							        dataType: "json",
							        traditional:true,
							        //传送请求数据
							        data: {tableId:'${param.wariningId}'},
							        success: function (u_data) {
							        	for (i = 0; i < u_data.length; i++){
							        		$(":checkbox[value='"+u_data[i]+"']").attr("checked", true);
							        	}
							        },
							        error:function(data){	
							        	alert("ajax请求失败!");	
							        }
								});
					        },
					        error:function(data){	
					        	alert("ajax请求失败!");	
					        }
					});				
				}
		 }
		 function allCheckClick(){
			 var checked=$("#allcheck").prop('checked');
			 $("input:checkbox").each(function(){
				 $(this).prop('checked',checked);
			 });
		 }
		 
		 function checkboxClick(obj) {
			 if (!obj.checked) {
				 $.ajax({ 
				        url: "deleteWarningAccount", 
				        method: "post",
				        dataType: "json",
				        traditional:true,
				        //传送请求数据
				        data: {tableId:'${param.wariningId}', account: obj.value},
				        success: function (u_data) {
				        	alert("已取消当前用户的预警配置!");
				        },
				        error:function(data){	
				        	alert("ajax请求失败!");	
				        }
				});
			 }
		 }
	</script>
</html>