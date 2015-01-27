<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>点检数据查询</title>
<link href="${pageContext.request.contextPath}/css/easyui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/icon.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
<style type="text/css">
* {
	margin: 0 auto;
	font-family: "微软雅黑";
}

#mains {
	width: 80%;
	height: 650px;
}

label {
	margin: 5px;
	font-size:12px;
}

select {
	width: 150px;
	height: 23px;
	border: 1px solid #ccc
}

td {
	background: #fff;
	line-height: 20px;
	text-align: center;
	font-size:12px;
}
th{
	background:#13a3f7 ;
	font-size:14px;
	color:#fff;
}

#datas,#datas_history {
	margin: 10px 0 0 0;
}

legend {
	background: #999;
	border: 1px bold #000;
	color: #fff;
	font-size: 12px;
}
#form_history{
	margin: 5px 0 0 0 ;
}

select{
	border:1px solid #13a3f7;
	text-align:center;
}
option{
	text-align:left;
}
input{
	border:1px solid #13a3f7;
}

</style>
</head>
<body>
	<div id="mains">
		<p style="text-align: center;">点检数据查询</p>
		<fieldset>
			<legend style="text-align:left;">查询条件</legend>
			<form action="${pageContext.request.contextPath}/common.html?method=queryCheckData" method="post" autocomplete="on" id="queryForm">
				<label>部门 
				<select name="dept" id="depts">
					<option value="">------select------</option>
					<c:forEach items="${dept}" var="depts">
					<option value="<c:out value="${depts.code_}"/>"><c:out value="${depts.desc_}"/></option>
					</c:forEach>
				</select>
				<input type="hidden" name="deptname"/>
				</label> 
				<label>检测内容 
					<select name="aspect" id="aspect">
						<option  value="">----select----</option>
						<c:forEach items="${aspect}" var="depts">
						<option value="<c:out value="${depts.code_}"/>"><c:out value="${depts.desc_}"/></option>
						</c:forEach>
					</select>
					<input type="hidden" name="aspectname"/>
				</label> 
				<label>设备 
					<select name="devices" id="device">
						<option  value="">----select----</option>
						<c:forEach items="${devices}" var="depts">
						<option value="<c:out value="${depts.code_}"/>"><c:out value="${depts.desc_}"/></option>
						</c:forEach>
					</select>
					<input type="hidden" name="devicename"/>
				</label> 
				<label>检测方法 
					<select name="method" id="method">
						<option  value="">----select----</option>
						<c:forEach items="${method}" var="depts">
						<option value="<c:out value="${depts.code_}"/>"><c:out value="${depts.desc_}"/></option>
						</c:forEach>
					</select>
					<input type="hidden" name="methodname"/>
				</label> 
				<label>
					<button type="submit" id="checkQuery" style="background:#13a3f7;border:1px solid #000;color:#fff;">查询</button>
				</label>
			</form>
		</fieldset>
		<div id="datas">
			<fieldset>
				<legend style="text-align:left;">查询结果</legend>
				<table style="width: 100%; border =0; background: green; " cellspacing=1 id="tbl">
					<tr>
						<th rowspan="2">序号</th>
						<th rowspan="2">部门</th>
						<th rowspan="2">检测内容</th>
						<th rowspan="2">设备</th>
						<th rowspan="2">设备名称</th>
						<th rowspan="2">监测点</th>
						<th rowspan="2">检测方法</th>
						<th colspan="9">最近一次检测结果</th>
					</tr>
					<tr>
						<th>检测工单号</th>
						<th>检测时间</th>
						<th>单位</th>
						<th>检测结果</th>
						<th>标准值</th>
						<th>最小容忍值</th>
						<th>最大容忍值</th>
						<th>点检备注</th>
						<th>文件查看</th>
					</tr>
					<c:forEach items="${datas}" var="datas">
						<tr onclick="Open_Dialog('${datas.epo_date}','${datas.epo_object}','${datas.poi_point}','${datas.epo_aspect}')" class="test001">
							<td></td>
							<td>${datas.obj_mrc}</td>
							<td>${datas.asp_desc}</td>
							<td>${datas.epo_object}</td>
							<td>${datas.obj_desc}</td>
							<td>${datas.poi_desc}</td>
							<td>${datas.mth_desc}</td>
							<td>${datas.epo_event}</td>
							<td>${datas.epo_date}</td>
							<td>${datas.epo_uom}</td>
							<td>${datas.epo_finding}</td>
							<td>${datas.apo_nominal}</td>
							<td>${datas.epo_min}</td>
							<td>${datas.epo_max}</td>
							<td>${datas.epo_comment}</td>
							<td><a href="javascript:void()" onclick="queryImages(${datas.epo_event})" class="test002">${datas.epo_event}</a></td>
						</tr>
					</c:forEach>
					
				</table>
			</fieldset>
		</div>
		<div id="mydialog" style="display:none;padding:5px;width:830px;height:130px;" title="点检历史分析">
			<form action="${pageContext.request.contextPath}/common.html?method=reportResult" method="post" autocomplete="on" id="form_history"  target="_blank">
				<input type="hidden" name="aspect01" id="aspect01"/>
				<input type="hidden" name="objId" id="objId"/>
				<input type="hidden" name="point" id="point"/>
				<label>统计开始时间 
						<input type="text" required="required" name="startDate" class="Wdate"  id="startDate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				</label> 
				<label id="ends">结束开始时间
					<input type="text" required="required" name="endDate" class="Wdate"  id="endDate" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
				</label> 
			</form>
		</div>
	
	</div>
	
