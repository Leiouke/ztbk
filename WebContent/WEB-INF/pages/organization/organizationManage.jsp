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
                <h5>组织架构</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>    
                </div>
            </div>
            <div class="ibox-content">
            	<div class=" col-sm-4">
            	    <input type="hidden" id="editId" value='0'/>
            		<!-- <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                      <button type="button" class="btn btn-outline btn-default" id="add">
                               <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                      </button>
                      <button type="button" class="btn btn-outline btn-default" id="edit">
                               <i class="glyphicon glyphicon-edit" aria-hidden="true"></i>
                      </button>
                      <button type="button" class="btn btn-outline btn-default" id="delete">
                               <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                       </button>
                	</div> -->
                    <div id="treeview" class="test" style="margin-top:5px"></div>
                </div>
                <div id="form" class="col-sm-8">
                	<div class="row">
                           	<div class="form-group large-space col-xs-6 not-null">
		                  		<label >组织名称：</label>
		                        <input type="text" name="plain_org_name" > 
		                	</div>
		                	<div class="form-group large-space col-xs-6">
		                  		<label >负责人：</label>
		                        <input type="text" name="org_head" > 
		                	</div>
					</div>
					<div class="row">
							<div class="form-group large-space col-xs-6 not-null">
		                  		<label >组织类型：</label>
		                        <input type="text" name="org_type_name" > 
		                	</div>                           			                	
					</div>
					<div class="row">
							<div class="form-group large-space col-xs-6 not-null">
		                  		<label >部门分管领导：</label>
		                        <input type="text" name="charge_job_name" /> 
		                	</div>
		                	<div class="form-group large-space col-xs-6">
		                  		<label >上级组织：</label>
		                        <input type="text" name="parent_code_name" > 
		                	</div>
					</div>
					<div class="row">
							<div class="form-group large-space col-xs-6 not-null">
		                  		<label >部门财务人员：</label>
		                        <input type="text" name="finance_job_name" /> 
		                	</div>
                           	<div class="form-group large-space col-xs-6 not-null">
		                  		<label >排序号：</label>
		                        <input type="text" name="sort_number" >
		                	</div>		                	
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
			var date_list=[];
			$.ajax({ 
		        url: "getOrganizationList", 
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
			console.log(my_data);
			for (i = 0; i < my_data.length; i++){
        		if(my_data[i]['parent_code']==0){
        			var parent_node={};
        			parent_node['text']=my_data[i]['plain_org_name'];
        			parent_node['id']=my_data[i]['id'];
        			parent_node['org_code']=my_data[i]['org_code'];
        			parent_node['nodes']=[];
        			for(j = 0; j < my_data.length; j++){
        				var child_node={};
        				if(my_data[j]['parent_code']==parent_node['org_code']){
        					child_node['text']=my_data[j]['plain_org_name'];
        					child_node['id']=my_data[j]['id'];
        					child_node['org_code']=my_data[j]['org_code'];
        					child_node['nodes']=[];
        					for(k = 0; k < my_data.length; k++){
            					var grandson_node={};
                				if(my_data[k]['parent_code']==child_node['org_code']){
                					grandson_node['text']=my_data[k]['plain_org_name'];
                					grandson_node['id']=my_data[k]['id'];
                					grandson_node['org_code']=my_data[k]['org_code'];
                					child_node['nodes'].push(grandson_node);
                				}
            				}
            				if(child_node['nodes'].length==0)
                				delete child_node['nodes'];
            				parent_node['nodes'].push(child_node);
        				}        				
        			}
        			if(parent_node['nodes'].length==0)
        				delete parent_node['nodes'];
        			date_list.push(parent_node);
        		}
        	}
			//console.log(date_list);
			return date_list;
		}
		function loadTree(){
			$('#treeview').treeview({			    
				data: getTree(),
				levels: 1,
				onNodeSelected: function (event, node) {
					$("#editId").val(node.org_code);   
					$.ajax({ 
				        url: "getOrganizationManageList", 
				        method: "post",
				        dataType: "json",
				        traditional:true,
				        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
				        //传送请求数据
				        data: JSON.stringify({'org_code':node.org_code}),
				        success: function (data) {
				        	console.log(data);
				        	if(data.rows.length>0){
				        		set_one_info($("#form"),data.rows[0]);
				        		//alert(data.rows);
				        	}
				        },
				        error:function(data){	
				        	console.log("请求失败!");	
				        }
				    });
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
		                title:'新增组织',
		                area: ['750px', '430px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'organization/organizationAdd?org_code='+$("#editId").val(),
		                end:function () {
		                	loadTree();
		                }
		            }); 				
			 });
			 $('#edit').on('click', function () {
				 if($("#editId").val()!=0){
				  parent.layer.open({
		                type: 2,
		                title:'编辑组织',
		                area: ['750px', '430px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'organization/organizationEdit?org_code='+$("#editId").val(),
		                end:function () {
		                	loadTree();
		                }
		            });
				 }else{
					 layer.msg('先选择组织');
				 }
			 });
			 $('#delete').on('click', function () {
				 if($("#editId").val()!=0){
					 if(confirm("确认删除？")){
						 $.ajax({ 
						        url: "deleteOrganization", 
						        method: "post",
						        dataType: "json",
						        traditional:true,
						        //传送请求数据
						        data: {'org_code':$("#editId").val()},
						        success: function (data) { 
						        	if (data.success){						        		
						        		layer.msg(success_info);        		
						        		loadTree();
						        	} else {
						        		layer.msg(data.errorMsg);
						        		layer.close(index);
						        	}						        	
						        },
						        error:function(data){	
						        	alert("请求失败!");	
						        }
						  });
					 }					 
				 }else{
					 layer.msg('删除成功');
				 }
			 });
	     });
	</script>
</html>