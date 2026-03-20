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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
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
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">					  
					  <div class="form-group inline-small">
					    <label >账号：</label>
					    <input type="text" id="account" name="account" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >姓名：</label>
					    <input type="text" id="name" name="name" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >启用状态：</label>
					    <select name="status" class="form-control search-items" id="status">
					    	<option></option>
					    	<option value="0">是</option>
					    	<option value="1">否</option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >角色：</label>
					    <select name="roleId" class="form-control search-items" id="roleId">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label>工号：</label>
					    <input type="text" id="job_no" name="job_no" class="form-control search-items" >
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
            <div class="ibox-title">
                <h5>用户管理</h5>
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
                                <div class="btn-group hidden-xs" id="tableTool" role="group">
                                    <button type="button" class="btn btn-outline btn-default" id="add">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <!-- <button type="button" class="btn btn-outline btn-default" id="delete">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button> -->
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
    </div>
    
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>


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
    
	<script type="text/javascript">
		/* var $table = $('#table'),
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
	    }); */
		function edit(account){
			 parent.layer.open({
	                type: 2,
	                title:'编辑用户',
	                area: ['620px', '580px'],
	                skin: 'layui-layer-rim', //加上边框
	                content: 'system/newUserEdit?account='+account,
	                end:function () {
	                	$('#table').bootstrapTable('refresh');
	                }
	            }); 
		}
		function del(userId){
			if (confirm("是否确认删除？")){
				$.ajax({ 
			        url: "deleteUser", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        data: {'id':userId},
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
		
		function enable(userId){
			$.ajax({ 
		        url: "enableUser", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {'id':userId},
		        success: function (data) { 
		        	layer.msg('成功启用');
		        	$('#table').bootstrapTable('refresh');
		        },
		        error:function(data){	
		        	alert("请求失败!");	
		        }
		    });			
		}
		
		function disable(userId){
			$.ajax({ 
		        url: "disableUser", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {'id':userId},
		        success: function (data) { 
		        	layer.msg('成功停用');
		        	$('#table').bootstrapTable('refresh');
		        },
		        error:function(data){	
		        	alert("请求失败!");	
		        }
		    });			
		}
		
		function editRole(account){
			var index = parent.layer.open({
	                type: 2,
	                title:'编辑用户角色',
	                area: ['620px', '580px'],
	                skin: 'layui-layer-rim', //加上边框
	                content: 'system/userRoleManage?account='+account,
	                end:function () {
	                	$('#table').bootstrapTable('refresh');
	                },
	                maxmin: true
	            }); 
			
			parent.layer.full(index);
		}
		
		 $(document).ready(function () {
			 $('#table').bootstrapTable({
			      url: "getUserList",
			      //search: true,
			      method:'post',
			      pagination: true,
			      showRefresh: true,
			      showColumns: true,
			      showExport:true,
			      sidePagination : "server", // 服务端处理分页 
			      iconSize: 'outline',
			      toolbar: '#tableTool',
			      sortable: true,
			      exportDataType:'all',
			      pageList:[10, 25, 50, 100],
			      queryParams: function (param) {
			    	  //console.log(param);
			    		var temp = {   
			    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			    	            limit: param.limit,   //页面大小
			    	            offset: param.offset,  //页码
			    	            sort:param.sort,
			    	            order:param.order,
			    	            total:'${total}',
			    		    //我们吧#txt_search_departmentname里面的值以departmentname传到后台
			    	           	account: $("#account").val(),
			    				userName: $("#name").val(),
			    				status: $("#status").val(),
			    				roleId: $("#roleId").val(),
			    				job_no: $("#job_no").val(),
			    				dep_org_code: $("#dep_org_code").val()
			    				//account:param.search
			    	        };
			    	        return temp;
			    	},
			      columns: [{title: '行号',field: 'rowNo',align: 'center',formatter :function (value, row, index) { return index+1;}  },
			                //{title: '选择',field: 'name',align: 'center',checkbox: true,valign: 'middle'}, 
			                {title: '用户账号',field: 'account',align: 'center',valign: 'middle',sortable:true},
			                {title: '工号',field: 'job_no',align: 'center',valign: 'middle'},
			                {title: '用户姓名',field: 'userName',align: 'center'},
			                {title: '联系电话',field: 'mobile',align: 'center'},
			                {title: '角色',field: 'roleName',align: 'center'},
			                {title: '启用状态',field: 'status',align: 'center', formatter :function (value, row, index) { 
			                	   if (value)
			                	     return '否'
			                	   return '是';
			                	}  
			                },
			                {title: '部门',field: 'dep_org_code_name',align: 'center'},
			                {title: '科室',field: 'office_org_code_name',align: 'center'},
			                {title: '班组',field: 'group_org_code_name',align: 'center'},
			                {title: '审批角色',field: 'approve_role_name',align: 'center'},
			                {
			                    title: '操作',
			                    field: 'id',
			                    align: 'center',
			                    formatter:function(value,row,index){
			                    	if(row.manager!=1){
			      		                 var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.account + '\')">编辑</a> ';  
			      		                 var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
			      		                 var f;
			      		                 //alert(row.status)
			      		                 if (!row.status)
			      		                	f = '<a href="#" mce_href="#" onclick="disable(\''+ row.id +'\')">停用</a> ';  
			      		                 else
			      		                    f = '<a href="#" mce_href="#" onclick="enable(\''+ row.id +'\')">启用</a> ';  
			      		                 var g = '<a href="#" mce_href="#" onclick="editRole(\''+ row.account +'\')">角色</a> ';  
			                    	}else{
			                    		e="";d="";f="";g=""
			                    	}
			                    return e + d + f + g; 
			                  } 
			                }] ,
			      icons: {
			        refresh: 'glyphicon-repeat',
			        toggle: 'glyphicon-list-alt',
			        columns: 'glyphicon-list'
			      }
			    });
			 $('#add').on('click', function () {
				  parent.layer.open({
		                type: 2,
		                title:'新增用户',
		                area: ['620px', '580px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'system/newUserAdd',
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
			 //获得所有角色
			 $.ajax({ 
			        url: "getAllRoles", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        //data: {productids:productids,level:configLevel},
			        success: function (data) { 
			        	for (i = 0; i < data.length; i++){			        		
			        			$("[name='roleId']").append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
			        	}
			        },
			        error:function(data){	
			        	alert("ajax请求失败!");	
			        }
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
		  
	</script>
</html>