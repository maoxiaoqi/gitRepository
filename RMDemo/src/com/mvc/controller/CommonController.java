package com.mvc.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.entity.ChartEntity;
import com.mvc.entity.CheckEntity;
import com.mvc.entity.QueryEntity;
import com.mvc.service.CommonService;
import com.mvc.service.QueryService;

@Controller
@RequestMapping("/common.html")
public class CommonController {
	
	protected final transient Log log = LogFactory.getLog(CommonController.class);
	
	@Autowired
	private QueryService queryService;
	
	@Autowired
	private CommonService commonService;
	public CommonController(){
		
	}
	
	@RequestMapping
	public String load(HttpServletRequest request,ModelMap modelMap){
		try {
			List<Object> queryAspectInfo = this.commonService.queryAspectInfo() ;
			List<Object> queryDeptInfo = this.commonService.queryDeptInfo() ;
			List<Object> queryMethodInfo = this.commonService.queryMethodInfo() ;
			List<Object> queryDeviceInfo = this.commonService.queryDeviceInfo() ;
			request.setAttribute("dept", queryDeptInfo);
			request.setAttribute("aspect", queryAspectInfo);
			request.setAttribute("method", queryMethodInfo);
			request.setAttribute("devices", queryDeviceInfo);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "checkQuery";
	}
	
	@RequestMapping(params="method=deviceStatusReport")
	public String deviceStatusReport(HttpServletRequest request,ModelMap modelMap){
		try {
			Map<String, Integer> deviceStatus = this.commonService.deviceStatus();
			Set<Entry<String, Integer>> entrySet = deviceStatus.entrySet();
			for (Entry<String, Integer> entry : entrySet) {
				request.setAttribute(entry.getKey(), entry.getValue());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "deviceStatusReport";
	}
	
	@RequestMapping(params="method=queryCheckData")
	public String queryCheckData(HttpServletRequest request,ModelMap modelMap){
		try {
			String deptname = request.getParameter("deptname") ;
			String aspectname = request.getParameter("aspectname") ;
			String methodname = request.getParameter("methodname") ;
			String devicename = request.getParameter("devicename") ;
			String asp_desc = request.getParameter("aspect") ;
			String obj_num = request.getParameter("devices") ;
			List<CheckEntity> queryCheckData = this.commonService.queryCheckData(deptname, aspectname, methodname, devicename, asp_desc, obj_num) ;
			List<Object> queryAspectInfo = this.commonService.queryAspectInfo() ;
			List<Object> queryDeptInfo = this.commonService.queryDeptInfo() ;
			List<Object> queryMethodInfo = this.commonService.queryMethodInfo() ;
			List<Object> queryDeviceInfo = this.commonService.queryDeviceInfo() ;
			request.setAttribute("dept", queryDeptInfo);
			request.setAttribute("aspect", queryAspectInfo);
			request.setAttribute("method", queryMethodInfo);
			request.setAttribute("devices", queryDeviceInfo);
			request.setAttribute("datas", queryCheckData);
			request.setAttribute("len", queryCheckData.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "checkQuery";
	}
	
	@RequestMapping(params = "method=reportResult")
	public String reportResult(HttpServletRequest request,ModelMap modelMap) throws ParseException{
		String objId = request.getParameter("objId") ;
		String aspect = request.getParameter("aspect01") ;
		String point = request.getParameter("point") ;
		String startDate = request.getParameter("startDate") ;
		String endDate = request.getParameter("endDate") ;
		List<ChartEntity> queryChartsData = this.commonService.queryChartsData(objId, aspect, point, startDate, endDate) ;
		List<Integer> listCounts = new ArrayList<Integer>() ;
		List<String> listDays = new ArrayList<String>() ;
		for (ChartEntity chartEntity : queryChartsData) {
			listCounts.add(chartEntity.getEpo_value());
			listDays.add("'"+chartEntity.getEpo_date()+"'");
		}
		modelMap.put("listCounts", listCounts);
		modelMap.put("listDays", listDays);
		return "reportResult";
	}
	
	
	@RequestMapping(params = "method=queryImages")
	public String queryImages(HttpServletRequest request,ModelMap modelMap) throws ParseException{
		String eventId = request.getParameter("eventId") ;
		String sql = "SELECT EPO_EVENT as code_,EPF_FILENAME as desc_ FROM U5EVENTPOINTFILES where EPF_FILENAME not like '%WMV' and EPO_EVENT='"+eventId+"'";
		List<QueryEntity> queryImages = this.commonService.queryImages(sql) ;
		request.setAttribute("datas", queryImages);
		request.setAttribute("size", queryImages.size());
		return "queryImages";
	}
	
	@RequestMapping(params = "method=updateTimeEvent")
	public String updateTimeEvent(HttpServletRequest request,ModelMap modelMap) throws ParseException{
		this.queryService.updateEventStatusWithR();
		this.queryService.updateEventStatusWithA();
		return null;
	}
	
	
}
