/**
 * Created by wkh on 2017-3-2
 * 这里的方法包含有表格列的通用格式化函数, 包括对日期、时间、货币类型的格式化
 * 
 */ 
//扩展Date的format方法 
Date.prototype.format = function (format) { 
	var o = { 
			"M+": this.getMonth() + 1, 
			"d+": this.getDate(), 
			"h+": this.getHours(), 
			"m+": this.getMinutes(), 
			"s+": this.getSeconds(), 
			"q+": Math.floor((this.getMonth() + 3) / 3), 
			"S": this.getMilliseconds() 
	} 
	if (/(y+)/.test(format)) { 
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length)); 
	} 
	for (var k in o) {
		if (new RegExp("(" + k + ")").test(format)) { 
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length)); 
		} 
	}
	return format; 
}

/**
 *转换日期对象为日期字符串
 * @param date 日期对象
 * @param isFull 是否为完整的日期数据,
 * 为true时, 格式如"2000-03-05 01:05:04"
 * 为false时, 格式如 "2000-03-05"
 * @return 符合要求的日期字符串
 */ 
function getSmpFormatDate(date, isFull) { 
	 var pattern = ""; 
	 if (isFull == true || isFull == undefined) {
		 pattern = "yyyy-MM-dd hh:mm"; 
	 } else { 
		 pattern = "yyyy-MM-dd"; 
	 } 
	 return getFormatDate(date, pattern);
}	

/**
 *转换日期对象为日期字符串
 * @param l long值
 * @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss
 * @return 符合要求的日期字符串
 */ 
function getFormatDate(date, pattern) { 
	 if (date == undefined) { 
		 date = new Date(); 
	 } 
	 if (pattern == undefined) { 
		 pattern = "yyyy-MM-dd hh:mm:ss"; 
	 } 
	 return date.format(pattern); 
}

function renderDate(value, row, index) {
	if (!value){
		return;
	}
	var dateType = new Date(value);
	var date = getSmpFormatDate(dateType, false);
	return date;
}

function renderDatetime(value, row, index) {
	if (!value){
		return;
	}
	var dateType = new Date(value);
	var date = getSmpFormatDate(dateType, true);
	return date;
}
function renderTime(value, row, index) {
	if (!value){
		return;
	}
	var dateType = new Date(value);
	var date = getSmpFormatDate(dateType, true);
	return date.substring(10,16);
}
function renderCurrency(value, row, index) {
	if (!value){
		return "0.00";
	}
	return value.toFixed(2);
}
function formatSum(data) {
	if(data.length==0){
		return "0";
	}
	var field=this.field;
	return sum_list[field]+"";
}
function formatAvg(data) {
	if(data.length==0)
		return "0";
	var field=this.field;
	return sum_list[field]+"";
}
function formatPageSum(data) {
	var count = 0;
	var field=this.field;
    for (var i in data) {
        count += Number(data[i][field]);
    }
    return count.toFixed(2)+"";
}
/**
 * Created by xc on 2017-7-12
 * 这里的方法包含有表格列的通用格式化函数
 * 
 */
function renderBoolean(value, row, index) {
	if (value==0){
		return "<i class=\"fa fa-close red-color\"></i>";
	}else if(value==1)
		return "<i class=\"fa fa-check green-color\"></i>";
	else
		return "-";
}
function renderInput(value, row, index) {
	if (!value){
		return "<input type='text'>";
	}
	return "<input type='text' value='"+value+"' style='text-align: right;'>";
}
function renderCheckBoxFooter(value, row, index) {					    	        
    return "<span id='checkbox_num'>0<span>";
}
function renderPercent(value, row, index) {
	if (!value){
		return "0.00%";
	}
	value=value*100;
	value=value.toFixed(2);
	value=value+"%"
	return value;
}
function renderMemo(value, row, index) {
	if (value){
		return "<button type='button' class='memo btn btn-white' data-item-id='"+row.item_id+"' style='height: 23px;width: 100%;padding:0px 0px;overflow: hidden;'>"+value;
	}
	return "<button type='button' class='memo btn btn-white' data-item-id='"+row.item_id+"' style='height: 23px;width: 100%;padding:0px 0px;overflow: hidden;'>——";
}
function renderBDMemo(value, row, index) {
	if (value){
		return "<button type='button' class='memo btn btn-white' data-item-id='"+row.sd_item_id+"' style='height: 23px;width: 100%;padding:0px 0px;overflow: hidden;'>"+value;
	}
	return "<button type='button' class='memo btn btn-white' data-item-id='"+row.sd_item_id+"' style='height: 23px;width: 100%;padding:0px 0px;overflow: hidden;'>——";
}
function renderInvUrl(value, row, index){
	if (value){
		return "<a href='/ld/bd/invoiceEdit?inv_id="+row.inv_id+"' target='_blank'>"+value+"</a>";
	}
	return value;
}
//function renderFlowUrl(value, row, index){
//	if (value){
//		if(true)
//			return "<a href='/hr/flow/oneExistFlowDetial?bill_code="+row.bill_code+"' target='_blank'>"+value+"</a>";
//	}
//	return value;
//}
function renderFlowUrl(value, row, index){
	if (value){
		if(true)
			if(row.bill_code==null){
				if(row.ap_id==null){
					return "<a href='/itoms/fc/flow/oneExistFlowDetial?bill_code="+row.pc_id+"' target='_blank'>"+value+"</a>";
				}
				return "<a href='/itoms/fc/flow/oneExistFlowDetial?bill_code="+row.ap_id+"' target='_blank'>"+value+"</a>";
			}else{
				return "<a href='/itoms/fc/flow/oneExistFlowDetial?bill_code="+row.bill_code+"' target='_blank'>"+value+"</a>";
			}
	}
	return value;
}
function renderAccount(value, row, index) {
	if (value=="00418"){
		return '<span style="background-color: red;">' + value + '</span>';
	}
	else
		return '<span>' + value + '</span>';
}
