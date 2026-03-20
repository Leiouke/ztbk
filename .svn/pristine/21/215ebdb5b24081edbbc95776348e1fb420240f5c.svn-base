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
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <input type="hidden" name="inv_id">
			            <div class="col-xs-12">
			            <div class="row">
							  <div class="form-group input-group inline-middle not-null">
							    <label >货源编号：</label>
							    <input type="text" name="f_id" class="form-control search-items" >
							    <div class="input-group-btn">
                                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                            </ul>
                                 </div>
							  </div>
							  <div class="form-group inline-large">
							    <label >货源名称(_户号)：</label>
							    <input type="text" name="f_name" class="form-control search-items" disabled>
							  </div>
							  <div class="form-group inline-small">
							  	<input type="hidden" name="is_red" value="1">
							  </div>
						</div>
						<div class="row">
							  <div class="form-group inline-small">
							    <label >发票号：</label>
							    <input id="inv_no" type="text" name="inv_no" class="form-control search-items">
							  </div>
							  <div class="form-group inline-small">
							    <label >发票类型：</label>
							    <select name="invoice_class" class="form-control dictionary search-items" >
							    	<option></option>
							    </select>
							  </div>
							  <div class="form-group inline-small not-null">
							    <label >发票日期：</label>
							    <input type="text" class="form-control  layer-date search-items date-type"  name="inv_date" id="inv_date">
							  </div>
							  <div class="form-group inline-small">
							    <label >发票类别：</label>
							    <select name="invoice_family" class="form-control dictionary search-items" >
							    </select>
							  </div>
						</div>
						<div class="row">
							  <div class="form-group inline-small">
							    <label >发票总金额：</label>
							    <select name="currency" class="form-control dictionary search-items" >
							    	<option></option>
							    </select>
							    <input type="text" name="total_money" class="form-control search-items">
							  </div>
							  <div class="form-group inline-small">
							    <label >运费金额：</label>
							    <input type="text" name="fee_traffic" class="form-control search-items">
							  </div>							  
							  <!-- <div class="form-group inline-small">
							    <label >手续费金额：</label>
							    <input type="text" name="fee_handling" class="form-control search-items">							    
							  </div> -->
							  <div class="form-group inline-large">
							    <label >备注：</label>
							    <input type="text" name="memo" class="form-control search-items">
							  </div>							  
						</div>
						<!-- <div class="row">
							  
						</div>	 -->				  
						</div>
						</form>
		            </div>
		            
		    	<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>发票明细</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="ibox-content ibox-content-table">
	                <div class="row row-lg">                    
	                    <div class="col-sm-12">
	                        <div class="btn-group hidden-xs" id="tableTool" role="group">
	                            <button type="button" class="btn btn-outline btn-default" id="add">
	                               <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
	                            </button>
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
		</div>
	</div>
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">保存</button>
	    <button id="delete_invoice" class="btn btn-danger" type="button">作废</button>
	    <button id="cancel" class="btn btn-white" type="button">取消</button>
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
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		var $table = $('#table');
		
		function queryParams(param) {
			var json_obj_invoice = {};
			json_obj_invoice['limit'] =param.limit;
			json_obj_invoice['offset'] =param.offset;
			json_obj_invoice['sortName'] =this.sortName;
			json_obj_invoice['sortOrder'] =this.sortOrder;
		    return json_obj_invoice;
		}
		
		function toDel(cw_type){
			ajax_function_ask_and_refresh("确认删除？","deleteInvoiceCwItem","post",{'cw_type':cw_type},"删除成功！",$table);
		}
		
		function renderOperator(value,row,index){
		 	//console.log(row);
			return "<a onclick=\"toDel('"+row.cw_type+"')\">删除</a>";
		}
		
		$(document).ready(function () {
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			})
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					if($("input[name='total_money']").val()>0){
						layer.msg("发票金额不能为正！");
						return;
					}
					if($("input[name='f_id']").attr("data-id")==""){
						layer.msg("货源编号不正确");
					}else{
						ajax_function("editInvoice","post",$('#form').serialize(),'保存成功');
					}
				}
			 });			 
			var str_invoice='${oneJson}';	
			str_invoice=str_invoice.replace(/\r\n/g,"\\r\\n");
			str_invoice=str_invoice.replace(/\n/g,"\\n");
			str_invoice=str_invoice.replace(/\s/g," ");
			var invoice=JSON.parse(str_invoice);
			//加载字典数据
			get_dictionary("${context}",invoice);
			$("input[name='f_name']").val(invoice['f_department']+"_"+invoice['f_account']);
			//填写已有数据
			set_one_info($("#form"),invoice);
			if(invoice.status!=0){
				$("#save").hide();
				$("#delete_invoice").hide();	
				
				$(".search-items").each(function(){
					$(this).attr("disabled",true);
				});
			}
			$('#delete_invoice').on('click',function(){
				 ajax_function_ask_and_close("确认删除？","deleteInvoiceDh","post",{inv_id:invoice.inv_id},'删除成功');
			});
			
			initialize_table($table,"getInvoiceAddItemList",${tableHeader},queryParams,"#tableTool",550);
			
			//自动搜索填补
			initialize_bsSuggest_all_type_factory("${context}");
			//发票号修改
			$("#inv_no").on('change',function(){
				ajax_function_dosuccess("hasInviceNo","post",{"inv_no":$(this).val(),"inv_id":invoice.inv_id},inv_no_success_fuction);
			});
			
			//增加条目layer
			var $add=$("#add");
			button_click_windows_refresh($add,2,"新增财务明细",'invoiceCwItemAdd',$table,false);
		});
		
		function inv_no_success_fuction(data) {
	    	if (data.success){
	    		console.log("无发票号");
	    	} else {
	    		alert("发票号有重复");
	    	}	        	
	    }
		
		$(document).ready(function () {
			$(".ibox-content-table").on("change",".input_item_money",function(){
				 if(isNaN($(this).val())){
					  layer.msg("必须输入数字!");
					  $table.bootstrapTable('refresh');
					  return;
				 }else if(Number($(this).val())>=0){
					 layer.msg("必须输入小于0!");
					 $table.bootstrapTable('refresh');
					 return;
				 }		 
				 
				 var cw_type = $.trim($(this).data('cw_type'));
				 ajax_function_refresh("updateInvoiceCwItem","post",{"cw_type":cw_type, "item_money": Number($(this).val()) },'修改成功',$table);
			 });
		})
		
		function renderItemMoney(value, row, index) {
			if (!value) {
				value = 0;
			}
			return "<input type='text' class='"+row.cw_type+" input_item_money' data-cw_type='"+row.cw_type
						+ "' data-item-index='"+index+"' value='"+value+"'> ";
		}
	</script>
</html>