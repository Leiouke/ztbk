<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	   	<link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <style type="text/css">
	    textarea{outline:none;resize:none;
	    }
	    .noborder{
	    border:0px
	    }
	    </style>
	</head>
	<body>
		<div style="padding:20px;">
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
				            <input type="hidden" name="status" value=0>
				            <div class="col-xs-11">	
								  <div class="form-group inline-small">
								    <label >员工：</label>
								    <input type="text" name="userName" class="form-control search-items" >
								  </div>					  
								  <div class="form-group inline-small">
								    <label >角色：</label>
								    <select name="roleId" class="form-control dictionary search-items">
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
			<div class="col-md-12">
			   <form id="form" class="form-horizontal">
			   <input type="hidden" name="messageType" value="消息">
			   <input type="hidden" name="receivers" value="">
			        <div class="ibox float-e-margins">
			            <div class="ibox-title">
			                <h5>发送给：</h5>
			                <div class="ibox-tools">
			                    <a class="collapse-link">
			                        <i class="fa fa-chevron-up"></i>
			                    </a>
			                </div>
			            </div>
			            
			            <div class="ibox-content">
			            	<table class="table table-bordered userlist">
                            <thead>
                                
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
			            
			            </div>
			        </div>
			         <div class="form-group">
					    <div class="input-group">
					      <div class="input-group-addon noborder">消息：</div>
					      <div>						      
						    
							<textarea rows="6" cols="70" name="content" ></textarea>
						  </div>
					    </div>
					</div>
			        <div class="form-group" >
		                 <div>
		                     <button id="save" class="btn btn-primary" type="button">发送</button>
		                     <button id="cancel" class="btn btn-white" type="button">取消</button>
                     	 </div>
		            </div>
		       </form>
			 </div>
		</div>
	</body>
    <!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			$("#search").on('click',function(){
				$("table tbody").empty();
				createTable();
			 });
			createTable();
			$('#save').on('click', function () {
				var receivers="";
				$(".receiver:input[type='checkbox']:checked").each(function(){
					receivers+=$(this).val()+",";
				});
				receivers=receivers.substring(0,receivers.length-1);
				$("input[name='receivers']").val(receivers);
				$.ajax({ 
			        url: "sendNotice", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        data: $('#form').serialize(),
			        success: function (data) { 
			        	layer.msg('发布成功');
			        	setTimeout(function (){
			        		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		                    parent.layer.close(index);//something you want delayed
			        	   }, 1000); // how long do you want the delay to be? 
			        },
			        error:function(data){	
			        	alert("请求失败!");
			        }
			    });	
			 });
			$('#cancel').on('click', function () {
				var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                parent.layer.close(index);
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
		});
		function createTable(){
			$.ajax({ 
		        url: "getAllUser", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        async: false,
		        //传送请求数据
		        data: $('#form_search').serialize(),
		        success: function (data) {
		        	for (i = 0; i < data.length; i+=4){
		        		var item="<tr><td><input type=\"checkbox\" class='receiver'  value=\""+data[i].account+"\" />"+data[i].account + '_' +data[i].job_no+"</td>";
		        		if(i+1<data.length){
		        			item+="<td><input type=\"checkbox\" class='receiver' value=\""+data[i+1].account+"\" />"+data[i+1].account + '_' +data[i+1].job_no+"</td>";
		        		}
		        		if(i+2<data.length){
		        			item+="<td><input type=\"checkbox\" class='receiver' value=\""+data[i+2].account+"\" />"+data[i+2].account + '_' +data[i+2].job_no+"</td>";
		        		}
		        		if(i+3<data.length){
		        			item+="<td><input type=\"checkbox\" class='receiver' value=\""+data[i+3].account+"\" />"+data[i+3].account + '_' +data[i+3].job_no+"</td>";
		        		}
		        		item+="</tr>";
		        		$(".userlist tbody").append(item);
		        	};
					
		        	$(".userlist tbody").append("<tr><td><input type=\"checkbox\" id=\"allcheck\" onClick=\"allCheckClick()\">全选</td>");
		        },
		        error:function(data){	
		        	alert("ajax请求失败!");	
		        }
			});	
		}
		function allCheckClick(){
			 var checked=$("#allcheck").prop('checked');
			 $("input:checkbox").each(function(){
				 $(this).prop('checked',checked);
			 });
		 }
	</script>
</html>