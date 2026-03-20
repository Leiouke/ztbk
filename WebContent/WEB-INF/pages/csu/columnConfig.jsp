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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	${queryId}
		<div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                           <table id="table" data-height="400" >
                           </table>
                           <button type="button" class="btn btn-primary btn" id="save" style="float:right;margin-top:5px">保存</button>
                    </div>
                    
                </div>
            </div>
        </div>
	</body>
	    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
  	<script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#table').bootstrapTable({
			      url: "getUserColumns?queryId=${queryId}",
			      search: false,
			      method:'post',
			      //pagination: true,
			      showRefresh: false,
			      //showToggle: true,
			      //showColumns: true,
			      //sidePagination : "server", // 服务端处理分页 
			      //iconSize: 'outline',
			      //toolbar: '#tableTool',
			      columns:[
			    	  	{title: '列名',field: 'title',align: 'center',valign: 'middle'},
		                {title: '是否可见',field: 'visible',align: 'center',
		                 editable: {
			                   type: 'select',
			                   title: '是否可见',
			                   source:[{value:1,text:"是"},{value:0,text:"否"}],
			             }
		                },
		                {title: '是否排序',field: 'sortable',align: 'center',
			                 editable: {
				                   type: 'select',
				                   title: '是否排序',
				                   source:[{value:1,text:"是"},{value:0,text:"否"}],
				             }
			            },
		                {title: '宽度',field: 'width',align: 'center',editable:true},
		                {title: '排序号',field: 'index',align: 'center',editable:true}		                
		                ]/* ,
			      icons: {
			        refresh: 'glyphicon-repeat',
			        toggle: 'glyphicon-list-alt',
			        columns: 'glyphicon-list'
			      } */
			    });
			$('#save').on('click', function () {
				var table_data=$('#table').bootstrapTable('getData');
				console.log(table_data);
				$.each(table_data, function(idx, obj) {
					if(obj.visible==0){
						obj.visible=false;
					}else if(obj.visible==1){
						obj.visible=true;
					}
					if(obj.sortable==0){
						obj.sortable=false;
					}else if(obj.sortable==1){
						obj.sortable=true;
					}
				});
				//console.log(JSON.stringify(table_data),)
				$.ajax({ 
			        url: "commitUserColumns?queryId=${queryId}",
			        method: "post",
			        dataType: "json",  // 这句的意思是返回的类型需要是json格式的
			        traditional:true,
			        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
			        //传送请求数据, 注意属性值要写全
			        //data:'[{"field":"account","width":100, "title":"账号" ,"formatter":"", "visible":true,"index":0,"align":"1"}]',
			        data: JSON.stringify(table_data),
			        success: function (data) { 
			        	//alert("hello");
			        	layer.msg('修改成功');
			        },
			        error:function(data){	
			        	layer.msg('修改失败');
			        }
			    });
			 });
		});
	</script>
</html>