</body>
<script type="text/javascript">
	var obj = document.getElementById("tbl");
	var rowNum = '${len}';
	try{
		var j=2;
		for(var i=0;i<rowNum;i++){
			obj.rows[j].cells[0].style.textAlign = "center";
			obj.rows[j].cells[0].style.width = 20;
			obj.rows[j].cells[0].innerHTML = (i+1).toString();
			j++ ;
		}
	}catch(e){
		alert(e.description);
	}
	
	
	function Open_Dialog(v1,v2,v3,v4){
		$("#objId").val(v2);
		$("#point").val(v3);
		$("#aspect01").val(v4);
		$("#ends").empty();
		$("<input type='text' required='required' name='endDate' class='Wdate'  id='endDate' onfocus=\"WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'"+v1+"'})\"/>").appendTo("#ends");
		$('#mydialog').show();
		$('#mydialog').dialog({
		//collapsible: true,
		minimizable: true,
		maximizable: true,
		buttons: [{
		text: '分析',
		iconCls: 'icon-ok',
		handler: function() {
			$("#form_history").submit();
			$('#mydialog').dialog('close');
		}
		}, {
		text: '取消',
		handler: function() {
			 $('#mydialog').dialog('close');
		}
		}]
		});
	} 
	
	//阻止事件冒泡的通用函数
	function stopBubble(e){
		// 如果传入了事件对象，那么就是非ie浏览器
		if(e&&e.stopPropagation){
			//因此它支持W3C的stopPropagation()方法
			e.stopPropagation();
		}else{
			//否则我们使用ie的方法来取消事件冒泡
			window.event.cancelBubble = true;
		}
	}
	
	function queryImages(id,e){
		$('.test001').unbind(); //移除click
		stopBubble(e);
		window.open("${pageContext.request.contextPath}/common.html?method=queryImages&eventId="+id);
	}
	
		$(function(){
			
			$('#checkQuery').click(function(){
				var depts=$("#depts  option:selected").val();
				var aspect=$("#aspect  option:selected").val();
				var method=$("#method  option:selected").val();
				var device=$("#device  option:selected").val();
				$("input[name='deptname']").val(depts);
				$("input[name='aspectname']").val(aspect);
				$("input[name='methodname']").val(method);
				$("input[name='devicename']").val(device);
				$('#queryForm').submit();
			});
			
			
			
		});
</script>
</html>
