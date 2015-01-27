<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HABS设备状态报表</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<style id="report1_style">
	.report1_1 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:solid;border-right-width:2px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_2 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_3 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:2px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_4 { text-align:left;vertical-align:middle;font-family:宋体;font-size:12px;color:#000000;font-weight:normal;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#FFFFFF;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_5 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_6 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:solid;border-right-width:2px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_7 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:solid;border-right-width:2px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_8 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#000000;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:2px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_9 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:2px;border-left-color:#000000;border-top-style:solid;border-top-width:2px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_10 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:2px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_11 { text-align:center;ve-rtical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:2px;border-top-color:#000000;border-right-style:solid;border-right-width:2px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_12 { text-align:left;vertical-align:middle;font-family:宋体;font-size:12px;color:#000000;font-weight:normal;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#000000;background-color:#FFFFFF;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_13 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#969696;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_14 { text-align:left;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_15 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#99CC00;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_16 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#FF0000;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_17 { text-align:center;vertical-align:middle;font-family:宋体;font-size:12px;color:#FFFFFF;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#99CC00;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_18 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#fff;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_19 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:2px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:solid;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_20 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_21 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_22 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#CCCCCC;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_23 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:2px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_24 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_25 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#000000;background-color:#969696;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_26 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#99CC00;line-height:15px;}
	.report1_27 { text-align:center;vertical-align:middle;font-family:宋体;font-size:16px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#969696;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_28 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:2px;border-left-color:#000000;border-top-style:solid;border-top-width:2px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#99CC00;line-height:15px;}
	.report1_29 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_30 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_31 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#FFFF00;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_32 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:2px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#FFFFFF;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_33 { text-align:left;vertical-align:middle;font-family:宋体;font-size:12px;color:#000000;font-weight:normal;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:2px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#FFFFFF;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_34 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_35 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:transparent;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_36 { text-align:center;vertical-align:middle;font-family:宋体;font-size:16px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#99CC00;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_37 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:solid;border-left-width:1px;border-left-color:#000000;border-top-style:solid;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#000000;background-color:#99CC00;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_38 { text-align:left;vertical-align:middle;font-family:宋体;font-size:12px;color:#000000;font-weight:normal;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:solid;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#FFFFFF;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_39 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#333333;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#333399;line-height:15px;}
	.report1_40 { text-align:center;vertical-align:middle;font-family:宋体;font-size:11px;color:#FFFFFF;font-weight:bold;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#969696;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_41 { text-align:center;vertical-align:middle;font-family:宋体;font-size:28px;color:#fff;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:none;border-right-width:1px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#13a3f7;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	.report1_42 { text-align:left;vertical-align:middle;font-family:宋体;font-size:12px;color:#000000;font-weight:normal;font-style:normal;text-decoration:none;border-left-style:none;border-left-width:1px;border-left-color:#000000;border-top-style:none;border-top-width:1px;border-top-color:#000000;border-right-style:solid;border-right-width:2px;border-right-color:#000000;border-bottom-style:none;border-bottom-width:1px;border-bottom-color:#000000;background-color:#FFFFFF;white-space:nowrap;overflow:hidden;word-break:keep-all;}
	*{
		margin:0 auto ;
	}
	#mains{
		width:80% ;
		height:650px;
		background:#fff;
	}
	
	.class_1{
		background-color:#969696 ;
		text-align:center;
		vertical-align:middle;
		font-family:宋体;
		font-size:11px;
		color:#333333;
		font-weight:bold;
		font-style:normal;
		text-decoration:none;
		border-left-style:none;
		border-left-width:1px;
		border-left-color:#000000;
		border-top-style:none;
		border-top-width:1px;
		border-top-color:#000000;
		border-right-style:none;
		border-right-width:1px;
		border-right-color:#000000;
		border-bottom-style:none;
		border-bottom-width:1px;
		border-bottom-color:#000000;
		white-space:nowrap;
		overflow:hidden;
		word-break:keep-all;
	}
	
	
	
	.class_2{
		background-color:#99cc00 ;
		text-align:center;
		vertical-align:middle;
		font-family:宋体;
		font-size:11px;
		color:#333333;
		font-weight:bold;
		font-style:normal;
		text-decoration:none;
		border-left-style:none;
		border-left-width:1px;
		border-left-color:#000000;
		border-top-style:none;
		border-top-width:1px;
		border-top-color:#000000;
		border-right-style:none;
		border-right-width:1px;
		border-right-color:#000000;
		border-bottom-style:none;
		border-bottom-width:1px;
		border-bottom-color:#000000;
		white-space:nowrap;
		overflow:hidden;
		word-break:keep-all;
	}
	.class_3{
		background-color:#FF0000 ;
		text-align:center;
		vertical-align:middle;
		font-family:宋体;
		font-size:11px;
		color:#333333;
		font-weight:bold;
		font-style:normal;
		text-decoration:none;
		border-left-style:none;
		border-left-width:1px;
		border-left-color:#000000;
		border-top-style:none;
		border-top-width:1px;
		border-top-color:#000000;
		border-right-style:none;
		border-right-width:1px;
		border-right-color:#000000;
		border-bottom-style:none;
		border-bottom-width:1px;
		border-bottom-color:#000000;
		white-space:nowrap;
		overflow:hidden;
		word-break:keep-all;
	}
	.class_4{
		background-color:#ffff00 ;
		text-align:center;
		vertical-align:middle;
		font-family:宋体;
		font-size:11px;
		color:#333333;
		font-weight:bold;
		font-style:normal;
		text-decoration:none;
		border-left-style:none;
		border-left-width:1px;
		border-left-color:#000000;
		border-top-style:none;
		border-top-width:1px;
		border-top-color:#000000;
		border-right-style:none;
		border-right-width:1px;
		border-right-color:#000000;
		border-bottom-style:none;
		border-bottom-width:1px;
		border-bottom-color:#000000;
		white-space:nowrap;
		overflow:hidden;
		word-break:keep-all;
	}
	.class_5{
		background-color:#ffff00 ;
		text-align:center;
		vertical-align:middle;
		font-family:宋体;
		font-size:11px;
		color:#333333;
		font-weight:bold;
		font-style:normal;
		text-decoration:none;
		border-left-style:none;
		border-left-width:1px;
		border-left-color:#000000;
		border-top-style:none;
		border-top-width:1px;
		border-top-color:#000000;
		border-right-style:none;
		border-right-width:1px;
		border-right-color:#000000;
		border-bottom-style:none;
		border-bottom-width:1px;
		border-bottom-color:#000000;
		white-space:nowrap;
		overflow:hidden;
		word-break:keep-all;
	}

	
	
</style>

</head>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<div id="mains">
<table id="report1" cellSpacing=0 cellPadding=0 style="width:892px;table-layout:fixed;border-collapse:collapse">
	<tr rn="1" height=14 style="height:14px;">
		<td rowSpan=3 colSpan=36 class="report1_41" style="font-family: '微软雅黑'">HBAS&nbsp;设备状态一览表</td>
	</tr>
	<tr rn="2" height=14 style="height:14px;">
	</tr>
	<tr rn="3" height=1 style="height:1px;">
	</tr>
	<tr rn="4" height=14 style="height:14px;">
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
		<td class="report1_12"></td>
	</tr>
	<tr rn="5" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td colSpan=5 class="report1_32"></td>
		<td class="report1_10"></td>
		<td colSpan=5 class="report1_32"></td>
		<td class="report1_11"></td>
	</tr>
	<tr rn="6" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${Test01==1}">
			<td colSpan=5 class="class_1">Test01</td>
			</c:when>
			<c:when test="${Test01==2}">
			<td colSpan=5 class="class_2">Test01</td>
			</c:when>
			<c:when test="${Test01==3}">
			<td colSpan=5  class="class_3">Test01</td>
			</c:when>
			<c:when test="${Test01==4}">
			<td colSpan=5  class="class_4">Test01</td>
			</c:when>
			<c:when test="${Test01==5}">
			<td colSpan=5 class="class_5">Test01</td>
			</c:when>
			<c:otherwise>
			<td colSpan=5 class="report1_13">Test01</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${Test02==1}">
			<td colSpan=5 class="class_1">Test02</td>
			</c:when>
			<c:when test="${Test02==2}">
			<td colSpan=5 class="class_2">Test02</td>
			</c:when>
			<c:when test="${Test02==3}">
			<td colSpan=5  class="class_3">Test02</td>
			</c:when>
			<c:when test="${Test02==4}">
			<td colSpan=5  class="class_4">Test02</td>
			</c:when>
			<c:when test="${Test02==5}">
			<td colSpan=5 class="class_5">Test02</td>
			</c:when>
			<c:otherwise>
			<td colSpan=5 class="report1_13">Test02</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="7" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_13"></td>
		<td class="report1_14"></td>
		<td colSpan=4 class="report1_4">Not&nbsp;Installed</td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${Test03==1}">
			<td colSpan=4 class="class_1">Test03</td>
			</c:when>
			<c:when test="${Test03==2}">
			<td colSpan=4 class="class_2">Test03</td>
			</c:when>
			<c:when test="${Test03==3}">
			<td colSpan=4  class="class_3">Test03</td>
			</c:when>
			<c:when test="${Test03==4}">
			<td colSpan=4  class="class_4">Test03</td>
			</c:when>
			<c:when test="${Test03==5}">
			<td colSpan=4 class="class_5">Test03</td>
			</c:when>
			<c:otherwise>
			<td colSpan=4 class="report1_13">Test03</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${Test04==1}">
			<td colSpan=4 class="class_1">Test04</td>
			</c:when>
			<c:when test="${Test04==2}">
			<td colSpan=4 class="class_2">Test04</td>
			</c:when>
			<c:when test="${Test04==3}">
			<td colSpan=4  class="class_3">Test04</td>
			</c:when>
			<c:when test="${Test04==4}">
			<td colSpan=4  class="class_4">Test04</td>
			</c:when>
			<c:when test="${Test04==5}">
			<td colSpan=4 class="class_5">Test04</td>
			</c:when>
			<c:otherwise>
			<td colSpan=4 class="report1_13">Test04</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="8" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD22==1}">
			<td colSpan=2 class="class_1">CVD22</td>
			</c:when>
			<c:when test="${CVD22==2}">
			<td colSpan=2 class="class_2">CVD22</td>
			</c:when>
			<c:when test="${CVD22==3}">
			<td colSpan=2  class="class_3">CVD22</td>
			</c:when>
			<c:when test="${CVD22==4}">
			<td colSpan=2  class="class_4">CVD22</td>
			</c:when>
			<c:when test="${CVD22==5}">
			<td colSpan=2 class="class_5">CVD22</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD22</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD23==1}">
			<td colSpan=2 class="class_1">CVD23</td>
			</c:when>
			<c:when test="${CVD23==2}">
			<td colSpan=2 class="class_2">CVD23</td>
			</c:when>
			<c:when test="${CVD23==3}">
			<td colSpan=2  class="class_3">CVD23</td>
			</c:when>
			<c:when test="${CVD23==4}">
			<td colSpan=2  class="class_4">CVD23</td>
			</c:when>
			<c:when test="${CVD23==5}">
			<td colSpan=2 class="class_5">CVD23</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD23</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD24==1}">
			<td colSpan=2 class="class_1">CVD24</td>
			</c:when>
			<c:when test="${CVD24==2}">
			<td colSpan=2 class="class_2">CVD24</td>
			</c:when>
			<c:when test="${CVD24==3}">
			<td colSpan=2  class="class_3">CVD24</td>
			</c:when>
			<c:when test="${CVD24==4}">
			<td colSpan=2  class="class_4">CVD24</td>
			</c:when>
			<c:when test="${CVD24==5}">
			<td colSpan=2 class="class_5">CVD24</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD24</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD25==1}">
			<td colSpan=2 class="class_1">CVD25</td>
			</c:when>
			<c:when test="${CVD25==2}">
			<td colSpan=2 class="class_2">CVD25</td>
			</c:when>
			<c:when test="${CVD25==3}">
			<td colSpan=2  class="class_3">CVD25</td>
			</c:when>
			<c:when test="${CVD25==4}">
			<td colSpan=2  class="class_4">CVD25</td>
			</c:when>
			<c:when test="${CVD25==5}">
			<td colSpan=2 class="class_5">CVD25</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD25</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="9" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_15"></td>
		<td class="report1_4"></td>
		<td colSpan=4 class="report1_4">Run</td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CAB22==1}">
			<td rowSpan=3 colSpan=2 class="class_1">CAB22</td>
			</c:when>
			<c:when test="${CAB22==2}">
			<td rowSpan=3 colSpan=2 class="class_2">CAB22</td>
			</c:when>
			<c:when test="${CAB22==3}">
			<td rowSpan=3 colSpan=2  class="class_3">CAB22</td>
			</c:when>
			<c:when test="${CAB22==4}">
			<td rowSpan=3 colSpan=2  class="class_4">CAB22</td>
			</c:when>
			<c:when test="${CAB22==5}">
			<td rowSpan=3 colSpan=2 class="class_5">CAB22</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">CAB22</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${IMP22==1}">
			<td rowSpan=3 colSpan=2 class="class_1">IMP22</td>
			</c:when>
			<c:when test="${IMP22==2}">
			<td rowSpan=3 colSpan=2 class="class_2">IMP22</td>
			</c:when>
			<c:when test="${IMP22==3}">
			<td rowSpan=3 colSpan=2  class="class_3">IMP22</td>
			</c:when>
			<c:when test="${IMP22==4}">
			<td rowSpan=3 colSpan=2  class="class_4">IMP22</td>
			</c:when>
			<c:when test="${IMP22==5}">
			<td rowSpan=3 colSpan=2 class="class_5">IMP22</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">IMP22</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="10" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD33==1}">
			<td colSpan=2 class="class_1">CVD33</td>
			</c:when>
			<c:when test="${CVD33==2}">
			<td colSpan=2 class="class_2">CVD33</td>
			</c:when>
			<c:when test="${CVD33==3}">
			<td colSpan=2  class="class_3">CVD33</td>
			</c:when>
			<c:when test="${CVD33==4}">
			<td colSpan=2  class="class_4">CVD33</td>
			</c:when>
			<c:when test="${CVD33==5}">
			<td colSpan=2 class="class_5">CVD33</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD33</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD34==1}">
			<td colSpan=2 class="class_1">CVD34</td>
			</c:when>
			<c:when test="${CVD34==2}">
			<td colSpan=2 class="class_2">CVD34</td>
			</c:when>
			<c:when test="${CVD34==3}">
			<td colSpan=2  class="class_3">CVD34</td>
			</c:when>
			<c:when test="${CVD34==4}">
			<td colSpan=2  class="class_4">CVD34</td>
			</c:when>
			<c:when test="${CVD34==5}">
			<td colSpan=2 class="class_5">CVD34</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD34</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD35==1}">
			<td colSpan=2 class="class_1">CVD35</td>
			</c:when>
			<c:when test="${CVD35==2}">
			<td colSpan=2 class="class_2">CVD35</td>
			</c:when>
			<c:when test="${CVD35==3}">
			<td colSpan=2  class="class_3">CVD35</td>
			</c:when>
			<c:when test="${CVD35==4}">
			<td colSpan=2  class="class_4">CVD35</td>
			</c:when>
			<c:when test="${CVD35==5}">
			<td colSpan=2 class="class_5">CVD35</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD35</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD36==1}">
			<td colSpan=2 class="class_1">CVD36</td>
			</c:when>
			<c:when test="${CVD36==2}">
			<td colSpan=2 class="class_2">CVD36</td>
			</c:when>
			<c:when test="${CVD36==3}">
			<td colSpan=2  class="class_3">CVD36</td>
			</c:when>
			<c:when test="${CVD36==4}">
			<td colSpan=2  class="class_4">CVD36</td>
			</c:when>
			<c:when test="${CVD36==5}">
			<td colSpan=2 class="class_5">CVD36</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD36</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="11" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_16"></td>
		<td class="report1_14"></td>
		<td colSpan=4 class="report1_4">Trouble&nbsp;Shooting</td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="12" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD44==1}">
			<td colSpan=2 class="class_1">CVD44</td>
			</c:when>
			<c:when test="${CVD44==2}">
			<td colSpan=2 class="class_2">CVD44</td>
			</c:when>
			<c:when test="${CVD44==3}">
			<td colSpan=2  class="class_3">CVD44</td>
			</c:when>
			<c:when test="${CVD44==4}">
			<td colSpan=2  class="class_4">CVD44</td>
			</c:when>
			<c:when test="${CVD44==5}">
			<td colSpan=2 class="class_5">CVD44</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD44</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD45==1}">
			<td colSpan=2 class="class_1">CVD45</td>
			</c:when>
			<c:when test="${CVD45==2}">
			<td colSpan=2 class="class_2">CVD45</td>
			</c:when>
			<c:when test="${CVD45==3}">
			<td colSpan=2  class="class_3">CVD45</td>
			</c:when>
			<c:when test="${CVD45==4}">
			<td colSpan=2  class="class_4">CVD45</td>
			</c:when>
			<c:when test="${CVD45==5}">
			<td colSpan=2 class="class_5">CVD45</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD45</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD46==1}">
			<td colSpan=2 class="class_1">CVD46</td>
			</c:when>
			<c:when test="${CVD46==2}">
			<td colSpan=2 class="class_2">CVD46</td>
			</c:when>
			<c:when test="${CVD46==3}">
			<td colSpan=2  class="class_3">CVD46</td>
			</c:when>
			<c:when test="${CVD46==4}">
			<td colSpan=2  class="class_4">CVD46</td>
			</c:when>
			<c:when test="${CVD46==5}">
			<td colSpan=2 class="class_5">CVD46</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD46</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD47==1}">
			<td colSpan=2 class="class_1">CVD47</td>
			</c:when>
			<c:when test="${CVD47==2}">
			<td colSpan=2 class="class_2">CVD47</td>
			</c:when>
			<c:when test="${CVD47==3}">
			<td colSpan=2  class="class_3">CVD47</td>
			</c:when>
			<c:when test="${CVD47==4}">
			<td colSpan=2  class="class_4">CVD47</td>
			</c:when>
			<c:when test="${CVD47==5}">
			<td colSpan=2 class="class_5">CVD47</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD47</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="13" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_31"></td>
		<td class="report1_4"></td>
		<td colSpan=8 class="report1_38">Planned&nbsp;work</td>
		<td class="report1_30"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CAB==1}">
			<td rowSpan=3 colSpan=2 class="class_1">CAB</td>
			</c:when>
			<c:when test="${CAB==2}">
			<td rowSpan=3 colSpan=2 class="class_2">CAB</td>
			</c:when>
			<c:when test="${CAB==3}">
			<td rowSpan=3 colSpan=2  class="class_3">CAB</td>
			</c:when>
			<c:when test="${CAB==4}">
			<td rowSpan=3 colSpan=2  class="class_4">CAB</td>
			</c:when>
			<c:when test="${CAB==5}">
			<td rowSpan=3 colSpan=2 class="class_5">CAB</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">CAB</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${IMP==1}">
			<td rowSpan=3 colSpan=2 class="class_1">IMP</td>
			</c:when>
			<c:when test="${IMP==2}">
			<td rowSpan=3 colSpan=2 class="class_2">IMP</td>
			</c:when>
			<c:when test="${IMP==3}">
			<td rowSpan=3 colSpan=2  class="class_3">IMP</td>
			</c:when>
			<c:when test="${IMP==4}">
			<td rowSpan=3 colSpan=2  class="class_4">IMP</td>
			</c:when>
			<c:when test="${IMP==5}">
			<td rowSpan=3 colSpan=2 class="class_5">IMP</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">IMP</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="14" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_14"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD66==1}">
			<td colSpan=2 class="class_1">CVD66</td>
			</c:when>
			<c:when test="${CVD66==2}">
			<td colSpan=2 class="class_2">CVD66</td>
			</c:when>
			<c:when test="${CVD66==3}">
			<td colSpan=2  class="class_3">CVD66</td>
			</c:when>
			<c:when test="${CVD66==4}">
			<td colSpan=2  class="class_4">CVD66</td>
			</c:when>
			<c:when test="${CVD66==5}">
			<td colSpan=2 class="class_5">CVD66</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD66</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD67==1}">
			<td colSpan=2 class="class_1">CVD67</td>
			</c:when>
			<c:when test="${CVD67==2}">
			<td colSpan=2 class="class_2">CVD67</td>
			</c:when>
			<c:when test="${CVD67==3}">
			<td colSpan=2  class="class_3">CVD67</td>
			</c:when>
			<c:when test="${CVD67==4}">
			<td colSpan=2  class="class_4">CVD67</td>
			</c:when>
			<c:when test="${CVD67==5}">
			<td colSpan=2 class="class_5">CVD67</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD67</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD68==1}">
			<td colSpan=2 class="class_1">CVD68</td>
			</c:when>
			<c:when test="${CVD68==2}">
			<td colSpan=2 class="class_2">CVD68</td>
			</c:when>
			<c:when test="${CVD68==3}">
			<td colSpan=2  class="class_3">CVD68</td>
			</c:when>
			<c:when test="${CVD68==4}">
			<td colSpan=2  class="class_4">CVD68</td>
			</c:when>
			<c:when test="${CVD68==5}">
			<td colSpan=2 class="class_5">CVD68</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD68</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD69==1}">
			<td colSpan=2 class="class_1">CVD69</td>
			</c:when>
			<c:when test="${CVD69==2}">
			<td colSpan=2 class="class_2">CVD69</td>
			</c:when>
			<c:when test="${CVD69==3}">
			<td colSpan=2  class="class_3">CVD69</td>
			</c:when>
			<c:when test="${CVD69==4}">
			<td colSpan=2  class="class_4">CVD69</td>
			</c:when>
			<c:when test="${CVD69==5}">
			<td colSpan=2 class="class_5">CVD69</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD69</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="15" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_18"></td>
		<td class="report1_4"></td>
		<td colSpan=4 class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="16" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${TC1==1}">
			<td colSpan=5 class="class_1">TC1</td>
			</c:when>
			<c:when test="${TC1==2}">
			<td colSpan=5 class="class_2">TC1</td>
			</c:when>
			<c:when test="${TC1==3}">
			<td colSpan=5  class="class_3">TC1</td>
			</c:when>
			<c:when test="${TC1==4}">
			<td colSpan=5  class="class_4">TC1</td>
			</c:when>
			<c:when test="${TC1==5}">
			<td colSpan=5 class="class_5">TC1</td>
			</c:when>
			<c:otherwise>
			<td colSpan=5 class="report1_13">TC1</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${TC2==1}">
			<td colSpan=5 class="class_1">TC2</td>
			</c:when>
			<c:when test="${TC2==2}">
			<td colSpan=5 class="class_2">TC2</td>
			</c:when>
			<c:when test="${TC2==3}">
			<td colSpan=5  class="class_3">TC2</td>
			</c:when>
			<c:when test="${TC2==4}">
			<td colSpan=5  class="class_4">TC2</td>
			</c:when>
			<c:when test="${TC2==5}">
			<td colSpan=5 class="class_5">TC2</td>
			</c:when>
			<c:otherwise>
			<td colSpan=5 class="report1_13">TC2</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="17" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
	</tr>
	<tr rn="18" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_9"></td>
		<td class="report1_8"></td>
		<td class="report1_8"></td>
		<td class="report1_8"></td>
		<td class="report1_8"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
	</tr>
	<tr rn="19" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${Test11==1}">
			<td colSpan=4  class="class_1">Test11</td>
			</c:when>
			<c:when test="${Test11==2}">
			<td colSpan=4  class="class_2">Test11</td>
			</c:when>
			<c:when test="${Test11==3}">
			<td colSpan=4   class="class_3">Test11</td>
			</c:when>
			<c:when test="${Test11==4}">
			<td colSpan=4   class="class_4">Test11</td>
			</c:when>
			<c:when test="${Test11==5}">
			<td colSpan=4  class="class_5">Test11</td>
			</c:when>
			<c:otherwise>
			<td colSpan=4  class="report1_13">Test11</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${Test12==1}">
			<td rowSpan=10  class="class_1">Test12</td>
			</c:when>
			<c:when test="${Test12==2}">
			<td rowSpan=10  class="class_2">Test12</td>
			</c:when>
			<c:when test="${Test12==3}">
			<td rowSpan=10   class="class_3">Test12</td>
			</c:when>
			<c:when test="${Test12==4}">
			<td rowSpan=10   class="class_4">Test12</td>
			</c:when>
			<c:when test="${Test12==5}">
			<td rowSpan=10  class="class_5">Test12</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=10  class="report1_13">Test12</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${Test14==1}">
			<td colSpan=4  class="class_1">Test14</td>
			</c:when>
			<c:when test="${Test14==2}">
			<td colSpan=4  class="class_2">Test14</td>
			</c:when>
			<c:when test="${Test14==3}">
			<td colSpan=4   class="class_3">Test14</td>
			</c:when>
			<c:when test="${Test14==4}">
			<td colSpan=4   class="class_4">Test14</td>
			</c:when>
			<c:when test="${Test14==5}">
			<td colSpan=4  class="class_5">Test14</td>
			</c:when>
			<c:otherwise>
			<td colSpan=4  class="report1_13">Test14</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${Test15==1}">
			<td rowSpan=10  class="class_1">Test15</td>
			</c:when>
			<c:when test="${Test15==2}">
			<td rowSpan=10  class="class_2">Test15</td>
			</c:when>
			<c:when test="${Test15==3}">
			<td rowSpan=10   class="class_3">Test15</td>
			</c:when>
			<c:when test="${Test15==4}">
			<td rowSpan=10   class="class_4">Test15</td>
			</c:when>
			<c:when test="${Test15==5}">
			<td rowSpan=10  class="class_5">Test15</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=10  class="report1_13">Test15</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="20" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${HTT1==1}">
			<td rowSpan=3 colSpan=2 class="class_1">HTT1</td>
			</c:when>
			<c:when test="${HTT1==2}">
			<td rowSpan=3 colSpan=2 class="class_2">HTT1</td>
			</c:when>
			<c:when test="${HTT1==3}">
			<td rowSpan=3 colSpan=2  class="class_3">HTT1</td>
			</c:when>
			<c:when test="${HTT1==4}">
			<td rowSpan=3 colSpan=2  class="class_4">HTT1</td>
			</c:when>
			<c:when test="${HTT1==5}">
			<td rowSpan=3 colSpan=2 class="class_5">HTT1</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">HTT1</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${HTT2==1}">
			<td rowSpan=3 colSpan=2 class="class_1">HTT2</td>
			</c:when>
			<c:when test="${HTT2==2}">
			<td rowSpan=3 colSpan=2 class="class_2">HTT2</td>
			</c:when>
			<c:when test="${HTT2==3}">
			<td rowSpan=3 colSpan=2  class="class_3">HTT2</td>
			</c:when>
			<c:when test="${HTT2==4}">
			<td rowSpan=3 colSpan=2  class="class_4">HTT2</td>
			</c:when>
			<c:when test="${HTT2==5}">
			<td rowSpan=3 colSpan=2 class="class_5">HTT2</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">HTT2</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="21" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CNC==1}">
			<td rowSpan=2 colSpan=2 class="class_1">CNC</td>
			</c:when>
			<c:when test="${CNC==2}">
			<td rowSpan=2 colSpan=2 class="class_2">CNC</td>
			</c:when>
			<c:when test="${CNC==3}">
			<td rowSpan=2 colSpan=2  class="class_3">CNC</td>
			</c:when>
			<c:when test="${CNC==4}">
			<td rowSpan=2 colSpan=2  class="class_4">CNC</td>
			</c:when>
			<c:when test="${CNC==5}">
			<td rowSpan=2 colSpan=2 class="class_5">CNC</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2 class="report1_13">CNC</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${HTT3==1}">
			<td rowSpan=3 colSpan=2 class="class_1">HTT3</td>
			</c:when>
			<c:when test="${HTT3==2}">
			<td rowSpan=3 colSpan=2 class="class_2">HTT3</td>
			</c:when>
			<c:when test="${HTT3==3}">
			<td rowSpan=3 colSpan=2  class="class_3">HTT3</td>
			</c:when>
			<c:when test="${HTT3==4}">
			<td rowSpan=3 colSpan=2  class="class_4">HTT3</td>
			</c:when>
			<c:when test="${HTT3==5}">
			<td rowSpan=3 colSpan=2 class="class_5">HTT3</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">HTT3</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${HTT4==1}">
			<td rowSpan=3 colSpan=2 class="class_1">HTT4</td>
			</c:when>
			<c:when test="${HTT4==2}">
			<td rowSpan=3 colSpan=2 class="class_2">HTT4</td>
			</c:when>
			<c:when test="${HTT4==3}">
			<td rowSpan=3 colSpan=2  class="class_3">HTT4</td>
			</c:when>
			<c:when test="${HTT4==4}">
			<td rowSpan=3 colSpan=2  class="class_4">HTT4</td>
			</c:when>
			<c:when test="${HTT4==5}">
			<td rowSpan=3 colSpan=2 class="class_5">HTT4</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2 class="report1_13">HTT4</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="22" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${DSG1==1}">
			<td rowSpan=2 colSpan=2 class="class_1">DSG1</td>
			</c:when>
			<c:when test="${DSG1==2}">
			<td rowSpan=2 colSpan=2 class="class_2">DSG1</td>
			</c:when>
			<c:when test="${DSG1==3}">
			<td rowSpan=2 colSpan=2  class="class_3">DSG1</td>
			</c:when>
			<c:when test="${DSG1==4}">
			<td rowSpan=2 colSpan=2  class="class_4">DSG1</td>
			</c:when>
			<c:when test="${DSG1==5}">
			<td rowSpan=2 colSpan=2 class="class_5">DSG1</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2 class="report1_13">DSG1</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="23" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="24" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${ENGRAVE==1}">
			<td rowSpan=2 colSpan=2  class="class_1">ENGRAVE</td>
			</c:when>
			<c:when test="${ENGRAVE==2}">
			<td rowSpan=2 colSpan=2  class="class_2">ENGRAVE</td>
			</c:when>
			<c:when test="${ENGRAVE==3}">
			<td rowSpan=2 colSpan=2   class="class_3">ENGRAVE</td>
			</c:when>
			<c:when test="${ENGRAVE==4}">
			<td rowSpan=2 colSpan=2   class="class_4">ENGRAVE</td>
			</c:when>
			<c:when test="${ENGRAVE==5}">
			<td rowSpan=2 colSpan=2  class="class_5">ENGRAVE</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2  class="report1_13">ENGRAVE</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="25" height=14 style="height:14px;">
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${HTT2==1}">
			<td rowSpan=3 colSpan=2  class="class_1">HTT2</td>
			</c:when>
			<c:when test="${HTT2==2}">
			<td rowSpan=3 colSpan=2  class="class_2">HTT2</td>
			</c:when>
			<c:when test="${HTT2==3}">
			<td rowSpan=3 colSpan=2   class="class_3">HTT2</td>
			</c:when>
			<c:when test="${HTT2==4}">
			<td rowSpan=3 colSpan=2   class="class_4">HTT2</td>
			</c:when>
			<c:when test="${HTT2==5}">
			<td rowSpan=3 colSpan=2  class="class_5">HTT2</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2  class="report1_13">HTT2</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${HTT1==1}">
			<td rowSpan=3 colSpan=2  class="class_1">HTT1</td>
			</c:when>
			<c:when test="${HTT1==2}">
			<td rowSpan=3 colSpan=2  class="class_2">HTT1</td>
			</c:when>
			<c:when test="${HTT1==3}">
			<td rowSpan=3 colSpan=2   class="class_3">HTT1</td>
			</c:when>
			<c:when test="${HTT1==4}">
			<td rowSpan=3 colSpan=2   class="class_4">HTT1</td>
			</c:when>
			<c:when test="${HTT1==5}">
			<td rowSpan=3 colSpan=2  class="class_5">HTT1</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2  class="report1_13">HTT1</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="26" height=14 style="height:14px;">
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${MIL1==1}">
			<td rowSpan=2 colSpan=2  class="class_1">MIL1</td>
			</c:when>
			<c:when test="${MIL1==2}">
			<td rowSpan=2 colSpan=2  class="class_2">MIL1</td>
			</c:when>
			<c:when test="${MIL1==3}">
			<td rowSpan=2 colSpan=2   class="class_3">MIL1</td>
			</c:when>
			<c:when test="${MIL1==4}">
			<td rowSpan=2 colSpan=2   class="class_4">MIL1</td>
			</c:when>
			<c:when test="${MIL1==5}">
			<td rowSpan=2 colSpan=2  class="class_5">MIL1</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2  class="report1_13">MIL1</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="27" height=14 style="height:14px;">
		<td rowSpan=3 colSpan=2 class="report1_13" style="border-bottom-style:solid;border-bottom-width:2px;border-right-style:solid;border-right-width:2px;">CMM<br>Room</td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CNC==1}">
			<td rowSpan=2 colSpan=2  class="class_1">CNC</td>
			</c:when>
			<c:when test="${CNC==2}">
			<td rowSpan=2 colSpan=2  class="class_2">CNC</td>
			</c:when>
			<c:when test="${CNC==3}">
			<td rowSpan=2 colSpan=2   class="class_3">CNC</td>
			</c:when>
			<c:when test="${CNC==4}">
			<td rowSpan=2 colSpan=2   class="class_4">CNC</td>
			</c:when>
			<c:when test="${CNC==5}">
			<td rowSpan=2 colSpan=2  class="class_5">CNC</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2  class="report1_13">CNC</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="28" height=14 style="height:14px;">
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="29" height=14 style="height:14px;">
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
	</tr>
	<tr rn="30" height=14 style="height:14px;">
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
		<td class="report1_9"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_10"></td>
		<td class="report1_11"></td>
	</tr>
	<tr rn="31" height=14 style="height:14px;">
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CRA005==1}">
			<td colSpan=4  class="class_1">CRA005</td>
			</c:when>
			<c:when test="${CRA005==2}">
			<td colSpan=4  class="class_2">CRA005</td>
			</c:when>
			<c:when test="${CRA005==3}">
			<td colSpan=4   class="class_3">CRA005</td>
			</c:when>
			<c:when test="${CRA005==4}">
			<td colSpan=4   class="class_4">CRA005</td>
			</c:when>
			<c:when test="${CRA005==5}">
			<td colSpan=4  class="class_5">CRA005</td>
			</c:when>
			<c:otherwise>
			<td colSpan=4  class="report1_13">天车CRA005</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td colSpan=5 class="report1_3" style="border-right-style:solid;border-right-width:2px;">Disc&nbsp;staging&nbsp;area</td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CRA004==1}">
			<td colSpan=4  class="class_1">CRA004</td>
			</c:when>
			<c:when test="${CRA004==2}">
			<td colSpan=4  class="class_2">CRA004</td>
			</c:when>
			<c:when test="${CRA004==3}">
			<td colSpan=4   class="class_3">CRA004</td>
			</c:when>
			<c:when test="${CRA004==4}">
			<td colSpan=4   class="class_4">CRA004</td>
			</c:when>
			<c:when test="${CRA004==5}">
			<td colSpan=4  class="class_5">CRA004</td>
			</c:when>
			<c:otherwise>
			<td colSpan=4  class="report1_13">CRA004</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CRA003==1}">
			<td colSpan=4  class="class_1">CRA003</td>
			</c:when>
			<c:when test="${CRA003==2}">
			<td colSpan=4  class="class_2">CRA003</td>
			</c:when>
			<c:when test="${CRA003==3}">
			<td colSpan=4   class="class_3">CRA003</td>
			</c:when>
			<c:when test="${CRA003==4}">
			<td colSpan=4   class="class_4">CRA003</td>
			</c:when>
			<c:when test="${CRA003==5}">
			<td colSpan=4  class="class_5">CRA003</td>
			</c:when>
			<c:otherwise>
			<td colSpan=4  class="report1_13">CRA003</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="32" height=14 style="height:14px;">
		<td class="report1_3"></td>
		<td class="report1_24"></td>
		<td class="report1_24"></td>
		<td class="report1_24"></td>
		<td class="report1_24"></td>
		<td class="report1_7"></td>
		<td class="report1_33"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_42"></td>
		<td class="report1_3"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_4"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CRA001==1}">
			<td colSpan=5 colSpan=2  class="class_1">CRA001</td>
			</c:when>
			<c:when test="${CRA001==2}">
			<td colSpan=5 colSpan=2  class="class_2">CRA001</td>
			</c:when>
			<c:when test="${CRA001==3}">
			<td colSpan=5 colSpan=2   class="class_3">CRA001</td>
			</c:when>
			<c:when test="${CRA001==4}">
			<td colSpan=5 colSpan=2   class="class_4">CRA001</td>
			</c:when>
			<c:when test="${CRA001==5}">
			<td colSpan=5 colSpan=2  class="class_5">CRA001</td>
			</c:when>
			<c:otherwise>
			<td colSpan=5 colSpan=2  class="report1_13">CRA001</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${TC3==1}">
			<td colSpan=5 colSpan=2  class="class_1">TC3</td>
			</c:when>
			<c:when test="${TC3==2}">
			<td colSpan=5 colSpan=2  class="class_2">TC3</td>
			</c:when>
			<c:when test="${TC3==3}">
			<td colSpan=5 colSpan=2   class="class_3">TC3</td>
			</c:when>
			<c:when test="${TC3==4}">
			<td colSpan=5 colSpan=2   class="class_4">TC3</td>
			</c:when>
			<c:when test="${TC3==5}">
			<td colSpan=5 colSpan=2  class="class_5">TC3</td>
			</c:when>
			<c:otherwise>
			<td colSpan=5 colSpan=2  class="report1_13">TC3</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="33" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<c:choose>
			<c:when test="${AO1==1}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_1">AO1</td>
			</c:when>
			<c:when test="${AO1==2}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_2">AO1</td>
			</c:when>
			<c:when test="${AO1==3}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_3">AO1</td>
			</c:when>
			<c:when test="${AO1==4}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_4">AO1</td>
			</c:when>
			<c:when test="${AO1==5}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_5">AO1</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="report1_13">AO1</td>
			</c:otherwise>  
		</c:choose>
		<td colSpan=2></td>
		<td class="report1_1"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="34" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<td class="report1_29"></td>
		<td class="report1_20"></td>
		<td class="report1_7"></td>
		<td colSpan=5 class="report1_9" style="border-right-style:solid;border-right-width:2px;">paintroom</td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CAB1==1}">
			<td rowSpan=3 colSpan=2  class="class_1">CAB1</td>
			</c:when>
			<c:when test="${CAB1==2}">
			<td rowSpan=3 colSpan=2  class="class_2">CAB1</td>
			</c:when>
			<c:when test="${CAB1==3}">
			<td rowSpan=3 colSpan=2   class="class_3">CAB1</td>
			</c:when>
			<c:when test="${CAB1==4}">
			<td rowSpan=3 colSpan=2   class="class_4">CAB1</td>
			</c:when>
			<c:when test="${CAB1==5}">
			<td rowSpan=3 colSpan=2  class="class_5">CAB1</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2  class="report1_13">CAB1</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${IMP2==1}">
			<td rowSpan=3 colSpan=2  class="class_1">IMP2</td>
			</c:when>
			<c:when test="${IMP2==2}">
			<td rowSpan=3 colSpan=2  class="class_2">IMP2</td>
			</c:when>
			<c:when test="${IMP2==3}">
			<td rowSpan=3 colSpan=2   class="class_3">IMP2</td>
			</c:when>
			<c:when test="${IMP2==4}">
			<td rowSpan=3 colSpan=2   class="class_4">IMP2</td>
			</c:when>
			<c:when test="${IMP2==5}">
			<td rowSpan=3 colSpan=2  class="class_5">IMP2</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=3 colSpan=2  class="report1_13">IMP2</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD1==1}">
			<td colSpan=2 class="class_1">CVD1</td>
			</c:when>
			<c:when test="${CVD1==2}">
			<td colSpan=2 class="class_2">CVD1</td>
			</c:when>
			<c:when test="${CVD1==3}">
			<td colSpan=2  class="class_3">CVD1</td>
			</c:when>
			<c:when test="${CVD1==4}">
			<td colSpan=2  class="class_4">CVD1</td>
			</c:when>
			<c:when test="${CVD1==5}">
			<td colSpan=2 class="class_5">CVD1</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD1</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD8==1}">
			<td colSpan=2 class="class_1">CVD8</td>
			</c:when>
			<c:when test="${CVD8==2}">
			<td colSpan=2 class="class_2">CVD8</td>
			</c:when>
			<c:when test="${CVD8==3}">
			<td colSpan=2  class="class_3">CVD8</td>
			</c:when>
			<c:when test="${CVD8==4}">
			<td colSpan=2  class="class_4">CVD8</td>
			</c:when>
			<c:when test="${CVD8==5}">
			<td colSpan=2 class="class_5">CVD8</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD8</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD9==1}">
			<td colSpan=2 class="class_1">CVD9</td>
			</c:when>
			<c:when test="${CVD9==2}">
			<td colSpan=2 class="class_2">CVD9</td>
			</c:when>
			<c:when test="${CVD9==3}">
			<td colSpan=2  class="class_3">CVD9</td>
			</c:when>
			<c:when test="${CVD9==4}">
			<td colSpan=2  class="class_4">CVD9</td>
			</c:when>
			<c:when test="${CVD9==5}">
			<td colSpan=2 class="class_5">CVD9</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD9</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD16==1}">
			<td colSpan=2 class="class_1">CVD16</td>
			</c:when>
			<c:when test="${CVD16==2}">
			<td colSpan=2 class="class_2">CVD16</td>
			</c:when>
			<c:when test="${CVD16==3}">
			<td colSpan=2  class="class_3">CVD16</td>
			</c:when>
			<c:when test="${CVD16==4}">
			<td colSpan=2  class="class_4">CVD16</td>
			</c:when>
			<c:when test="${CVD16==5}">
			<td colSpan=2 class="class_5">CVD16</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD16</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="35" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<c:choose>
			<c:when test="${AO2==1}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_1">AO2</td>
			</c:when>
			<c:when test="${AO2==2}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_2">AO2</td>
			</c:when>
			<c:when test="${AO2==3}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_3">AO2</td>
			</c:when>
			<c:when test="${AO2==4}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_4">AO2</td>
			</c:when>
			<c:when test="${AO2==5}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_5">AO2</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="report1_13">AO2</td>
			</c:otherwise>  
		</c:choose>
		<td colSpan=2></td>
		<td class="report1_1"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="36" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<td class="report1_29"></td>
		<td class="report1_20"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_13">1</td>
		<td class="report1_2"></td>
		<td class="report1_13">4</td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD2==1}">
			<td colSpan=2 class="class_1">CVD2</td>
			</c:when>
			<c:when test="${CVD2==2}">
			<td colSpan=2 class="class_2">CVD2</td>
			</c:when>
			<c:when test="${CVD2==3}">
			<td colSpan=2  class="class_3">CVD2</td>
			</c:when>
			<c:when test="${CVD2==4}">
			<td colSpan=2  class="class_4">CVD2</td>
			</c:when>
			<c:when test="${CVD2==5}">
			<td colSpan=2 class="class_5">CVD2</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD2</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD7==1}">
			<td colSpan=2 class="class_1">CVD7</td>
			</c:when>
			<c:when test="${CVD7==2}">
			<td colSpan=2 class="class_2">CVD7</td>
			</c:when>
			<c:when test="${CVD7==3}">
			<td colSpan=2  class="class_3">CVD7</td>
			</c:when>
			<c:when test="${CVD7==4}">
			<td colSpan=2  class="class_4">CVD7</td>
			</c:when>
			<c:when test="${CVD7==5}">
			<td colSpan=2 class="class_5">CVD7</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD7</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD10==1}">
			<td colSpan=2 class="class_1">CVD10</td>
			</c:when>
			<c:when test="${CVD10==2}">
			<td colSpan=2 class="class_2">CVD10</td>
			</c:when>
			<c:when test="${CVD10==3}">
			<td colSpan=2  class="class_3">CVD10</td>
			</c:when>
			<c:when test="${CVD10==4}">
			<td colSpan=2  class="class_4">CVD10</td>
			</c:when>
			<c:when test="${CVD10==5}">
			<td colSpan=2 class="class_5">CVD10</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD10</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD15==1}">
			<td colSpan=2 class="class_1">CVD15</td>
			</c:when>
			<c:when test="${CVD15==2}">
			<td colSpan=2 class="class_2">CVD15</td>
			</c:when>
			<c:when test="${CVD15==3}">
			<td colSpan=2  class="class_3">CVD15</td>
			</c:when>
			<c:when test="${CVD15==4}">
			<td colSpan=2  class="class_4">CVD15</td>
			</c:when>
			<c:when test="${CVD15==5}">
			<td colSpan=2 class="class_5">CVD15</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD15</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="37" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<c:choose>
			<c:when test="${AO3==1}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_1">AO3</td>
			</c:when>
			<c:when test="${AO3==2}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_2">AO3</td>
			</c:when>
			<c:when test="${AO3==3}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_3">AO3</td>
			</c:when>
			<c:when test="${AO3==4}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_4">AO3</td>
			</c:when>
			<c:when test="${AO3==5}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_5">AO3</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="report1_13">AO3</td>
			</c:otherwise>  
		</c:choose>
		<td colSpan=2></td>
		<td class="report1_1"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="38" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<td class="report1_29"></td>
		<td class="report1_20"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_13">2</td>
		<td class="report1_2"></td>
		<td class="report1_13">3</td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD3==1}">
			<td colSpan=2 class="class_1">CVD3</td>
			</c:when>
			<c:when test="${CVD3==2}">
			<td colSpan=2 class="class_2">CVD3</td>
			</c:when>
			<c:when test="${CVD3==3}">
			<td colSpan=2  class="class_3">CVD3</td>
			</c:when>
			<c:when test="${CVD3==4}">
			<td colSpan=2  class="class_4">CVD3</td>
			</c:when>
			<c:when test="${CVD3==5}">
			<td colSpan=2 class="class_5">CVD3</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD3</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD6==1}">
			<td colSpan=2 class="class_1">CVD6</td>
			</c:when>
			<c:when test="${CVD6==2}">
			<td colSpan=2 class="class_2">CVD6</td>
			</c:when>
			<c:when test="${CVD6==3}">
			<td colSpan=2  class="class_3">CVD6</td>
			</c:when>
			<c:when test="${CVD6==4}">
			<td colSpan=2  class="class_4">CVD6</td>
			</c:when>
			<c:when test="${CVD6==5}">
			<td colSpan=2 class="class_5">CVD6</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD6</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD11==1}">
			<td colSpan=2 class="class_1">CVD11</td>
			</c:when>
			<c:when test="${CVD11==2}">
			<td colSpan=2 class="class_2">CVD11</td>
			</c:when>
			<c:when test="${CVD11==3}">
			<td colSpan=2  class="class_3">CVD11</td>
			</c:when>
			<c:when test="${CVD11==4}">
			<td colSpan=2  class="class_4">CVD11</td>
			</c:when>
			<c:when test="${CVD11==5}">
			<td colSpan=2 class="class_5">CVD11</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD11</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD14==1}">
			<td colSpan=2 class="class_1">CVD14</td>
			</c:when>
			<c:when test="${CVD14==2}">
			<td colSpan=2 class="class_2">CVD14</td>
			</c:when>
			<c:when test="${CVD14==3}">
			<td colSpan=2  class="class_3">CVD14</td>
			</c:when>
			<c:when test="${CVD14==4}">
			<td colSpan=2  class="class_4">CVD14</td>
			</c:when>
			<c:when test="${CVD14==5}">
			<td colSpan=2 class="class_5">CVD14</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD14</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="39" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<c:choose>
			<c:when test="${A04==1}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_1">A04</td>
			</c:when>
			<c:when test="${A04==2}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_2">A04</td>
			</c:when>
			<c:when test="${A04==3}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_3">A04</td>
			</c:when>
			<c:when test="${A04==4}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;"  class="class_4">A04</td>
			</c:when>
			<c:when test="${A04==5}">
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="class_5">A04</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2 style="border-bottom-style:solid;border-right-style:solid;" class="report1_13">A04</td>
			</c:otherwise>  
		</c:choose>
		<td colSpan=2></td>
		<td class="report1_1"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CAB2==1}">
			<td colSpan=2 rowspan=3 class="class_1">CAB2</td>
			</c:when>
			<c:when test="${CAB2==2}">
			<td colSpan=2 rowspan=3 class="class_2">CAB2</td>
			</c:when>
			<c:when test="${CAB2==3}">
			<td colSpan=2 rowspan=3  class="class_3">CAB2</td>
			</c:when>
			<c:when test="${CAB2==4}">
			<td colSpan=2 rowspan=3  class="class_4">CAB2</td>
			</c:when>
			<c:when test="${CAB2==5}">
			<td colSpan=2 rowspan=3 class="class_5">CAB2</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 rowspan=3 class="report1_13">CAB2</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<c:choose>
	    <c:when test="${IMP1==1}">
	    	<td rowSpan=3 colSpan=2 class="class_1" id="IMP1">IMP1</td>
	    </c:when>
	    <c:when test="${IMP1==2}">
	    	<td rowSpan=3 colSpan=2 class="class_2" id="IMP1">IMP1</td>
	    </c:when>
	    <c:when test="${IMP1==3}">
	    	<td rowSpan=3 colSpan=2 class="class_3" id="IMP1">IMP1</td>
	    </c:when>
	    <c:when test="${IMP1==4}">
	    	<td rowSpan=3 colSpan=2 class="class_4" id="IMP1">IMP1</td>
	    </c:when>
	    <c:when test="${IMP1==5}">
	    	<td rowSpan=3 colSpan=2 class="class_5" id="IMP1">IMP1</td>
	    </c:when>
	    <c:otherwise>
	    	<td rowSpan=3 colSpan=2 class="report1_13" id="IMP1">IMP1</td>
	    </c:otherwise>  
	    </c:choose>
		
		
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="40" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<td class="report1_29"></td>
		<td class="report1_20"></td>
		<td class="report1_7"></td>
		<td colSpan=5 class="report1_9" style="border-right-style:solid;border-right-width:2px;">Rivetroom</td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
			<c:when test="${CVD4==1}">
			<td colSpan=2   class="class_1">CVD4</td>
			</c:when>
			<c:when test="${CVD4==2}">
			<td colSpan=2   class="class_2">CVD4</td>
			</c:when>
			<c:when test="${CVD4==3}">
			<td colSpan=2    class="class_3">CVD4</td>
			</c:when>
			<c:when test="${CVD4==4}">
			<td colSpan=2    class="class_4">CVD4</td>
			</c:when>
			<c:when test="${CVD4==5}">
			<td colSpan=2   class="class_5">CVD4</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2   class="report1_13">CVD4</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD5==1}">
			<td colSpan=2   class="class_1">CVD5</td>
			</c:when>
			<c:when test="${CVD5==2}">
			<td colSpan=2   class="class_2">CVD5</td>
			</c:when>
			<c:when test="${CVD5==3}">
			<td colSpan=2    class="class_3">CVD5</td>
			</c:when>
			<c:when test="${CVD5==4}">
			<td colSpan=2    class="class_4">CVD5</td>
			</c:when>
			<c:when test="${CVD5==5}">
			<td colSpan=2   class="class_5">CVD5</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2   class="report1_13">CVD5</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD12==1}">
			<td colSpan=2 class="class_1">CVD12</td>
			</c:when>
			<c:when test="${CVD12==2}">
			<td colSpan=2 class="class_2">CVD12</td>
			</c:when>
			<c:when test="${CVD12==3}">
			<td colSpan=2  class="class_3">CVD12</td>
			</c:when>
			<c:when test="${CVD12==4}">
			<td colSpan=2  class="class_4">CVD12</td>
			</c:when>
			<c:when test="${CVD12==5}">
			<td colSpan=2 class="class_5">CVD12</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD12</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_2"></td>
		<c:choose>
			<c:when test="${CVD13==1}">
			<td colSpan=2 class="class_1">CVD13</td>
			</c:when>
			<c:when test="${CVD13==2}">
			<td colSpan=2 class="class_2">CVD13</td>
			</c:when>
			<c:when test="${CVD13==3}">
			<td colSpan=2  class="class_3">CVD13</td>
			</c:when>
			<c:when test="${CVD13==4}">
			<td colSpan=2  class="class_4">CVD13</td>
			</c:when>
			<c:when test="${CVD13==5}">
			<td colSpan=2 class="class_5">CVD13</td>
			</c:when>
			<c:otherwise>
			<td colSpan=2 class="report1_13">CVD13</td>
			</c:otherwise>  
		</c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="41" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<c:choose>
			<c:when test="${A05==1}">
			<td rowSpan=2 colSpan=2  style="border-bottom-style:solid;border-right-style:solid;" class="class_1">A05</td>
			</c:when>
			<c:when test="${A05==2}">
			<td rowSpan=2 colSpan=2  style="border-bottom-style:solid;border-right-style:solid;" class="class_2">A05</td>
			</c:when>
			<c:when test="${A05==3}">
			<td rowSpan=2 colSpan=2  style="border-bottom-style:solid;border-right-style:solid;"  class="class_3">A05</td>
			</c:when>
			<c:when test="${A05==4}">
			<td rowSpan=2 colSpan=2  style="border-bottom-style:solid;border-right-style:solid;"  class="class_4">A05</td>
			</c:when>
			<c:when test="${A05==5}">
			<td rowSpan=2 colSpan=2  style="border-bottom-style:solid;border-right-style:solid;" class="class_5">A05</td>
			</c:when>
			<c:otherwise>
			<td rowSpan=2 colSpan=2  style="border-bottom-style:solid;border-right-style:solid;" class="report1_13">A05</td>
			</c:otherwise>  
		</c:choose>
		<td colSpan=2></td>
		<td class="report1_1"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
	</tr>
	<tr rn="42" height=14 style="height:14px;">
		<td class="report1_19"></td>
		<td class="report1_35"></td>
		<td class="report1_34"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<c:choose>
		    <c:when test="${RVT==1}">
		    	<td colSpan=3 class="class_1">RVT</td>
		    </c:when>
		    <c:when test="${RVT==2}">
		    	<td colSpan=3  class="class_2">RVT</td>
		    </c:when>
		    <c:when test="${RVT==3}">
		    	<td colSpan=3  class="class_3">RVT</td>
		    </c:when>
		    <c:when test="${RVT==4}">
		    	<td colSpan=3  class="class_4">RVT</td>
		    </c:when>
		    <c:when test="${RVT==5}">
		    	<td colSpan=3  class="class_5">RVT</td>
		    </c:when>
		    <c:otherwise>
		    	<td colSpan=3 class="report1_13">RVT</td>
		    </c:otherwise>  
    	</c:choose>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_2"></td>
		<td class="report1_7"></td>
		<td class="report1_3"></td>
		
		<c:choose>
		    <c:when test="${CRA002==1}">
		    	<td colSpan=5 class="class_1">CRA002</td>
		    </c:when>
		    <c:when test="${CRA002==2}">
		    	<td colSpan=5  class="class_2">CRA002</td>
		    </c:when>
		    <c:when test="${CRA002==3}">
		    	<td colSpan=5  class="class_3">CRA002</td>
		    </c:when>
		    <c:when test="${CRA002==4}">
		    	<td colSpan=5  class="class_4">CRA002</td>
		    </c:when>
		    <c:when test="${CRA002==5}">
		    	<td colSpan=5  class="class_5">CRA002</td>
		    </c:when>
		    <c:otherwise>
		    	<td colSpan=5 class="report1_13">CRA002</td>
		    </c:otherwise>  
	    </c:choose>
		
		<td class="report1_2"></td>
		<c:choose>
		    <c:when test="${Test==1}">
		    	<td colSpan=5 class="class_1">Test</td>
		    </c:when>
		    <c:when test="${Test==2}">
		    	<td colSpan=5  class="class_2">Test</td>
		    </c:when>
		    <c:when test="${Test==3}">
		    	<td colSpan=5  class="class_3">Test</td>
		    </c:when>
		    <c:when test="${Test==4}">
		    	<td colSpan=5  class="class_4">Test</td>
		    </c:when>
		    <c:when test="${Test==5}">
		    	<td colSpan=5  class="class_5">Test</td>
		    </c:when>
		    <c:otherwise>
		    	<td colSpan=5 class="report1_13">Test</td>
		    </c:otherwise>  
	    </c:choose>
		<td class="report1_7"></td>
	</tr>
	<tr rn="43" height=14 style="height:14px;">
		<td class="report1_23"></td>
		<td class="report1_21"></td>
		<td class="report1_21"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
		<td class="report1_23"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_5"></td>
		<td class="report1_6"></td>
	</tr>
</table>
</div>
</body>
<script type="text/javascript">
	
</script>
</html>
