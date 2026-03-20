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
	<div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">
                            <h3>字典目录-${param.directoryName}</h3>
                            <ul class="folder-list dictionaryMenu" style="padding: 0">
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                <div class="row">
                    <div class="col-sm-12">
                        <div >
                            <div class="example">
                                <div class="btn-group hidden-xs" id="tableTool" role="group">
                                    <button type="button" class="btn btn-outline btn-default" id="add">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default" id="delete">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <table id="table" data-height="400" data-mobile-responsive="true">
                                    
                                </table>
                            </div>
                        </div>                        
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script> 
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
		var $table = $('#table'),
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
	                title:'编辑字典',
	                area: ['620px', '580px'],
	                skin: 'layui-layer-rim', //加上边框
	                content: 'system/dictionaryEdit?id='+Id,
	                end:function () {
	                	$('#table').bootstrapTable('refresh');
	                }
	            }); 
		}
		function del(Id){
			$.ajax({ 
		        url: "deleteDictionary", 
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
		 $(document).ready(function () {
			 
			 $.ajax({ 
			        url: "getAllDirectory", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        //data: {productids:productids,level:configLevel},
			        success: function (data) { 
			        	for (i = 0; i < data.length; i++){
			        		$(".dictionaryMenu").append("<li><a href=\"dictionaryManage?directoryId="+data[i].id+"&directoryName="+data[i].name+"\"><i class=\"fa fa-folder\"></i>"+data[i].name+"</a></li>");
			        	}
			        },
			        error:function(data){	
			        	alert("ajax请求失败!");	
			        }
			    });
			 $('#table').bootstrapTable({
			      url: "getDictionaryList?directoryId=${param.directoryId}",
			      search: true,
			      method:'post',
			      pagination: false,
			      showRefresh: true,
			      showColumns: true,
			      showExport:true,
			      //sidePagination : "server", // 服务端处理分页 
			      iconSize: 'outline',
			      toolbar: '#tableTool',
			      queryParams: function (param) {
			    		var temp = {   
			    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			    	            //limit: param.limit,   //页面大小
			    	            //offset: param.offset,  //页码
			    		    //我们吧#txt_search_departmentname里面的值以departmentname传到后台
			    	           	//account: $("#textAccount").val(),
			    				//userName: $("#textUserName").val(),
			    				account:param.search
			    	        };
			    	        return temp;
			    	},
			      columns: [{title: '名称',field: 'name',align: 'center',valign: 'middle',editable:true},
			                {title: '代码',field: 'code',align: 'center',editable:true},
			                {title: '排序号',field: 'sortNo',align: 'center',editable:true},
			                {title: '是否启用',field: 'status',align: 'center',
			                 editable: {
				                   type: 'select',
				                   title: '是否启用',
				                   source:[{value:"1",text:"是"},{value:"0",text:"否"}]
				             }
			                },
			                {title: '备注',field: 'remark',align: 'center',editable:true},
			                {
			                    title: '操作',
			                    field: 'id',
			                    align: 'center',
			                    formatter:function(value,row,index){
			      		                 var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">编辑</a> ';  
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
		                    url: "editDictionary",
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
		            }
			    });
			 $('#add').on('click', function () {
				  parent.layer.open({
		                type: 2,
		                title:'新增字典',
		                area: ['620px', '580px'],
		                skin: 'layui-layer-rim', //加上边框
		                content: 'system/dictionaryAdd?directoryId=${param.directoryId}',
		                end:function () {
		                	$('#table').bootstrapTable('refresh');
		                }
		            }); 				
			 });
	     });
		  
	</script>
</html>