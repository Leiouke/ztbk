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
	    
	    <!-- 通用查询grid 列渲染函数库 -->
	    <script src="${context}/js/common/gridColumnFormat.js"></script>
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight">
        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>任务-${description}</h5>
                <div class="ibox-tools">
                </div>
            </div>
            <div class="ibox-content ibox-content-table">
                <div class="row row-lg">
                    
                    <div class="col-sm-12">
                        <!-- Example Events -->
                        <div class="example-wrap">
                        		<div class="btn-group hidden-xs" id="tableTool" role="group">
                                    <button type="button" class="btn btn-outline btn-default" id="config">
                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <table id="table" data-height="600" data-mobile-responsive="true">
                                    
                                </table>
                        </div>
                        <!-- End Example Events -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Other -->
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
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- Peity -->
	<script type="text/javascript">
		
		 $(document).ready(function () {
			 $('#table').bootstrapTable({
			      url: "getDetailList",
			      search: true,
			      method:'post',
			      pagination: true,
			      sortable:true,
			      showRefresh: true,
			      showColumns: true,
			      showExport:true,
			      searchOnEnterKey:true,//回车触发搜索
			      sidePagination : "server", // 服务端处理分页 
			      iconSize: 'outline',
			      toolbar: '#tableTool',
			      exportDataType:'all',
			      pageSize:200,
			      pageList:[200, 500, 5000],
			      queryParams: function (param) {
			    		var temp = {   
			    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			    	            limit: param.limit,   //页面大小
			    	            offset: param.offset,  //页码
			    	            sortName:this.sortName,
			    	   	  		sortOrder:this.sortOrder,
			    		    //我们吧#txt_search_departmentname里面的值以departmentname传到后台
			    	           	//account: $("#textAccount").val(),
			    				//userName: $("#textUserName").val()/*,
			    				account1:param.search,
			    	        };
			    	        return temp;
			    	},
			      columns: ${tableHeader},
			      icons: {
			        refresh: 'glyphicon-repeat',
			        toggle: 'glyphicon-list-alt',
			        columns: 'glyphicon-list'
			      }
			    });
			 $('#config').on('click', function () {
				  parent.layer.open({
		                type: 2,
		                title:'表格属性配置',
		                area: ['820px', '580px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: '../csu/columnConfig?queryId=${param.queryId}',
		                end:function () {
		                	$('#table').bootstrapTable('refresh');
		                }
		            }); 				
			 });
			 //操作明细留言
			 $(".ibox-content-table").on('click','.memo',function(){
				 open_layer_refresh(2,"新增订单明细",'${context}/sd/sdItemMemoAddOne?item_id='+$(this).data('item-id'),$('#table'),false,['750px', '580px']);
			 });
	     }); 
	</script>
</html>