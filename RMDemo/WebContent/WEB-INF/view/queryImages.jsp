<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>点检文件查看</title>
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
	text-align:center;
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
		<fieldset>
			<legend style="text-align:center;">文件查看</legend>
			<c:choose>
		       <c:when test="${size==0}">
		       	<p style="color:red;text-align:center;">无附件文件上传!</p>
		       </c:when>
		       <c:otherwise>
		       	<c:forEach items="${datas}" var="datas">
		       		<img alt="点检附件" src="testUpload/${datas.desc_}">
				</c:forEach>
		       </c:otherwise>
			</c:choose>
		</fieldset>
	</div>
</body>
</html>
