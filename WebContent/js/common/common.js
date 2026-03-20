var sum_list={};
$(function(){
	//表格搜索,和清空
/*	$('#search').on('click', function () {
		$('#table').bootstrapTable('refresh');
	});*/
	$('#reset').on('click', function () {
		$('.search-items').each(function(){
			$(this).val('');
		});
	});
	//关闭弹出框
	$('#cancel').on('click', function () {
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
	});
	//子元素滚动到底，父元素不随着滚动
	/*$('.tab-content').scrollUnique();	*/
	$(document).on('mouseover','td',function(){
		$(this).removeClass("hid");
		
	});
	$(document).on('mouseout','td',function(){
		$(this).addClass("hid");
	});
	//$('body').scrollUnique();
});

//汇总数据
function search_sum_list(sumurl,datajson,searchurl,$table){
	$.ajax({
        type: "post",
        url: sumurl,
        data: datajson,
        dataType: 'JSON',
        success: function (data) {
        	sum_list=data;
        	$table.bootstrapTable('refreshOptions',{url: searchurl});
        },
        error: function (data) {
        	console.log(data);
        }
    });	
}
function load_sum_list(sumurl,datajson,$table){
	$.ajax({
        type: "post",
        url: sumurl,
        data: datajson,
        dataType: 'JSON',
        success: function (data) {
        	sum_list=data;
        	$table.bootstrapTable('refresh');
        },
        error: function (data) {
        	console.log(data);
        }
    });
}
function load_sum_list_first(sumurl,datajson,success_function){
	$.ajax({
        type: "post",
        url: sumurl,
        data: datajson,
        dataType: 'JSON',
        success: function (data) {
        	sum_list=data;
        	success_function;
        },
        error: function (data) {
        	console.log(data);
        }
    });
}
function load_sum_list_reset_table(sumurl,datajson,$table){
	$.ajax({
        type: "post",
        url: sumurl,
        data: datajson,
        dataType: 'JSON',
        success: function (data) {
        	sum_list=data;
        	$table.bootstrapTable('resetView');
        },
        error: function (data) {
        	console.log(data);
        }
    });
}
//搜索
function search_click($table,the_url){
		$table.bootstrapTable('refreshOptions',{url: the_url});
		//$table.bootstrapTable('refresh');
}
//关闭页面
function close_layer(){
	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    parent.layer.close(index);
}
function calculate_select($table){
	var list = $table.bootstrapTable('getSelections'); //获取窗口索引
    return list.length;
}
//初始化bootstarp
function initialize_table($table,url,columns_config,queryParams,toolbar,height){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      showFooter:true,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      },
          onCheck:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
            },
          onUncheck:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
          },
          onCheckAll:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
          },
          onUncheckAll:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
          }
	    });
}
function initialize_table_no_footer($table,url,columns_config,queryParams,toolbar,height){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      showFooter:false,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      }
	    });
}
//为了解决需要tab切换的页面
//table加载样式出现大小出现异常的情况
function initialize_table_no_footer_tab($table,url,columns_config,queryParams,toolbar,height,tab){
	first=0;
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      showFooter:false,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      },
	      onLoadSuccess:function(data){
	    	  if($.inArray(tab,tab_array)==-1){
	    		  $(tab).removeClass("active");
	    		  tab_array.push(tab);
	    	  }
	      },
	      onLoadError:function(data){
	    	  if($.inArray(tab,tab_array)==-1){
	    		  $(tab).removeClass("active");
	    		  tab_array.push(tab);
	    	  }
	      }
	    });	
}
function initialize_table_singleSelect($table,url,columns_config,queryParams,toolbar,height){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      showFooter:false,
	      singleSelect:true,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      }
	    });
}
function initialize_table_line($table,url,columns_config,queryParams,toolbar,height){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      showFooter:true,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      striped:true,
	      rowStyle: function (row, index) {
	             var style = {};
	             var textColor;
	             
	             // 删除的用删除线
	             if(row.is_destroy == '1' ) {
	                style={css:{'text-decoration': 'line-through','text-decoration-thickness': '2px'}};
	             }
	             
	             //行样色的判断
	             if (row.row_colour) { // 确保 row.status 存在，你可以根据需要调整这个条件
	            	// 根据 cell_colour 设置背景色和字体颜色
	            	    if (row.row_colour == "0") {
	            	        // 假设无色背景使用默认字体颜色（通常是黑色）
	            	        style.css = {'background-color': ''};
	            	        textColor = ''; // 或者不设置 textColor，使用默认字体颜色
	            	    } else if (row.row_colour == "1") {
	            	        style.css = {'background-color': '#ffff99'}; // 黄色背景
	            	        textColor = '#000000'; // 黑色字体（黄色背景上黑色字体可读性好）
	            	    } else if (row.row_colour == "2") {
	            	        style.css = {'background-color': '#EE6363'}; // 红色背景
	            	        textColor = '#ffffff'; // 白色字体（红色背景上白色字体可读性好）
	            	    } else if (row.row_colour == "3") {
	            	        style.css = {'background-color': '#87CEFA'}; // 蓝色背景
	            	        textColor = '#000000'; // 白色字体（蓝色背景上白色字体可读性好）
	            	    } else if (row.row_colour == "4") {
	            	        style.css = {'background-color': '#50ac62'}; // 绿色背景
	            	        textColor = '#ffffff'; // 白色字体（绿色背景上白色字体可读性好）
	            	    } else if (row.row_colour == "5") {
	            	        style.css = {'background-color': '#eb992f'}; // 土黄色背景
	            	        textColor = '#000000'; // 黑色字体（土黄色背景上黑色字体可读性好）
	            	    }
	             }
	             
	          // 如果设置了字体颜色，则添加到样式对象中
	             if (textColor) {
	                 style.css['color'] = textColor;
	             }
	          
	             // 确保最终返回的是正确的样式对象，即使之前已经设置了删除线样式
	             // 如果需要合并样式，可以创建一个新的对象来合并它们
	             if (!style.css) {
	                 style.css = {};
	             }
	             // 这里可以根据需要添加更多的样式处理逻辑
				
	             return style;
	      },
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      },
          onCheck:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
            },
          onUncheck:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
          },
          onCheckAll:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
          },
          onUncheckAll:function(row){
          	var num=calculate_select($table);
          	$("#checkbox_num").html(num);
          }
	    });
}
/*function initialize_table_afterpost($table,url,columns_config,queryParams,toolbar,height,afterpost){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      showFooter:true,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      },
          onCheck:function(row){
            	var num=calculate_select($table);
            	$("#checkbox_num").html(num);
              },
            onUncheck:function(row){
            	var num=calculate_select($table);
            	$("#checkbox_num").html(num);
            },
            onCheckAll:function(row){
            	var num=calculate_select($table);
            	$("#checkbox_num").html(+num);
            },
            onUncheckAll:function(row){
            	var num=calculate_select($table);
            	$("#checkbox_num").html(num);
            }
	    });
}*/
function initialize_table_simple($table,url,columns_config,queryParams,height){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: false,
	      showRefresh: false,
	      showColumns: false,
	      showExport:false,
	      sortable:false,
	      showFooter:false,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      //toolbar: toolbar,
	      //exportDataType:'all',
	      queryParams: queryParams,
	      //pageSize:200,
	      height:height,
	      //pageList:[200, 500, 5000],
	      columns: columns_config,
	      /*icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      }*/
	    });
}
//初始化bootstarp
function initialize_table_editable($table,url,columns_config,queryParams,toolbar,height,edit_url){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      },
	      onEditableSave: function (field, row, oldValue, $el) {
              $.ajax({
                  type: "post",
                  url: edit_url,
                  data: row,
                  dataType: 'JSON',
                  success: function (data, status) {
                	 if (status == "success") {
                    	if (data.success) {
                      		layer.msg('修改成功');
                     	} else {
                     		layer.msg(data.errorMsg); 
                     	}
                     }
                     $table.bootstrapTable('refresh');
                  },
                  error: function (data) {
                	row[field]=oldValue;
                  	$el.editable('setValue', oldValue);
                  	layer.msg('修改失败');
                  },
                  complete: function () {

                  }

              });
          }
	    });
}
//
function initialize_table_editable_footer($table,url,columns_config,queryParams,toolbar,height,edit_url){
	$table.bootstrapTable({
	      url: url,
	      method:'post',
	      pagination: true,
	      showRefresh: true,
	      showColumns: true,
	      showExport:true,
	      sortable:true,
	      showFooter:true,
	      sidePagination : "server", // 服务端处理分页 
	      iconSize: 'outline',
	      toolbar: toolbar,
	      exportDataType:'all',
	      queryParams: queryParams,
	      pageSize:200,
	      height:height,
	      pageList:[200, 500, 5000],
	      columns: columns_config,
	      icons: {
	        refresh: 'glyphicon-repeat',
	        toggle: 'glyphicon-list-alt',
	        columns: 'glyphicon-list'
	      },
	      onEditableSave: function (field, row, oldValue, $el) {
              $.ajax({
                  type: "post",
                  url: edit_url,
                  data: row,
                  dataType: 'JSON',
                  success: function (data, status) {
                      if (data.success) {
                      	layer.msg('修改成功');
                      	$table.bootstrapTable('refresh'); //后台控制数据是否符合规范时，不符合也会返回success。需要重新刷新数据
                      }else{
                    	row[field]=oldValue;
                      	$el.editable('setValue', oldValue);
                        if(data.errorMsg){
                        	layer.msg(data.errorMsg);
                        }else{
                        	layer.msg("修改失败");
                        }
                      }
                  },
                  error: function (data) {
                	row[field]=oldValue;
                	$el.editable('setValue', oldValue);
                  	layer.msg('修改失败');
                  },
                  complete: function () {

                  }

              });
          },
          onCheck:function(row){
            	var num=calculate_select($table);
            	$("#checkbox_num").html(num);
          },
          onUncheck:function(row){
        	var num=calculate_select($table);
        	$("#checkbox_num").html(num);
          },
          onCheckAll:function(row){
        	var num=calculate_select($table);
        	$("#checkbox_num").html(num);
          },
          onUncheckAll:function(row){
        	var num=calculate_select($table);
        	$("#checkbox_num").html(num);
          }
	    });
}
//元素点击
function button_click_layer_refresh($button,type,title,url,$table,is_full,area){
	$button.on('click', function () {
		  var index=layer.open({
              type: type,
              title:title,
              maxmin: true,
              area: area,
              scrollbar: true,
              moveOut:true,
              skin: 'layui-layer-rim', //加上边框
              content: url,
              end:function () {
            	  $table.bootstrapTable('refresh');
              }
          });
		  if(is_full){
			  layer.full(index);
		  }
	 });
}
//元素点击阴影
function button_click_layer($button,type,title,url,is_full,area){
	$button.on('click', function () {
		  var index=layer.open({
              type: type,
              title:title,
              maxmin: true,
              moveOut:true,
              area: area,
              scrollbar: true,
              skin: 'layui-layer-rim', //加上边框
              content: url
          });
		  if(is_full){
			  layer.full(index);
		  }
	 });
}
/*function button_click_parent_layer($button,type,title,url,is_full,area){
	$button.on('click', function () {
		  var index=layer.open({
              type: type,
              title:title,
              maxmin: true,
              moveOut:true,
              area: area,
              scrollbar: true,
              skin: 'layui-layer-rim', //加上边框
              content: url
          });
		  if(is_full){
			  layer.full(index);
		  }
	 });
}*/
//弹出窗口
function button_click_windows_refresh($button,type,title,url,$table,is_full){
	$button.on('click', function () {
		  var index=layer.open({
              type: type,
              title:title,
              resize:true,
              maxmin: true,
              shadeClose: true,
              shade: false,
              moveOut:true,
              area: ['620px', '580px'],
              scrollbar: true,
              skin: 'layui-layer-rim', //加上边框
              content: url,
              end:function () {
            	  $table.bootstrapTable('refresh');
              }
          });
		  if(is_full){
			  layer.full(index);
		  }
	 });
}
//
function button_click_parent_windows_refresh($button,type,title,url,$table,is_full){
	$button.on('click', function () {
		  var index=parent.layer.open({
              type: type,
              title:title,
              resize:true,
              maxmin: true,
              //shadeClose: true,
              //shade: false,
              moveOut:true,
              area: ['620px', '580px'],
              scrollbar: true,
              skin: 'layui-layer-rim', //加上边框
              content: url,
              end:function () {
            	  $table.bootstrapTable('refresh');
              }
          });
		  if(is_full){
			  parent.layer.full(index);
		  }
	 });
}
function button_click_windows_refresh_cancel($button,type,title,url,$table,is_full,cancel_function){
	$button.on('click', function () {
		  var index=layer.open({
              type: type,
              title:title,
              resize:true,
              maxmin: true,
              //shadeClose: false,
              //shade: false,
              moveOut:true,
              area: ['620px', '500px'],
              scrollbar: true,
              skin: 'layui-layer-rim', //加上边框
              content: url,
              end:function () {
            	  $table.bootstrapTable('refresh');
              },
		  	  cancel: cancel_function
          });
		  if(is_full){
			  layer.full(index);
		  }
	 });
}
function button_click_windows_end($button,type,title,url,is_full,area,end_function){
	$button.on('click', function () {
		  var index=layer.open({
              type: type,
              title:title,
              resize:true,
              maxmin: true,
              //shadeClose: false,
              //shade: false,
              moveOut:true,
              area: area,
              scrollbar: true,
              skin: 'layui-layer-rim', //加上边框
              content: url,
              end:end_function
          });
		  if(is_full){
			  layer.full(index);
		  }
	 });
}
//超链接或其他点击函数
function open_layer(type,title,url,layer_area,is_full){
	 var index=layer.open({
          type: type,
          title:title,
          maxmin: true,
          moveOut:true,
          area: layer_area,
          skin: 'layui-layer-rim', //加上边框
          content: url
      });
	 if(is_full){
		 layer.full(index);
	 }
	 return index;
}
function parent_open_layer(type,title,url,layer_area,is_full){
	 var index=parent.layer.open({
         type: type,
         title:title,
         maxmin: true,
         moveOut:true,
         area: layer_area,
         skin: 'layui-layer-rim', //加上边框
         content: url
     });
	 if(is_full){
		 layer.full(index);
	 }
	 return index;
}
function open_layer_refresh(type,title,url,$table,area,is_full){
	 var index=layer.open({
           type: type,
           title:title,
           maxmin: true,
           moveOut:true,
           area:area,
           skin: 'layui-layer-rim', //加上边框
           content: url,
           end:function () {
        	   $table.bootstrapTable('refresh');
           }
       });
	 if(is_full){
		 layer.full(index);
	 }
}
function open_layer_refresh_cancel(type,title,url,$table,is_full,cancel_function){
	 var index=layer.open({
          type: type,
          title:title,
          maxmin: true,
          moveOut:true,
          area: ['620px', '580px'],
          skin: 'layui-layer-rim', //加上边框
          content: url,
          end:function () {
       	   $table.bootstrapTable('refresh');
          },
          cancel: cancel_function
      });
	 if(is_full){
		 layer.full(index);
	 }
}
function open_layer_end(type,title,url,area,is_full,end_function){
	 var index=layer.open({
         type: type,
         title:title,
         maxmin: true,
         moveOut:true,
         area: area,
         skin: 'layui-layer-rim', //加上边框
         content: url,
         end:end_function
     });
	 if(is_full){
		 layer.full(index);
	 }
}
//bootstrap column配置
function table_column_config_layer($config,type,title,url,$table){
	$config.on('click', function () {
		  parent.layer.open({
              type: 2,
              title:title,
              moveOut:true,
              area: ['820px', '580px'],
              skin: 'layui-layer-rim', //加上边框
              content: url,
              end:function () {
            	  //$table.bootstrapTable('resetView');
            	  location.reload();
              }
          }); 				
	 });
}
//ajax关闭
function ajax_function(url,method,data,success_info){
	var index = layer.load(1, {
		  shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	$.ajax({ 
        url: url, 
        method: method,
        dataType: "json",
        traditional:true,
        //传送请求数据
        data: data,
        success: function (data) { 
        	if (data.success){
        		layer.close(index);
        		layer.msg(success_info);        		
        		setTimeout(function (){
            		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引            		
                    parent.layer.close(index);//something you want delayed
            	   }, 1000); // how long do you want the delay to be?
        	} else {
        		layer.msg(data.errorMsg);
        		layer.close(index);
        	}        	
        },
        error:function(data){
        	layer.close(index);
        	alert("请求失败!");        	
        }
    });	
}
//ajax不关闭弹窗
function ajax_function_no_close(url,method,data,success_info){
	var index = layer.load(1, {
		  shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	$.ajax({ 
        url: url, 
        method: method,
        dataType: "json",
        traditional:true,
        //contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
        //传送请求数据
        data: data,
        success: function (data) { 
        	if (data.success){
        		if(success_info==null){
        			layer.close(index);
        			console.log('success');
        		}else{
        			layer.close(index);
        			layer.msg(success_info);
        		}
        	} else {
        		layer.close(index);
        		layer.msg(data.errorMsg);
        	}
        },
        error:function(data){
        	layer.close(index);
        	alert("请求失败!");	
        }
    });	
}
//ajax不关闭弹窗
function ajax_function_no_close_postbody(url,method,data,success_info){
	var index = layer.load(1, {
		  shade: [0.1,'#fff'] //0.1透明度的白色背景
	});
	$.ajax({ 
        url: url, 
        method: method,
        dataType: "json",
        traditional:true,
        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
        //传送请求数据
        data: data,
        success: function (data) { 
        	if (data.success){
        		if(success_info==null){
        			layer.close(index);
        			console.log('success');
        		}else{
        			layer.close(index);
        			layer.msg(success_info);
        		}
        	} else {
        		layer.close(index);
        		layer.msg(data.errorMsg);
        	}
        },
        error:function(data){
        	layer.close(index);
        	alert("请求失败!");	
        }
    });	
}
//ajax不关闭弹窗-postbody
function ajax_function_postbody_refresh(url,method,data,success_info,$table){
	$.ajax({ 
        url: url,
        method: method,
        dataType: "json",  // 这句的意思是返回的类型需要是json格式的
        traditional:true,
        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
        data: data,
        success: function (data) { 
        	if (data.success){
        		if(success_info==null){
        			console.log('success');
        		}else
        			layer.msg(success_info);
        			$table.bootstrapTable('refresh');
        	} else {
        		layer.msg(data.errorMsg);
        	}
        },
        error:function(data){	
        	layer.msg('修改失败');
        }
    });	
}
//ajax询问并刷新表格
function ajax_function_ask_and_refresh(ask_info,url,method,data,success_info,$table){
	if(confirm(ask_info)){
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        data: data,
	        success: function (data) {
	        	if (data.success){
	        		if(success_info==null){
	        			console.log('success');
	        		}else{
	        			layer.msg(success_info);
	    	        	$table.bootstrapTable('refresh');
	        		}
	        	} else {
	        		layer.msg(data.errorMsg);
	        		$table.bootstrapTable('refresh');
	        	}	        	
	        },
	        error:function(data){	
	        	alert("请求失败!");	
	        }
	    });		
	}
}
function ajax_function_ask_and_refresh_postdata(ask_info,url,method,data,success_info,$table){
	if(confirm(ask_info)){
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
	        //传送请求数据
	        data: data,
	        success: function (data) {
	        	if (data.success){
	        		if(success_info==null){
	        			console.log('success');
	        		}else{
	        			layer.msg(success_info);
	    	        	$table.bootstrapTable('refresh');
	        		}
	        	} else {
	        		layer.msg(data.errorMsg);
	        	}
	        },
	        error:function(data){	
	        	alert("请求失败!");	
	        }
	    });		
	}
}
function ajax_function_ask_and_dosuccess_postdata(ask_info,url,method,data,success_fuction){
	if(confirm(ask_info)){
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
	        //传送请求数据
	        data: data,
	        success: success_fuction,
	        error:function(data){	
	        	alert("请求失败!");	
	        }
	    });		
	}
}
//ajax询问并刷新表格
function ajax_function_ask_and_close(ask_info,url,method,data,success_info){
	if(confirm(ask_info)){
		var index = layer.load(1, {
			  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        //contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
	        //传送请求数据
	        data: data,
	        success: function (data) {
	        	if (data.success){
	        		if(success_info==null){
	        			console.log('success');
	        			layer.close(index);
	        		}else{
	        			layer.close(index);
	        			layer.msg(success_info);
	    	        	setTimeout(function (){
	                		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                        parent.layer.close(index);//something you want delayed
	                	   }, 1000); // how long do you want the delay to be?
	        		}
	        	} else {
	        		layer.close(index);
	        		layer.msg(data.errorMsg);
	        	}
	        },
	        error:function(data){
	        	layer.close(index);
	        	alert("请求失败!");	
	        }
	    });		
	}
}
//ajax询问并关闭弹出框
function ajax_function_ask_and_close_layer_and_refresh(ask_info,url,method,data,success_info,layer_index,$table){
	if(confirm(ask_info)){
		var index = layer.load(1, {
			  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        //contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
	        //传送请求数据
	        data: data,
	        success: function (data) {
	        	if (data.success){
	        		if(success_info==null){
	        			console.log('success');
	        			layer.close(index);
	        		}else{
	        			layer.close(index);
	        			layer.msg(success_info);
	        			$table.bootstrapTable('refresh');
	    	        	setTimeout(function (){
	                        layer.close(layer_index);
	                	}, 1000);
	    	        	
	        		}
	        	} else {
	        		layer.close(index);
	        		layer.msg(data.errorMsg);
	        	}
	        },
	        error:function(data){
	        	layer.close(index);
	        	alert("请求失败!");	
	        }
	    });		
	}
}
//ajax询问并刷新表格
function ajax_function_ask_and_close_json_data(ask_info,url,method,data,success_info){
	if(confirm(ask_info)){
		var index = layer.load(1, {
			  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
	        //传送请求数据
	        data: data,
	        success: function (data) {
	        	if (data.success){
	        		if(success_info==null){
	        			layer.close(index);
	        			console.log('success');
	        		}else{
	        			layer.close(index);
	        			layer.msg(success_info);
	    	        	setTimeout(function (){
	                		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                        parent.layer.close(index);//something you want delayed
	                	   }, 1000); // how long do you want the delay to be?
	        		}
	        	} else {
	        		layer.close(index);
	        		layer.msg(data.errorMsg);
	        	}
	        },
	        error:function(data){
	        	layer.close(index);
	        	alert("请求失败!");	
	        }
	    });		
	}
}
//
//ajax询问并刷新表格
function ajax_function_refresh(url,method,data,success_info,$table){
		var index = layer.load(1, {
			  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        data: data,
	        success: function (data) {
	        	if (data.success){
	        		if(success_info==null){
	        			layer.close(index);
	        			console.log('success');
	        		}else{
	        			layer.close(index);
	        			layer.msg(success_info);
	    	        	$table.bootstrapTable('refresh');
	        		}
	        	} else {
	        		layer.close(index);
	        		layer.msg(data.errorMsg);
	        	}	        	
	        },
	        error:function(data){
	        	layer.close(index);
	        	alert("请求失败!");	
	        }
	    });		
}
//
function ajax_function_dosuccess(url,method,data,success_fuction){
	$.ajax({ 
        url: url,
        method: method,
        dataType: "json",
        traditional:true,
        scriptCharset: 'utf-8',
        //传送请求数据
        data: data,
        success: success_fuction,
        error:function(data){
        	console.log(data);
        	console.log("请求失败!");
        }
    });	
}
function ajax_function_dosuccess_errorfuntion(url,method,data,success_fuction,error_fuction){
	$.ajax({ 
        url: url,
        method: method,
        dataType: "json",
        traditional:true,
        scriptCharset: 'utf-8',
        //传送请求数据
        data: data,
        success: success_fuction,
        error:function(data){
        	console.log(data);
        	console.log("请求失败!");
        }
    });	
}
function ajax_function_dosuccess_postbody(url,method,data,success_fuction){
	$.ajax({ 
        url: url, 
        method: method,
        dataType: "json",
        traditional:true,
        scriptCharset: 'utf-8',
        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
        //传送请求数据
        data: data,
        success: success_fuction,
        error:function(data){
        	console.log(data);
        	console.log("请求失败!");	
        }
    });	
}
function ajax_function_ask_and_dosuccess(ask_info,url,method,data,success_fuction){
	if(confirm(ask_info)){
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        scriptCharset: 'utf-8',
	        //传送请求数据
	        data: data,
	        success: success_fuction,
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	        	// 状态码
                console.log(XMLHttpRequest.status);
                // 状态
                console.log(XMLHttpRequest.readyState);
                // 错误信息   
                console.log(textStatus);
	        	console.log("请求失败!");	
	        }
	    });	
	}	
}
//获取字典数据加载到selection
//根据传入的one对象选择
function get_dictionary(context,one){
	$.getJSON(context+"/js/json/dictionary.json",function(data){
		//console.log($(this));
		$(".dictionary").each(function(){
			var $select=$(this);
			if($select.hasClass("isboolean")){
				if(one==null){			        	
		        	item="<option value='0'>否</option>";
		        	$select.append(item);
		        	item="<option value='1'>是</option>";
		        	$select.append(item);
		        	return true;
        		}else{	        			
		        	item="<option value='0'";
		        	if(one[$select.attr('name')]==0)
		        		item+=" selected ";
		        	item+=">否</option>";
        			$select.append(item);
        			item="<option value='1'";
		        	if(one[$select.attr('name')]==1)
		        		item+=" selected ";
		        	item+=">是</option>";
        			$select.append(item);
        			return true;
        		}
			}
			
			$.each(data,function(infoIndex,info){
				//console.log($(this));
				if($select.attr('name')==info["name"]||$select.data('name')==info["name"]){
					$.ajax({
				        url: context + "/system/getUsingDictionaryList", 
				        method: "post",
				        dataType: "json",
				        traditional:true,
				        //传送请求数据
				        data: {"directoryId":info["id"]},
				        success: function (data) {
				        	var id_start=$select.data('id-start');
			        		var id_end=$select.data('id-end');
			        		var id_list=$select.data('id-list');
			        		if(id_list==undefined){
			        			id_list="";
			        		}
			        		var id_list_arr=id_list.split(',');
				        	$.each(data,function(dic_index,dic_info){
				        		var item="";
				        		if(one==null){				        			
				        			if($select.hasClass("checkbox")){
				        				if(id_start&&id_end){
						        			if(id_start<=dic_info.code&&dic_info.code<=id_end)
						        				item="<input type='checkbox' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name
						        		}else if(id_start){
						        			if(id_start<=dic_info.code){
						        				item="<input type='checkbox' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name
						        			}
						        		}else if(id_end){
						        			if(dic_info.code<=id_end){
						        				item="<input type='checkbox' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name
						        			}						        			
						        		}else if(id_list!==""){
						        			if($.inArray(dic_info.code,id_list_arr)!=-1){
						        				item="<input type='checkbox' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name
						        			}
						        		}else{
						        			item="<input type='checkbox' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name
						        		}
//				        				alert("!!");
						        		$select.append(item);
				        			}else if($select.hasClass("radio")){
				        				if(id_start&&id_end){
						        			if(id_start<=dic_info.code&&dic_info.code<=id_end)
						        				item="<input type='radio' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name+"&nbsp&nbsp"
						        		}else if(id_start){
						        			if(id_start<=dic_info.code){
						        				item="<input type='radio' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name+"&nbsp&nbsp"
						        			}
						        		}else if(id_end){
						        			if(dic_info.code<=id_end){
						        				item="<input type='radio' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name+"&nbsp&nbsp"
						        			}						        			
						        		}else if(id_list!==""){
						        			if($.inArray(dic_info.code,id_list_arr)!=-1){
						        				item="<input type='radio' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name+"&nbsp&nbsp"
						        			}
						        		}else
						        			item="<input type='radio' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name+"&nbsp&nbsp"
						        		$select.append(item);
				        			}else{
				        				if(info["type"]=="key"){
							        		if(id_start&&id_end){
							        			if(id_start<=dic_info.code&&dic_info.code<=id_end)
							        				item="<option value='"+dic_info.code+"'>"+dic_info.name+"</option>"
							        		}else if(id_start){
							        			if(id_start<=dic_info.code){
							        				item="<option value='"+dic_info.code+"'>"+dic_info.name+"</option>"
							        			}						        			
							        		}else if(id_end){
							        			if(dic_info.code<=id_end){
							        				item="<option value='"+dic_info.code+"'>"+dic_info.name+"</option>"
							        			}						        			
							        		}else if(id_list!==""){
							        			if($.inArray(dic_info.code,id_list_arr)!=-1){
							        				item="<option value='"+dic_info.code+"'>"+dic_info.name+"</option>"
							        			}
							        		}else
							        			item="<option value='"+dic_info.code+"'>"+dic_info.name+"</option>"
							        	}
							        	else if(info["type"]=="value"){
							        		item="<option value='"+dic_info.name+"'>"+dic_info.name+"</option>"
							        	}						        		
							        	$select.append(item);
				        			}
				        		}else{
				        			var value_arr=one[info["name"]];
				        			if($select.hasClass("checkbox")){
				        				if(value_arr.indexOf(dic_info.code)!=-1){
				        					item="<input type='checkbox' value='"+dic_info.code+"' name='"+info["name"]+"' checked>"+dic_info.name
				        				}else{
				        					item="<input type='checkbox' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name
				        				}
				        				$select.append(item);
				        			}else if($select.hasClass("checkbox")){
				        				if(one[info["name"]]==dic_info.name){
				        					item="<input type='radio' value='"+dic_info.code+"' name='"+info["name"]+"' checked>"+dic_info.name+"&nbsp&nbsp"
				        				}else{
				        					item="<input type='radio' value='"+dic_info.code+"' name='"+info["name"]+"'>"+dic_info.name+"&nbsp&nbsp"
				        				}
				        				$select.append(item);
				        			}else{
				        				if(info["type"]=="key"){
				        					if(id_start&&id_end){
							        			if(id_start<=dic_info.code&&dic_info.code<=id_end){
							        				item="<option value='"+dic_info.code+"'";
									        		if(one[info["name"]]==dic_info.code)
									        			item+=" selected ";
									        		item+=">"+dic_info.name+"</option>";
							        			}
							        		}else if(id_start){
							        			if(id_start<=dic_info.code){
							        				item="<option value='"+dic_info.code+"'";
									        		if(one[info["name"]]==dic_info.code)
									        			item+=" selected ";
									        		item+=">"+dic_info.name+"</option>";
							        			}						        			
							        		}else if(id_end){
							        			if(dic_info.code<=id_end){
							        				item="<option value='"+dic_info.code+"'";
									        		if(one[info["name"]]==dic_info.code)
									        			item+=" selected ";
									        		item+=">"+dic_info.name+"</option>";
							        			}						        			
							        		}else if(id_list!==""){
							        			if($.inArray(dic_info.code,id_list_arr)!=-1){
							        				item="<option value='"+dic_info.code+"'";
									        		if(one[info["name"]]==dic_info.code)
									        			item+=" selected ";
									        		item+=">"+dic_info.name+"</option>";
							        			}
							        		}else{
							        			item="<option value='"+dic_info.code+"'";
								        		if(one[info["name"]]==dic_info.code)
								        			item+=" selected ";
								        		item+=">"+dic_info.name+"</option>";
							        		}							        		
					        			}
							        	else if(info["type"]=="value"){
							        		item="<option value='"+dic_info.name+"'"
							        		if(one[info["name"]]==dic_info.name)
							        			item+=" selected ";
							        		item+=">"+dic_info.name+"</option>";
							        	}
							        	$select.append(item);
				        			}					        			
				        		}
				        	});
				        },
				        error:function(data){	
				        	alert("请求失败!");	
				        }
				    });
				}
			});
		});
	});
}
//填充字典数据
function set_one_dictionary($f_div,one){
	$f_div.find(".dictionary").each(function(){
			var $select=$(this);
			if($select.hasClass("isboolean")){       			
		        	item="<option value='0'";
		        	if(one[$select.attr('name')]==0){
		        		$select.val('0');
		        	}
		        	if(one[$select.attr('name')]==1){
		        		$select.val('1');
		        	}
			}else{
				if(one[$select.attr('name')]){
					$select.val(one[$select.attr('name')]);
				}
			}
		});
}
//填充数据
//$f_div为父级div元素
function set_one_info($f_div,one){
	$f_div.find("input").each(function(){
		if($(this).attr("name")!=null){
			if($(this).attr("type")=="radio"){
				if($(this).val()==one[$(this).attr("name")]){
					$(this).prop("checked",true);
				}
			}else if ($(this).attr("type")=="file"){
			
			}else{
				if(one[$(this).attr("name")]!=null){
					if($(this).hasClass("date-type")){
						$(this).val(format_date(one[$(this).attr("name")]));
					} else if($(this).hasClass("datetime-type")){
						$(this).val(format_date_time(one[$(this).attr("name")]));		
					} else if($(this).hasClass("time-type")){
						$(this).val(format_time(one[$(this).attr("name")]));						
					} else if($(this).hasClass("percent-type")){
						$(this).val(format_percent(one[$(this).attr("name")]));						
					} else{
						$(this).val(one[$(this).attr("name")]);
					}
				}
			}			
		}
	});
	$f_div.find("select").not(".dictionary").each(function(){
		var name=$(this).attr('name');
		$(this).children("option").each(function(){
			if($(this).val()==one[name]){
				$(this).attr("selected", true);
			}
		});
	});
	$f_div.find("textarea").not(".dictionary").each(function(){
		if(one[$(this).attr("name")]!=null){
			if(one[$(this).attr("name")]!=null){
				$(this).val(one[$(this).attr("name")]);
			}
		}
	});
	$f_div.find("input[type='checkbox']").not(".dictionary").each(function(){
		if(one[$(this).attr("name")]!=null){
			if(one[$(this).attr("name")]!=null&&one[$(this).attr("name")]==1){
				$(this).attr("checked",true);
			}
		}
	});	
}
function select_get_option($select,url,key,show_value,the_key){
	$.ajax({
        type: "post",
        url: url,
        dataType: 'json',
        traditional:true,
        data:JSON.stringify({"directoryId":4}),
        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
        success: function (data, status) {
            if (data.total != 0) {
            	$.each(data.rows,function(index,value){
            		var item="";
            		if(the_key!=undefined&&the_key==value[key])            			
            			item="<option value='"+value[key]+"' selected>"+value[show_value]+"</option>";
            		else
            			item="<option value='"+value[key]+"'>"+value[show_value]+"</option>";
            		$select.append(item);
            	});
            }
        },
        error: function (data) {
        	console.log(data)
        }
    });
}
//判断表单必填字段是否为空
function has_null($f_div){
	var tab=false;
	$f_div.find(".not-null").each(function(){
		if(!$(this).is(':hidden')){
			$(this).find("input").each(function(){
				//alert($(this).attr('name'));
				// 屏蔽掉文件上传框架的问题
				if($(this).attr('name')!='file' &&  ($(this).val()==""||$(this).val()==null))
					tab=true;
			});
			$(this).find("select").each(function(){
				// 被禁用的原则不用考虑了
				if(!$(this).is(':disabled') && ($(this).val()==""||$(this).val()==null))
					tab=true;
			});
			$(this).find("textarea").each(function(){
				if($(this).val()==""||$(this).val()==null)
					tab=true;
			});
		}
	});
	if(tab)layer.msg("有必填项为空");
	return tab;
}
//自动搜多填充为空
function auto_not_matching($f_div){
	var tab=false;
	$f_div.find(".auto-not-null").each(function(){
		var color=$(this).css("backgroundColor");
		if(color!="rgb(255, 255, 255)"&&$(this).attr("readonly")!="readonly"){
			tab=true;
		}
	});
	if(tab)layer.msg("未选择提示框中明细！");
	return tab;
}
//表单转json
function formToJson(formObj){
	var o = {};
    var a = formObj.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
//日期layer
function inistal_data(start,end){
	//日期范围限制
    var start = {
        elem: start,
        format: 'YYYY/MM/DD',
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        zIndex:99999999,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: end,
        format: 'YYYY/MM/DD',
        max: '2099-06-16',
        istime: true,
        istoday: false,
        zIndex:99999999,
        choose: function (datas) {
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
}
function inistal_data_year(start,end){
	//日期范围限制
    var start = {
        elem: start,
        format: 'YYYY',
        max: '2099', //最大日期
        isdate: true,
        istoday: false,
        zIndex:99999999,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: end,
        format: 'YYYY',
        max: '2099',
        isdate: true,
        istoday: false,
        zIndex:99999999,
        choose: function (datas) {
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
}
//日期layer
function inistal_one_data($el){
	//日期范围限制
    var start = {
        elem: $el,
        format: 'yyyy-MM-dd',
        max: '2099-06-16', //最大日期
        calendar: true,
        istime: false,
        istoday: true,
        zIndex:99999999
    };
    laydate.render(start);    
}

function inistal_one_data_time($el){
	//日期范围限制
    var start = {
        elem: $el,
        format: 'yyyy-MM-dd HH:mm',
        max: '2099-06-16', //最大日期
        calendar: true,
        type: 'datetime',
        istoday: true,
        zIndex:99999999
    };
    laydate.render(start);    
}
function inistal_one_time($el){
	//日期范围限制
    var start = {
        elem: $el,
        format: 'HH:mm',
        calendar: true,
        type: 'time',
        istoday: true,
        zIndex:99999999
    };
    laydate.render(start);    
}
function inistal_one_month($el){
	//日期范围限制
    var start = {
        elem: $el,
        format: 'yyyy-MM',
        type:"month",
        zIndex:99999999
    };
    laydate.render(start);    
}
function inistal_one_month_china($el){
	//日期范围限制
    var start = {
        elem: $el,
        format: 'yyyy年M月',
        type:"month",
        zIndex:99999999
    };
    laydate.render(start);    
}
//子元素滚动到底，父元素不滚动
$.fn.scrollUnique = function() {
    return $(this).each(function() {
        var eventType = 'mousewheel';
        if (document.mozHidden !== undefined) {
            eventType = 'DOMMouseScroll';
        }
        $(this).on(eventType, function(event) {
            // 一些数据
            var scrollTop = this.scrollTop,
                scrollHeight = this.scrollHeight,
                height = this.clientHeight;

            var delta = (event.originalEvent.wheelDelta) ? event.originalEvent.wheelDelta : -(event.originalEvent.detail || 0);        

            if ((delta > 0 && scrollTop <= delta) || (delta < 0 && scrollHeight - height - scrollTop <= -1 * delta)) {
                // IE浏览器下滚动会跨越边界直接影响父级滚动，因此，临界时候手动边界滚动定位
                this.scrollTop = delta > 0? 0: scrollHeight;
                // 向上滚 || 向下滚
                event.preventDefault();
            }        
        });
    });    
};

//日期与时间戳转换
function format_date(timestamp)
{
  //timestamp是整数，否则要parseInt转换,不会出现少个0的情况

	var time = new Date(timestamp);
	var year = time.getFullYear();
	var month = time.getMonth()+1;
	var date = time.getDate();
	var hours = time.getHours();
	var minutes = time.getMinutes();
	var seconds = time.getSeconds();
	return year+'-'+add0(month)+'-'+add0(date);
	//+' '+add0(hours)+':'+add0(minutes)+':'+add0(seconds);
}

//日期与时间戳转换
function format_date_time(timestamp)
{
	// timestamp是整数，否则要parseInt转换,不会出现少个0的情况
	var time = new Date(timestamp);
	var year = time.getFullYear();
	var month = time.getMonth()+1;
	var date = time.getDate();
	var hours = time.getHours();
	var minutes = time.getMinutes();
	var seconds = time.getSeconds();
	return year + '-' + add0(month) + '-' + add0(date) + ' ' + add0(hours) + ':' + add0(minutes);
}

function format_time(timestamp)
{
  //timestamp是整数，否则要parseInt转换,不会出现少个0的情况

	var time = new Date(timestamp);
	var year = time.getFullYear();
	var month = time.getMonth()+1;
	var date = time.getDate();
	var hours = time.getHours();
	var minutes = time.getMinutes();
	var seconds = time.getSeconds();
	return add0(hours)+':'+add0(minutes);
	//+' '+add0(hours)+':'+add0(minutes)+':'+add0(seconds);
}

function format_percent(value)
{
	if (!value){
		return;
	}
	value=value*100;
	value=value.toFixed(2);
	value=value+"%"
	return value;
}

function add0(m){return m<10?'0'+m:m }
//员工自动补全
function initialize_bsSuggest_user(context,input_name,input_id){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/system/getUserListSearch?keyword=","job_no","name",{job_no: "工号",name:"名称"},["job_no","name"],true,bsSuggest_data_process_user,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//it人员自动补齐by：ZC
function initialize_bsSuggest_user2(context,input_name,input_id){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/organization/getItUserListSearch?keyword=","job_no","name",{job_no: "工号",name:"名称"},["job_no","name"],true,bsSuggest_data_process_user,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//组织部门自动补全
function initialize_bsSuggest_org(context,input_name,input_id,org_type){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/organization/getOrgListSearch?keyword=","org_code","org_name",{org_code: "组织编号",org_name:"组织名称"},["org_name"],true,bsSuggest_data_process_org,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}
//组织部门自动补全
function initialize_bsSuggest_org_type(context,input_name,input_id,org_type){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/organization/getOrgListSearch?org_type="+org_type+"&keyword=","org_code","org_name",{org_code: "编号",org_name:"名称"},["org_name"],true,bsSuggest_data_process_org,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}
//岗位自动补全
function initialize_bsSuggest_post(context,input_name,input_id){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/organization/getPostListSearch?keyword=","post_code","post_name",{post_code: "岗位编号",post_name:"岗位名称",post_grade_name:"岗等_组织"},["post_name","post_grade_name"],true,bsSuggest_data_process_post,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//搜索自动补全
function initialize_bsSuggest($el,url,idfield,keyfield,headername,effectiveFields,noKey,bsSuggest_data_process,AjaxParam){
	$el.bsSuggest({
	    url: url,
	    idField: idfield,                    //每组数据的哪个字段作为 data-id，优先级高于 indexId 设置（推荐）
	    keyField: keyfield,                   //每组数据的哪个字段作为输入框内容，优先级高于 indexKey 设置（推荐）
	    /* 搜索相关 */
	    //autoSelect: true,               //键盘向上/下方向键时，是否自动选择值
	    allowNoKeyword: noKey,           //是否允许无关键字时请求数据
	    getDataMethod: 'url',    //获取数据的方式，url：一直从url请求；data：从 options.data 获取；firstByUrl：第一次从Url获取全部数据，之后从options.data获取
	    delayUntilKeyup: true,         //获取数据的方式 为 firstByUrl 时，是否延迟到有输入时才请求数据
	    ignorecase: false,              //前端搜索匹配时，是否忽略大小写
	    effectiveFields: effectiveFields,            //有效显示于列表中的字段，非有效字段都会过滤，默认全部。
	    effectiveFieldsAlias:headername,
	    //effectiveFieldsAlias: {},       //有效字段的别名对象，用于 header 的显示
	    //searchFields: [],               //有效搜索字段，从前端搜索过滤数据时使用，但不一定显示在列表中。effectiveFields 配置字段也会用于搜索过滤

	    multiWord: false,               //以分隔符号分割的多关键字支持
	    //separator: ',',                 //多关键字支持时的分隔符，默认为半角逗号

	    /* UI */
	    autoDropup: false,              //选择菜单是否自动判断向上展开。设为 true，则当下拉菜单高度超过窗体，且向上方向不会被窗体覆盖，则选择菜单向上弹出
	    autoMinWidth: false,            //是否自动最小宽度，设为 false 则最小宽度不小于输入框宽度
	    showHeader: true,              //是否显示选择列表的 header。为 true 时，有效字段大于一列则显示表头
	    showBtn: false,                  //是否显示下拉按钮,源码css 内容被修改
	    inputBgColor: '',               //输入框背景色，当与容器背景色不同时，可能需要该项的配置
	    inputWarnColor: 'rgba(255,0,0,.1)', //输入框内容不是下拉列表选择时的警告色
	    listStyle: {
	        'padding-top': 0,
	        'max-height': '275px',
	        'max-width': '500px',
	        'overflow': 'auto',
	        'width': 'auto',
	        'transition': '0.3s',
	        '-webkit-transition': '0.3s',
	        '-moz-transition': '0.3s',
	        '-o-transition': '0.3s'
	    },                              //列表的样式控制
	    listAlign: 'left',              //提示列表对齐位置，left/right/auto
	    listHoverStyle: 'background: #07d; color:#fff', //提示框列表鼠标悬浮的样式
	    listHoverCSS: 'jhover',         //提示框列表鼠标悬浮的样式名称

	    /* key */
/*	    keyLeft: 37,                    //向左方向键，不同的操作系统可能会有差别，则自行定义
	    keyUp: 38,                      //向上方向键
	    keyRight: 39,                   //向右方向键
	    keyDown: 40,                    //向下方向键
	    keyEnter: 13,                   //回车键
*/	    fnAdjustAjaxParam:AjaxParam,
		fnPreprocessKeyword: function(keyword) {
		//请求数据前，对输入关键字作预处理
		    return  keyword;
		},
	    processData: bsSuggest_data_process		
	});
}
//搜索自动补全处理数据方法
//员工数据处理
function bsSuggest_data_process_user(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"account": json.rows[i]['account'],
        	"job_no": json.rows[i]['job_no'],
        	"name":json.rows[i]['name']
        });
    }
    return data;
}

//组织数据处理
function bsSuggest_data_process_org(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };

    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"org_code": json.rows[i]['org_code'],
        	"org_name":json.rows[i]['org_name']
        });
    }
    return data;
}
//组织数据处理
function bsSuggest_data_process_post(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };

    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"post_code": json.rows[i]['post_code'],
        	"post_name":json.rows[i]['post_name'],
        	"post_grade_name": json.rows[i]['post_grade_name'] + '_' 
        			 + json.rows[i]['org_name']
        });
    }
    return data;
}

/*//地址发送请求-数据补充
function ajaxparam_contact(keyword, opts) {
	//调整 ajax 请求参数方法，用于更多的请求配置需求。如对请求关键字作进一步处理、修改超时时间等
	var input_c_id= $("input[name='c_id']").val();
	if(input_c_id=="") input_c_id="kh";
    return {
        timeout: 10000,
        data: {
        	keyword:keyword,
            f_id: input_c_id
        }
    };
}*/
//日期格式化
Date.prototype.Format = function(fmt)   
{
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} 
/* 
l 按几个截取，word 需要截取的文字
*/
function spiltWord(l,word){
	var newStr = "";
	var totalLength = Math.ceil(word.length / l);
		for (var i = 0; i < totalLength; i++) {
				newStr += word.substring(i * l, i * l + l);
				if (i != (totalLength-1)){
				newStr+= '\n';
			}
		}
	return newStr;
}
function dealOneJson(one_Json_str){
	one_Json_str=one_Json_str.replace(/\r\n/g,"\\r\\n")  
    one_Json_str=one_Json_str.replace(/\n/g,"\\n");
	one_Json_str=one_Json_str.replace(/\s/g," ");
	var one_Json=JSON.parse(one_Json_str);
	return one_Json;
}