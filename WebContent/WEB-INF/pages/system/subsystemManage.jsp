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
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
		
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>子系统列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
	                    <div class="btn-group hidden-xs" id="toolbar" role="group">
	                        <button type="button" class="btn btn-outline btn-default" id="add">
	                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
	                        </button>
	                        <select class="form-control" >						                
						        <option value="all">导出全部</option>
						        <option value="basic">导出当页</option>
						        <!-- <option value="selected">导出选择</option> -->
						    </select>
	                    </div>
	                    <table id="table" data-height="400" data-mobile-responsive="true">                                    
	                    </table>
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
    <!-- Bootstrap table editable-->
   	<script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>    
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

	<script type="text/javascript">
		var $table = $('#exampleTableEvents'),
	    $button = $('#button');
		$(function () {
	        $button.click(function () {
	            var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	                return row.id;
	            });
	            //alert(ids);
	            $table.bootstrapTable('remove', {
	                field: 'id',
	                values: ids
	            });
	        });
	    });
		
		function edit(Id){
			parent.layer.open({
                type: 2,
                title:'定义菜单',
                area: ['80%', '100%'],
                skin: 'layui-layer-rim', //加上边框
                content: 'system/defineMenus?id='+Id,
                end:function () {
                	$('#table').bootstrapTable('refresh');
                }
	        }); 
		}
		
		function del(Id) {
			if (confirm("是否确认删除？")){
				$.ajax({ 
			        url: "deleteSubsystem", 
			        method: "post",
			        dataType: "json",
			        traditional: true,
			        //传送请求数据
			        data: {'id':Id},
			        success: function (data) { 
			        	if (data.success) {
				        	layer.msg('删除成功');
				        	$('#table').bootstrapTable('refresh');
			        	} else {
			        		layer.msg(data.errorMsg);
			        	}
			        },
			        error:function(data){	
			        	alert("请求失败!");	
			        }
			    });	
			}
		}
		 $(document).ready(function () {
			 $('#table').bootstrapTable({
			      url: "getSubsystemList",
			      search: true,
			      method:'post',
			      pagination: true,
			      showRefresh: true,
			      showColumns: true,
			      showExport:true,
			      showFooter:true,
			      sidePagination : "server", // 服务端处理分页 
			      iconSize: 'outline',
			      toolbar: '#toolbar',
			      queryParams: function (param) {
			    		var temp = {   
			    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			    	            limit: param.limit,   //页面大小
			    	            offset: param.offset  //页码
			    				//name: $("#role_name").val()
			    				//account:param.search
			    	        };
			    	        return temp;
			    	},
			      columns: [
			    	  /* {title: '选择',field: 'choose',align: 'center',checkbox: true,valign: 'middle',   
					    	  footerFormatter: function (value) {					    	        
					    	        return "<span id='checkbox_num'>0<span>";
					    	  }
			      			}, */
			      			{title: '子系统id',field: 'id',align: 'center',valign: 'middle'
				            },
			                {title: '子系统名',field: 'name',align: 'center',valign: 'middle',
						    	editable: {
					                   type: 'text',
					                   title: '子系统名',
					                   validate: function (v) {
					                       if (!v) return '角色名不能为空';
					                   }
				             	}
			                },
			                {title: '排序号',field: 'sortNo',align: 'center',valign: 'middle',
			                	editable: {
					                   type: 'text',
					                   title: '排序号',
					                   validate: function (v) {
					                       if (!v) return '排序号不能为空';
					                   }
					             }
				            },
			                {
			                    title: '操作',
			                    field: 'option',
			                    align: 'center',
			                    formatter:function(value,row,index){
				      		        var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">定义菜单</a> ';  
				      		        var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
				                    return e+d; 
			                  	} 
			                }] ,
			      icons: {
			        refresh: 'glyphicon-repeat',
			        toggle: 'glyphicon-list-alt',
			        columns: 'glyphicon-list'
			      },
			      onEditableSave: function (field, row, oldValue, $el) {
		                $.ajax({
		                    type: "post",
		                    url: "editSubsystem",
		                    data: row,
		                    dataType: 'JSON',
		                    success: function (data, status) {
		                        if (status == "success") {
		                        	layer.msg('修改成功');
		                        }
		                    },
		                    error: function () {
		                    	layer.msg('修改失败');
		                    	//alert('编辑失败');
		                    },
		                    complete: function () {

		                    }

		                });
		            },
		            onCheck:function(row){
		            	var num=calculate_select($('#table'));
		            	$("#checkbox_num").html("已选："+num);
		              },
		            onUncheck:function(row){
		            	var num=calculate_select($('#table'));
		            	$("#checkbox_num").html("已选："+num);
		            },
		            onCheckAll:function(row){
		            	var num=calculate_select($('#table'));
		            	$("#checkbox_num").html("已选："+num);
		            },
		            onUncheckAll:function(row){
		            	var num=calculate_select($('#table'));
		            	$("#checkbox_num").html("已选："+num);
		            }
			 });
			 
			 $('#add').on('click', function () {
				  parent.layer.open({
		                type: 2,
		                title:'新增子系统',
		                area: ['620px', '580px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'system/subsystemAdd',
		                end:function () {
		                	$('#table').bootstrapTable('refresh');
		                }
		          }); 				
			 });
			 
			 $('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 
			 $('#search').on('click', function () {
					$('#table').bootstrapTable('refresh');
			 });
	     });		  
	</script>
</html>