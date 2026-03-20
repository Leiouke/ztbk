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
         
        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>菜单管理</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>    
                </div>
            </div>
            <div class="ibox-content">
            	<div class=" col-sm-12">
            	<input type="hidden" id="editId" value='0'/>
            		<div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                      <button type="button" class="btn btn-outline btn-default" id="add">
                               <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                      </button>
                      <button type="button" class="btn btn-outline btn-default" id="edit">
                               <i class="glyphicon glyphicon-edit" aria-hidden="true"></i>
                      </button>
                      <button type="button" class="btn btn-outline btn-default" id="delete">
                               <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                       </button>
                	</div>
                    <div id="treeview" class="test" style="margin-top:5px"></div>
                </div>
            </div>
        </div>
        <!-- End Panel Other -->
    </div>
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
 <!-- Bootstrap-Treeview plugin javascript -->
    <script src="${context}/js/plugins/treeview/bootstrap-treeview.js"></script>
    <%-- <script src="${context}/js/demo/treeview-demo.js"></script> --%>
    
    
	<script type="text/javascript">
		/* var $table = $('#exampleTableEvents'),
	    $button = $('#button');
		$(function () {
	        $button.click(function () {
	            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	                return row.id;
	            });
	            alert(ids);
	            $table.bootstrapTable('remove', {
	                field: 'id',
	                values: ids
	            });
	        });
	    }); */
		function getTree() {
			var my_data='';
			$.ajax({ 
		        url: "getMemuTree", 
		        method: "post",
		        dataType: "json",
		        async: false,
		        success: function (data) { 
		        	//console.log(data);
		        	my_data=data
		        },
		        error:function(data){	
		        	alert("请求失败!");	
		        }
		    });
			return my_data;
		}
		function loadTree(){
			$('#treeview').treeview({			    
				data: getTree(),
				levels: 1,
				onNodeSelected: function (event, node) {
					$("#editId").val(node.id);   
					 //$('#event_output').prepend('<p>您单击了 ' + node.id + '</p>');
			     },
			     onNodeUnselected: function (event, node) {
			    	 $("#editId").val('0');   
					 //$('#event_output').prepend('<p>您单击了 ' + node.id + '</p>');
			     }
			 });
		}
		 $(document).ready(function () {
			 loadTree();
			 $('#add').on('click', function () {
				  parent.layer.open({
		                type: 2,
		                title:'新增菜单',
		                area: ['620px', '580px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'system/menuAdd?id='+$("#editId").val(),
		                end:function () {
		                	loadTree();
		                }
		            }); 				
			 });
			 $('#edit').on('click', function () {
				 if($("#editId").val()!=0){
				  parent.layer.open({
		                type: 2,
		                title:'编辑菜单',
		                area: ['620px', '580px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'system/menuEdit?id='+$("#editId").val(),
		                end:function () {
		                	loadTree();
		                }
		            });
				 }else{
					 layer.msg('先选择菜单');
				 }
			 });
			 $('#delete').on('click', function () {
				 if($("#editId").val()!=0){
					 $.ajax({ 
					        url: "deleteMenu", 
					        method: "post",
					        dataType: "json",
					        traditional:true,
					        //传送请求数据
					        data: {'id':$("#editId").val()},
					        success: function (data) { 
					        	layer.msg('删除成功');
					        	loadTree();
					        },
					        error:function(data){	
					        	alert("请求失败!");	
					        }
					  });
				 }else{
					 layer.msg('删除成功');
				 }
			 });
	     });
	</script>
</html>