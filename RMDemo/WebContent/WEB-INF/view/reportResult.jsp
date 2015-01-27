<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>点检历史分析结果</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/esl.js"></script>
</head>
<body>
	<div id="main" style="height: 500px; border: 1px solid #ccc; padding: 10px;"></div>
	<div style="text-align:center;">
		<span>
			<a href="javascript:void();" onclick="returnListData()">[返回]</a>
		</span>
	</div>
	<script type="text/javascript">
    require.config({
        paths:{ 
            echarts:'${pageContext.request.contextPath}/js/echarts',
            'echarts/chart/bar' : './js/echarts-map',
            'echarts/chart/line': './js/echarts-map',
            'echarts/chart/map' : './js/echarts-map'
        }
    });
    
 // Step:4 require echarts and use it in the callback.
    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/map'
        ],
        function (ec) {
            //--- 折柱 ---
            var myChart = ec.init(document.getElementById('main'));
            myChart.setOption({
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['点检结果分析']
                },
                toolbox: {
                    show : true,
                    feature : {
                        //mark : {show: true},
                        //dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true}
                        //saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        //data : ['8.1','8.2','8.3','8.4','8.5','8.6','8.7','8.8','8.9','8.10','8.11','8.12','8.13','8.14','8.15','8.16','8.17']
                        data :${listDays}
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        splitArea : {show : true}
                    }
                ],
                series : [
                    {
                        name:'点检结果',
                        type:'line',
                        //data:[10,3,6,8,34,23,56,67,78,54,43,23,17,46,56,13,29,38]
                    	data:${listCounts}
                    }
                    
                ]
            });
        }
    );
 
	 function returnListData(){
		 window.location = "${pageContext.request.contextPath}/common.html" ;
	 }
    </script>
</body>
</html>
