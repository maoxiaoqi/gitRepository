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
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
<style type="text/css">
	.datagrid-row{
		height:30px;
	}
	.datagrid-cell{
		font-size:15px;
	}
	* {
		font-family: "微软雅黑";
	}
/*
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
	font-size: 12px;
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
}

th {
	background: #a4d5f6;
	font-size: 14px;
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

#form_history {
	margin: 5px 0 0 0;
}
*/

</style>
</head>
<body>
	<div class="easyui-layout" fit="true" border="false">
		<div region="north" border="false" title="查询条件" style="height: 65px; overflow: hidden;">
			<form action="" id="queryForm">
				<table class="tableForm datagrid-toolbar"
					style="width: 100%; height: 100%">
					<tr>
						<th>检测内容</th>
						<td><input name="deptName" type="text" /></td>
						<th>设备</th>
						<td><input name="materialProject" type="text" /></td>
						<th>检测方法</th>
						<td><input name="materialName" type="text" /> 
						<a
							href="javascript:void(0);" class="easyui-linkbutton"
							id="queryByParrm">查询</a> <a href="javascript:void(0);"
							class="easyui-linkbutton" id="clearData">清空</a></td>
					</tr>
				</table>
			</form>
		</div>
		<div region="center" border="false">
			<table id="grids" style="height: 520px;"></table>
		</div>
	</div>
	<!-- 
<div id="mains">
		<p style="text-align: center;">点检数据查询</p>
		<fieldset>
			<legend>查询条件</legend>
			<form action="#" method="post" autocomplete="on">
				<label>检测内容 <select>
						<option value="volvo">Volvo</option>
						<option value="saab">Saab</option>
						<option value="opel">Opel</option>
						<option value="audi">Audi</option>
				</select>
				</label> <label>设备 <select>
						<option value="volvo">Volvo</option>
						<option value="saab">Saab</option>
						<option value="opel">Opel</option>
						<option value="audi">Audi</option>
				</select>
				</label> <label>检测方法 <select>
						<option value="volvo">Volvo</option>
						<option value="saab">Saab</option>
						<option value="opel">Opel</option>
						<option value="audi">Audi</option>
				</select>
				</label> 
				<label>
					<button type="submit" id="checkQuery">查询</button>
				</label>
			</form>
		</fieldset>
		<div id="datas">
			<fieldset>
				<legend>查询结果</legend>
				<table style="width: 100%; border =0; background: green;"
					cellspacing=1>
					<tr>
						<th>序号</th>
						<th>检测内容</th>
						<th>单位</th>
						<th>设备</th>
						<th>设备名称</th>
						<th>检测点</th>
						<th>检测方法</th>
					</tr>
				</table>
			</fieldset>
		</div>
		<div id="datas_history">
			<fieldset>
				<legend>最近一次点检结果</legend>
				<table style="width: 100%; border =0; background: green;"
					cellspacing=1>
					<tr>
						<th>检测工单号</th>
						<th>检测时间</th>
						<th>检测结果</th>
						<th>标准值</th>
						<th>最小容忍值</th>
						<th>最大容忍值</th>
						<th>点检备注</th>
					</tr>
				</table>
				<p style="margin:5px 0 0 0;font-size:12px;">点检历史分析</p>
				<form action="${pageContext.request.contextPath}/query.do?method=testReport" method="post" autocomplete="on" id="form_history">
					<label>纵坐标 
							<input type="text" required="required" name="yaxis"/>
					</label> 
					<label>统计开始时间 
							<input type="datetime" required="required" name="startDate"/>
					</label> 
					<label>结束开始时间
							<input type="datetime" required="required" name="endDate"/>
					</label> 
					<label>
							<button type="submit" id="checkReport">分析</button>
					</label>
				</form>
			</fieldset>
		</div>
	</div>
 -->



</body>
<script type="text/javascript">
	$(document).ready(function(){
	var grids;
	var detailGrids ;
	var editRow=undefined ;
	var editRows=undefined ;
	grid = $("#grids").datagrid({
		 url:'#',
		 title:'点检数据查询',
		 iconCls:'icon-save' ,
		 loadMsg:'数据加载中请稍后……',  
		 onLoadError : function() {
	           alert('数据加载失败!');
	       },
		 pagination:true ,
		 rownumbers:true,
		 pageSize:20,
		 pageList:[5,10,15,20,30,40,50,60,70,80,90,100],
		// fit:true,//
		 fitColumns:true,//设置滚动条
		 nowarp:false,//设置自动换行
		 idField:'seqkey',//记住选择项id，不受翻页影响（跨页删除）
		 columns:[[ 
					 {
						 title:'物资编号',
						 field:'seqkey',
						 align:'center',
						 hidden:true
			 		},
			 		{
			 			title:'检测内容',
						field:'deptName',
						align:'center'
				 	},
			 		{
			 			title:'单位',
						field:'materialProject',
						align:'center'
				 	},
			 		{
			 			title:'设备',
						field:'materialName',
						align:'center'
				 	},
			 		{
			 			title:'设备名称',
						field:'materialSn',
						align:'center'
				 	},{
			 			title:'检测点',
						field:'materialCount',
						align:'center'
				 	},{
			 			title:'检测方法',
						field:'unit',
						align:'center'
					},{
			 			title:'检测工单号',
						field:'unit',
						width:5 ,
						align:'center'
					}
				 	,{
			 			title:'检测时间',
						field:'unit',
						align:'center'
					}
				 	,{
			 			title:'检测结果',
						field:'unit',
						align:'center'
					}
				 	,{
			 			title:'标准值',
						field:'unit',
						align:'center'
					}
				 	,{
			 			title:'最小容忍值',
						field:'unit',
						align:'center'
					}
				 	,{
			 			title:'最大容忍值',
						field:'unit',
						align:'center'
					}
				 	,{
			 			title:'检测备注',
						field:'unit',
						align:'center'
					}
					 ]]
	});

	$("#queryByParrm").click(function(){
		$("#grids").datagrid("load",{
			deptName:$('#queryForm').find('[name=deptName]').val(),
			materialName:$('#queryForm').find('[name=materialName]').val(),
			materialProject:$('#queryForm').find('[name=materialProject]').val()
		});
	});

	$("#clearData").click(function(){
		$('#queryForm').find('input').val('') ;
		$("#grids").datagrid("load",{});
	});
	
	});
</script>
</html>
