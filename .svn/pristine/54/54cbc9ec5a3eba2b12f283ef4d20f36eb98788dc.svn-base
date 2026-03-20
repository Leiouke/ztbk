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
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
            	<div class="form-inline">
				  <div class="form-group">
				    <label for="role_name">角色名</label>
				    <input type="text" class="form-control search-items" id="role_name" placeholder="">
				  </div>
				  <button type="button" class="btn btn-primary btn-sm" id="search">查询</button>
				  <button type="button" class="btn btn-default btn-sm" id="reset">清空</button>
				</div>
            
            </div>
        </div>
        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>角色管理</h5>
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
	                title:'授权角色',
	                area: ['620px', '580px'],
	                skin: 'layui-layer-rim', //加上边框
	                content: 'system/roleEdit?id='+Id,
	                end:function () {
	                	$('#table').bootstrapTable('refresh');
	                }
	         }); 
		}
		
		function update(id) {
			parent.layer.open({
                type: 2,
                title:'修改角色',
                area: ['620px', '580px'],
                skin: 'layui-layer-rim', //加上边框
                content: 'system/roleUpdate?id='+id,
                end:function () {
                	$('#table').bootstrapTable('refresh');
                }
         	}); 
		}
		
		function del(Id){
			if (confirm("是否确认删除？")){
				$.ajax({ 
			        url: "deleteRole", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        data: {'id':Id},
			        success: function (data) { 
			        	layer.msg('删除成功');
			        	$('#table').bootstrapTable('refresh');
			        },
			        error:function(data){	
			        	alert("请求失败!");	
			        }
			    });	
			}
		}
		
		$(document).ready(function () {
			 $('#table').bootstrapTable({
			      url: "getRoleList",
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
			    	            offset: param.offset,  //页码
			    				name: $("#role_name").val()
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
			      			{title: '角色id',field: 'id',align: 'center',valign: 'middle'
				            },
			                {title: '角色名',field: 'name',align: 'center',valign: 'middle',
					    	 editable: {
				                   type: 'text',
				                   title: '角色名',
				                   validate: function (v) {
				                       if (!v) return '用户名不能为空';
				                   }
				             }
			                },
			                {title: '默认子系统',field: 'subsystemName',align: 'center',valign: 'middle'
				            },
			                {
			                    title: '操作',
			                    field: 'option',
			                    align: 'center',
			                    formatter:function(value,row,index){
			      		               var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">菜单授权</a> ';  
			      		               var d = '<a href="#" mce_href="#" onclick="update(\''+ row.id +'\')">修改</a> ';
			      		               var f = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
			                    return e+d+f; 
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
		                    url: "editRole",
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
		                title:'新增角色',
		                area: ['620px', '580px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'system/roleAdd',
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