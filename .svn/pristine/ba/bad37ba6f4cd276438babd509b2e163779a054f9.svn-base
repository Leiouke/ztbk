<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <style type="text/css">
	    .col_form{
	    margin-right:0px!important;
	    margin-left:0px!important;
	    margin-bottom:10px!important;
	    }
	    .col_form input{
	    margin-left:10px;
	    }
	    </style>
	</head>
	<body>
		<div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询项目选择</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
            		<form id="form" action="../udi/commitData" method="post" >
	                <div class="col-sm-6 form-horizontal">
	                	<div class="row">
	                			<div class="form-group">
	                                <label class="col-sm-3 control-label">项目名：</label>
	                                <div class="col-sm-9">
	                                    <select class="form-control" name="itemId" id="exchangeitems">
	                                    	<option value="0"></option>
	                                    </select>
	                                    
	                                </div>
	                            </div>	                            
	                            	<input type="hidden" id="chosse_item_id" name="itemId" value="0"/>
									<input type="hidden" id="chosse_queryId" name="queryId" value=""/>
									<input type="hidden" id="guid" name="up_guid" value=""/>
							        <div class="form-group">
							                <label class="col-sm-3 control-label">填写列位置：</label>
							                <div class="col-sm-9 form-inline col_form_box">
							                </div>
							        </div>
							    	<div class="form-group" >
											      <div class="col-sm-offset-3 col-sm-9">
										                   <button class="btn btn-primary" type="submit" onClick="return check()">匹配</button>
									              </div>
									</div>
						         
						</div>
	                 </div>
	                 </form>
	                 <div class="col-sm-6 form-horizontal">
	                 	<div class="row">                    
			                <div class="col-sm-12 form-horizontal">			   		
							        <div class="form-group">
							                  <label class="col-sm-3 control-label">文件：</label>
							                  <div class="col-sm-9">
							                        <input type="file" id="excel" name="excel" class="form-control">				                        
							                        <!-- <input type="hidden" name="itemId" value="1"/>  交换项id
							                        <input type="hidden" name="queryId" value="2000001"/>  查询id
							                        
							                        <input type="hidden" name="field" value="13ISBN"/>  交换项 列
							                        <input type="hidden" name="index" value="4"/> 交换项 列对应的excel列 -->
							                        
							                        <!-- <input type="hidden" name="field" value="13ISBN1"/> 
							                        <input type="hidden" name="index" value="3"/>  -->
							                  </div>
							       </div>
							        <div class="form-group" >
								                 <div class="col-sm-offset-3 col-sm-9">
							                     <button id="upload" class="btn btn-primary" type="button">上传文件</button>
						                     	 </div>
						            </div>					      			
			               </div>
			           	</div>
	                 </div>
	          </div>
        </div>
	    <div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>结果</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="ibox-content">
	                <div class="row row-lg">                    
	                    <div class="col-sm-12">
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
	</body>
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
   <!-- ajaxfileupload-->
	<script src="${context}/js/plugins/ajaxfileupload/ajaxfileupload.js"></script>
    <!-- Layer-->
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- 通用查询grid 列渲染函数库 -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
	<!-- 自定义js -->
	<script src="${context}/js/content.js?v=1.0.0"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#table').bootstrapTable({
			      url: "getResultList",
			      //search: true,
			      method:'post',
			      pagination: true,
			      showRefresh: true,
			      showColumns: true,
			      showExport:true,
			      exportDataType: 'all',  // 导出数据为全部导出模式
			      sidePagination : "server", // 服务端处理分页 
			      iconSize: 'outline',
			      toolbar: '#tableTool',
			      queryParams: function (param) {
			    		var temp = {   
			    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
			    	            limit: param.limit,   //页面大小
			    	            offset: param.offset,  //页码
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
		                content: 'csu/columnConfig?queryId=${queryId}',
		                end:function () {
		                	location.reload();
		                }
		            }); upload				
			 });
			 $.ajax({ 
			        url: "getExchangeItems", 
			        method: "post",
			        dataType: "json",
			        success: function (data) {
			        	for (i = 0; i < data.length; i++){
			        		var item="<option value='"+data[i].id+"' data-queryid="+data[i].queryId+">"+data[i].name+"</option>";
			        		$("#exchangeitems").append(item);
			        	}
			        },
			        error:function(data){	
			        	alert("ajax请求失败!");	
			        }
			});
			 $("#exchangeitems").change(function () {
				 $("#chosse_item_id").val($(this).val());
				 $("#chosse_queryId").val($(this).find("option:selected").data("queryid"));
				 $.ajax({ 
				        url: "getExchangeColumnByItem", 
				        method: "post",
				        dataType: "json",
				        data:{"itemId":$("#chosse_item_id").val()},
				        success: function (data) {
				        	$(".col_form_box").empty();
				        	for (i = 0; i < data.length; i++){
				        		var item="<div class=\"form-group col_form\">"+
							    "<label >"+data[i].name+"</label>"+
							    "<input type=\"number\" style=\"width:60px\"class=\"form-control\" name='index'>"+
							    "<input type=\"hidden\" name='field' value="+data[i].field+">"+
							  "</div>";
				        		$(".col_form_box").append(item);
				        	}
				        },
				        error:function(data){	
				        	alert("ajax请求失败!");
				        }
				});
			 });
			 //上传Excel文件
			 $('#upload').on('click', function () {
				 $.ajaxFileUpload({ 
						url:'uploadExcel',			  
				        secureuri:false,
				        method:'post',
				        fileElementId:'excel',	//与页面处理代码中file相对应的ID值
				        dataType: 'json',		//返回数据类型:text，xml，json，html,scritp,jsonp五种
				        success: function (returnData){
							   if(returnData.success==false){ 
								   alert("文件不能为空");
							  }else{
								  $("#guid").val(returnData.guid);
								  $('#table').bootstrapTable('refreshOptions',{
									  url: 'getExcelData',
									  columns:[{title: '列1',field: 'c1',align: 'center'},
										  		{title: '列2',field: 'c2',align: 'center'},
							                {title: '列3',field: 'c3',align: 'center'},
							                {title: '列4',field: 'c4',align: 'center'},
							                {title: '列5',field: 'c5',align: 'center'},
							                {title: '列6',field: 'c6',align: 'center'},
							                {title: '列7',field: 'c7',align: 'center'},
							                {title: '列8',field: 'c8',align: 'center'},
							                {title: '列9',field: 'c9',align: 'center'},
							                {title: '列10',field: 'c10',align: 'center'},
							                {title: '列11',field: 'c11',align: 'center'},
							                {title: '列12',field: 'c12',align: 'center'},
							                {title: '列13',field: 'c13',align: 'center'},
							                {title: '列14',field: 'c14',align: 'center'},
							                {title: '列15',field: 'c15',align: 'center'},
							                {title: '列16',field: 'c16',align: 'center'},
							                {title: '列17',field: 'c17',align: 'center'},
							                {title: '列18',field: 'c18',align: 'center'}],
									  queryParams: function (param) {
								    		var temp = {   
								    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
								    	            limit: param.limit,   //页面大小
								    	            offset: param.offset,  //页码
								    	            guid:returnData.guid
								    	        };
								    	        return temp;
								    	}
									  });
								  $('#table').bootstrapTable('refresh');
							  }				
				        },
				        error: function (data,status,e){	
				        	alert("数据有误");	
				        }
				});		
			 });
	    });
		//匹配前数据完整性验证
		function check(){
			var tag=true;
			$("input").each(function(){
				if($(this).val()==""){
					alert("数据填写完整");
					tag=false;
				}
			});
			return tag;
			//return true;
			//return false;
		        //return true;//不写此返回值也行，此时就直接提交了
		}
	</script>
</html>