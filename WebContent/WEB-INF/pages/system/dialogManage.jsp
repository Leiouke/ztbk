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
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
		
		<script type="text/javascript">
		</script>
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight">         
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>消息</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                                <div class="btn-group hidden-xs" id="tableTool" role="group" style="margin-bottom:5px">
                                    <button type="button" class="btn btn-outline btn-default" id="add">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <table id="table" data-height="550" data-mobile-responsive="true">
                                    
                                </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	</body>
	    
	<%-- <!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script> --%>


    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- comment-->
    <script src="${context}/js/common/common.js"></script>
    <!-- 通用js -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
	<script type="text/javascript">
		 $(document).ready(function () {
			 $('#table').bootstrapTable({
			      url: "getDialogList",
			      method:'post',
			      pagination: true,
			      sidePagination : "server", // 服务端处理分页
			      queryParams: function (param) {
			    		var temp = {   
			    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			    	            limit: param.limit,   //页面大小
			    	            offset: param.offset,  //页码
			    	            total:'${total}',
			    		    //我们吧#txt_search_departmentname里面的值以departmentname传到后台
			    	        };
			    	        return temp;
			    	},
			      columns: [{
			    	  			title: '内容',field: 'content',align: 'left',width:'80%',
			    	  			formatter:function(value,row,index){
			    	  				 var e = '<a href=noticeDetail?id='+row.ID+' target="_blank">'+value+'</a> ';
			    	  				return e;
			    	  				} 
			      			},
			      			{
			    	  			title: '发送人账号',field: 'sender',align: 'center',valign: 'middle',
			                },
			                {
			    	  			title: '发送人姓名',field: 'sender_name',align: 'center',valign: 'middle',
			                },
			                {
			    	  			title: '日期',field: 'sendTime',align: 'center',valign: 'middle',
			    	  			formatter:function(value,row,index){
			    	  				return renderDate(value);
			    	  				} 
			                }
			                ]
			    });
			 $('#add').on('click', function () {
				  parent.layer.open({
		                type: 2,
		                title:'发送消息',
		                area: ['720px', '680px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'dialogAdd',
		                end:function () {
		                	$('#table').bootstrapTable('refresh');
		                }
		            }); 				
			 }); 
	     });
		  
	</script>
</html>