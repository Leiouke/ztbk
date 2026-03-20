<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">

	</head>
	<body>
		<div class="sonpage-body">
			<form id="form" class="form-inline">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content" style="padding-bottom:0px"> 
			            <input type="hidden" name="memo">
			            	<div class="form-group inline-small not-null">
							    <label >入库库房：</label>
							    <select id="inventory" name="inventory" class="form-control dictionary search-items" >
							    </select>
							</div>	 
		            </div>
       		</div>
       		<div class="ibox float-e-margins">	            
	            <div class="ibox-content ibox-content-table ">
	            	<div class="row row-lg form-inline">
		            	<div class="col-sm-12">
		            		<div class="form-group inline-middle ">
							    <label><button class="btn btn-info btn-sm show_label" type="button">期刊号\条码号\刊名模糊:</button></label>
							    <input style="margin-left: 20px;height:30px;text-align: left;font-size: 15px;" type="text" id="key_word" name="key_word" class="form-control search-items verify-input" value="">
							</div>							 
							<div class="form-group inline-small not-null">
						    	<label>数量：</label>
							    <input type="text" name="amount" class="form-control search-items" value="1"/>
							</div>
							<input type="hidden" name="qk_id">
							<input type="hidden" name="period_name">
							<input type="hidden" name="rack_no">
						</div>
	            	</div>
	                <div class="row row-lg">                    
	                    <div class="col-sm-12">
	                        <div class="btn-group hidden-xs" id="tableTool" role="group">   
	                            <button type="button" class="btn btn-outline btn-default" id="config">
	                                <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
	                            </button>
	                            <select class="form-control" >
	                           		<option value="all">导出全部</option>
					                <option value="basic">导出当页</option>	
					            </select>
	                        </div>
	                        <table id="table" data-mobile-responsive="true">
	                            
	                        </table>
	                    </div>
	                </div>
	            </div>
        </div>       			
		</div>
		</form>
	</div>
	
	<div class="sonpage-footer">
        <button id="commit" class="btn btn-success" type="button">完成</button>
        <button id="cancel" class="btn btn-white" type="button">取消</button>
	</div>
	<div class="col-md-12" id="memo_div" style="display:none">
	   <form id="memo_form" class="form-inline">
              <div class="panel-body">
                         <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >备注：</label>
		                  		<textarea rows="3" id="memo"></textarea>
		                	</div>
		                	<div class="form-group small-space col-xs-12 print-layer-button">
		                  		<button id="memo_commit" class="btn btn-success" type="button">确认</button>
		                	</div>		                	
					    </div>                        
                </div>
       </form>
	 </div>
	</body>
	<!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj_inbound = {};
		json_obj_inbound['limit'] =param.limit;
		json_obj_inbound['offset'] =param.offset;
		json_obj_inbound['sortName'] =this.sortName;
		json_obj_inbound['sortOrder'] =this.sortOrder;
	    return json_obj_inbound;
	}
	
	function toDel(id,bd_id,inv_id,item_code){
		ajax_function_ask_and_dosuccess("是否删除","deleteBackIssueInBoundItemVerify","post",{'ids':id},load_table_data_success);
	}
	 
	function renderOperator(value,row,index){
		return "<a onclick=\"toDel('"+row.id+"')\">删除</a>";
	}
	 
	function form_data_params(){
		 var json_obj=formToJson($("#form"));
		 json_obj["key_word"]=$("input[name='key_word']").val();
	     return json_obj;
	}
	 
	function load_table_data_success(data){
		if (data.success){    		
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','o_id_exam':'${o_id_exam}'},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','o_id_exam':'${o_id_exam}'},$table);
    }
	
	var $table = $('#table');
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','o_id_exam':'${o_id_exam}'});
	var memo_layer_index;
	$(document).ready(function () {
			$('#memo_commit').on('click', function () {
				$("input[name='memo']").val($("#memo").val());
				var ids = $.map($table.bootstrapTable('getData'), function (row) {
	                return row.id;
				});
				if(ids.length!=0)
					ajax_function_ask_and_close("确认入库验货完成？","addBackIssueInBound","post",$('#form').serialize(),'过刊入库单完成！');
				else
					layer.msg("本次没有验货记录！");
			});
			
			$('#commit').on('click', function () {
				memo_layer_index=open_layer(1,"入库单完成",$('#memo_div'),['360px', '280px'],false);
			});
			
			//回车触发事件
			$('.verify-input').keydown(function(e){
				if(e.keyCode ==13){					
					var form_obj=form_data_params();
					if(form_obj.key_word == ""){
						layer.msg("未输入关键字！");
						return;
					}
					$(this).select();
					$.ajax({ 
				        url: 'verifyBackIssueInBound', 
				        method: 'post',
				        dataType: "json",
				        traditional:true,
				        //传送请求数据
				        data: form_obj,
				        success: function (data) { 
				        	if (data.success){
				        		var result=data.result;
				        		if(result==0){
				        			layer.msg("没有找到该期刊！");
				        		}else if(result==1){  // 直接验入此期刊
				        			verify_success_function(data);
				        		}else if(result==2){	
				        			open_layer_end(2,'选择对应期刊明细验入','backIssueInBoundConfirm',['620px', '580px'],true,end_function);
				        		}		        		
				        	} else {
				        		alert(data.errorMsg);
				        	}
				        },
				        error:function(data){	
				        	alert("请求失败!");	
				        }
				    });
				    //$("#submit").trigger("click");
				  }
			});
			
			// 单条期刊验入
			function verify_success_function(data) {
				var now_num=Number($("input[name='amount']").val());
				
				if(isNaN(now_num)||now_num<1){
					layer.msg("数量不符合规范");
					return;
				}
				
				$("input[name='qk_id']").val(data.qk_id);
				$("input[name='period_name']").val(data.period_name);
				$("input[name='rack_no']").val(data.rack_no);
				
				if(!has_null($("#form"))){
					ajax_function_refresh("confirmBackIssueInBound","post",$('#form').serialize(),'验货成功',$table);
				}
			}
			
			$('.verify-input').each(function(){
				$(this).on('focus',function(){
					$(this).select();
				});
			});
			$('.verify-input').each(function(){
				$(this).on('click',function(){
					$(this).select();
				});
			});

			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"getBackIssueInBoundAddList",${tableHeader},queryParams,"#tableTool",550);
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
		});	
	</script>
</html>