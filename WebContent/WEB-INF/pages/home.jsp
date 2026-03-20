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
	    <jsp:include page="include/h_superHead.jsp"></jsp:include>		
	</head>
	<style type="text/css">
	    .table-striped tr td:last-child{
	    text-align:right;
	    }
	    .content{
	        text-overflow: ellipsis;
		    white-space: nowrap;
		    overflow: hidden;
		    max-width: 350px;
	    }
	    .right-top-padding{
		    background: red;
		   	padding: 0 10px;
		   	border-radius: 10px;
			position: absolute;
		   	top: -9px;
		   	left: 46px;
		   	font-size: 12px;
    		color: white;
	    }
	    </style>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                                <h5>快捷入口</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-wrench"></i>
                                    </a>
                                </div>
                            </div>
                    <div class="ibox-content" style="display:none">
                        <form id="menu_list_form">
						<input type="hidden" name="tableId" value="${param.wariningId}"/>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan=3>快捷菜单列表<button id="save" class="btn btn-primary" type="button" style="float:right;padding: 1px;">保存内容</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </form>
                    </div>
                    <div class="ibox-content quick_menu">  
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4 style="float:left">任务提醒</h4>
                        <div style="float:right;margin-top:5px"> 
                        		 <a href="#" id="refresh_echart_info">刷新</a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div id="main" style="width: 500px;height:363px;"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4 style="float:left">公告</h4>
                        <div style="float:right;margin-top:5px"> 
                             <a target="_blank" id="notice_add">发布</a>
                      		 <a href="system/noticeManage" target="_blank" >更多</a>
                       	</div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped">
                            <tbody class="notice">
                                                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h4 style="float:left">消息</h4>
                        <div style="float:right;margin-top:5px"> 
                        		 <a target="_blank" id="dialog_add">发送</a>
                        		 <a href="system/dialogManage" target="_blank" >更多</a></div>
                    	</div>
                    <div class="ibox-content">
                        <table class="table table-striped">
                                <tbody class="dialog">
                                                                    
                                </tbody>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 通用js -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
 	<!-- echart-js -->
	<script src="${context}/js/plugins/echarts/echarts-3.0.js"></script>

    <!-- layer -->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		// 基于准备好的dom，初始化echarts实例
	    var myChart = echarts.init(document.getElementById('main'));
	    myChart.setOption({
	        tooltip: {},
	        legend: {
	        	show:false
	        },
	        grid:{
	        	top:'8%',
	        	left:'8%'
	        },
	        xAxis: { type : 'value'	            
	        },
	        yAxis: {data: ["任务"]},
	        label: {
                normal: {
                    show: true,
                    position: 'right'
                }
            },
	    });
	    //echart点击事件绑定
	    myChart.on('click', function (params) {
	        window.open('system/toDetail?queryId=' + encodeURIComponent(params.data.name));
	    });
	    //获得预警列表，渲染图表
		$.ajax({ 
	        url: "system/getWarningList", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        //data: {productids:productids,level:configLevel},
	        success: function (data) {
	        	// 指定图表的配置项和数据
			    var x_name=[];
	        	var x_value=[];
	        	for (i = 0; i < data.length; i++){
	        		x_name.push(data[i].description);
	        		var item={name:data[i].description,type:'bar',data:[{value:data[i].count,name:data[i].queryId}],barWidth:'12'};
	        		x_value.push(item);
	        	};
	        	
	        	myChart.setOption({
	        		 legend: {
	        			data:x_name
	    	        },
			        series: x_value
			    });
	        },
	        error:function(data){
	        	console.log("ajax请求失败!");
	        }
		});
	    
	    //刷新预警
		$('#refresh_echart_info').on('click', function () {
			$.ajax({ 
		        url: "system/refreshControl", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        success: function (data) {
		    		$.ajax({ 
		    	        url: "system/getWarningList", 
		    	        method: "post",
		    	        dataType: "json",
		    	        traditional:true,
		    	        //传送请求数据
		    	        success: function (data) {
		    	        	// 指定图表的配置项和数据
		    			    var x_name=[];
		    	        	var x_value=[];
		    	        	for (i = 0; i < data.length; i++) {
		    	        		x_name.push(data[i].description);
		    	        		var item={name:data[i].description,type:'bar',data:[{value:data[i].count,name:data[i].queryId}],barWidth:'12'};
		    	        		x_value.push(item);
		    	        	};
		    	        	
		    	        	myChart.setOption({
		    	        		 legend: {
		    	        			data:x_name
		    	    	        },
		    			        series: x_value
		    			    });
		    	        },
		    	        error:function(data){
		    	        	console.log("ajax请求失败!");
		    	        }
		    		});
		        },
		        error:function(data){
		        	console.log("ajax请求失败!");
		        }
			});
		});
	    
	    //获得用户所有已经配置的快捷入口
		$.ajax({ 
	        url: "system/getCanConfigMenus", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        //data: {productids:productids,level:configLevel},childMenu
	        success: function (data) {
	        	for(i = 0; i < data.length; i++){
	        		if(data[i].childMenu != null && data[i].childMenu.length>0){
	        			var item="<tr ><td colspan='3'>"+data[i].name+"</td></tr>"
	        			$("#menu_list_form table tbody").append(item);
	        			for (k = 0; k < data[i].childMenu.length; k+=3){
	    	        		var item="<tr><td><input type=\"checkbox\" name=\"menuIds\" value=\""+data[i].childMenu[k].id+"\" />"+data[i].childMenu[k].name+"</td>";
	    	        		if(k+1<data[i].childMenu.length){
	    	        			item+="<td><input type=\"checkbox\" name=\"menuIds\" value=\""+data[i].childMenu[k+1].id+"\" />"+data[i].childMenu[k+1].name+"</td>";
	    	        		}
	    	        		if(k+2<data[i].childMenu.length){
	    	        			item+="<td><input type=\"checkbox\" name=\"menuIds\" value=\""+data[i].childMenu[k+2].id+"\" />"+data[i].childMenu[k+2].name+"</td>";
	    	        		}
	    	        		item+="</tr>";
	    	        		$("#menu_list_form table tbody").append(item);
	    	        	};
	        		}else{
	        			var item="<tr ><td colspan='3'><input type=\"checkbox\" name=\"menuIds\" value=\""+data[i].id+"\" />"+data[i].name+"</td></tr>"
	        			$("#menu_list_form table tbody").append(item);
	        		}
	        	}
	        	
	        	
	        	$.ajax({ 
			        url: "system/getShortcutMenu", 
			        method: "post",
			        dataType: "json",
			        success: function (u_data) {
			        	for (i = 0; i < u_data.length; i++){
			        		$(":checkbox[value='"+u_data[i].id+"']").attr("checked", true);
			        		//var buton_item="<a href='#' target=\"_self\" class=\"J_menuItem\" data-index='"+u_data[i].id+"'><button class=\"btn btn-info  dim btn-large-dim btn-outline\" style=\"font-size: 16px;\" type=\"button\">"+u_data[i].name.substring(0,2)+"<span class='right-top-padding'>"+(u_data[i].taskCount!=0?"!":"")+"</span><br>"+u_data[i].name.substring(2,4)+"</button></a>";
			        		var buton_item="<a href='#' target=\"_self\" class=\"J_menuItem\" data-index='"+u_data[i].id+"'><button class=\"btn btn-info  dim btn-large-dim btn-outline\" style=\"font-size: 16px;\" type=\"button\">"+u_data[i].name.substring(0,2)+"<br/>"+u_data[i].name.substring(2,4)+"</button></a>";
			        		$(".quick_menu").append(buton_item);
			        	}
			        },
			        error:function(data){	
			        	alert("ajax请求失败!");	
			        }
				});
	        },
	        error:function(data){	
	        	console.log("ajax请求失败!");	
	        }
		});
	    //保存快捷入口用户配置
		$('#save').on('click', function () {
			$.ajax({ 
		        url: "system/commitUserMenu", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: $('#menu_list_form').serialize(),
		        success: function (data) { 
		        	layer.msg('保存成功');
		        	$(".quick_menu").empty();
		        	$.ajax({ 
				        url: "system/getShortcutMenu", 
				        method: "post",
				        dataType: "json",
				        success: function (u_data) {
				        	for (i = 0; i < u_data.length; i++){
				        		$(":checkbox[value='"+u_data[i].id+"']").attr("checked", true);
				        		//var buton_item="<a href='#' target=\"_self\" class=\"J_menuItem\" data-index='"+u_data[i].id+"'><button class=\"btn btn-info  dim btn-large-dim btn-outline\" style=\"font-size: 16px;\" type=\"button\">"+u_data[i].name.substring(0,2)+"<span class='right-top-padding'>"+(u_data[i].taskCount!=0?"!":"")+"</span><br>"+u_data[i].name.substring(2,4)+"</button></a>";
				        		var buton_item="<a href='#' target=\"_self\" class=\"J_menuItem\" data-index='"+u_data[i].id+"'><button class=\"btn btn-info  dim btn-large-dim btn-outline\" style=\"font-size: 16px;\" type=\"button\">"+u_data[i].name.substring(0,2)+"<br>"+u_data[i].name.substring(2,4)+"</button></a>";
				        		$(".quick_menu").append(buton_item);
				        	}
				        },
				        error:function(data){	
				        	alert("ajax请求失败!");	
				        }
					});
		        },
		        error:function(data){	
		        	console.log("请求失败!");	
		        }
		    });
		});
		//快捷入口点击，触发菜单栏点击事件
		$("body").on('click', '.J_menuItem', function(){
			parent.$(".J_menuItem[data-index="+$(this).data('index')+"]",parent.doucment).trigger('click');
		});
		//获得公告
		$.ajax({ 
	        url: "system/getNoticeList", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        contentType: 'application/json',
	        //传送请求数据
	        data: JSON.stringify({'offset':'0','limit':'3'}),
	        success: function (data) {
	        	for (i = 0; i < data.rows.length; i++){	        		
	        		var item="<tr><td class='content'><a href=system/noticeDetail?id="+data.rows[i].ID+" target='_blank'>"+data.rows[i].title+"</a></td><td >"+renderDate(data.rows[i].sendTime)+"</td></tr>";
	        		$(".notice").append(item);
	        	};
	        	//获得消息——写在获得公告的success中防止异步交互后台窜数据
	    		$.ajax({ 
	    	        url: "system/getDialogList", 
	    	        method: "post",
	    	        dataType: "json",
	    	        traditional:true,
	    	        contentType: 'application/json',
	    	        //传送请求数据
	    	        data: JSON.stringify({'offset':'0','limit':'3'}),
	    	        success: function (data) {
	    	        	for (i = 0; i < data.rows.length; i++){	        		
	    	        		var item="<tr><td class='content'><a href=system/noticeDetail?id="+data.rows[i].ID+" target='_blank'>"+data.rows[i].content+"</a></td><td >"+data.rows[i].sender + '_' + data.rows[i].sender_name +"</td></tr>";
	    	        		$(".dialog").append(item);
	    	        	};
	    	        },
	    	        error:function(data){
	    	        	console.log("ajax请求失败!");
	    	        }
	    		});
	        },
	        error:function(data){
	        	alert("ajax请求失败!");
	        }
		});
		//发布公告
		$('#notice_add').on('click', function () {
			  parent.layer.open({
	                type: 2,
	                title:'发布公告',
	                area: ['720px', '620px'],
	                skin: 'layui-layer-rim', //加上边框
	                content: 'system/noticeAdd'
	            }); 				
		 });
		//发布消息
		$('#dialog_add').on('click', function () {
			  parent.layer.open({
	                type: 2,
	                title:'发送消息',
	                maxmin: true,
	                area: ['720px', '680px'],
	                skin: 'layui-layer-rim', //加上边框
	                content: 'system/dialogAdd'
	            }); 				
		 });
	});
			
		
		    
	</script>
</body>
</html>