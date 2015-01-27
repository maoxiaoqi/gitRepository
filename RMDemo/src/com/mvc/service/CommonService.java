package com.mvc.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import com.mvc.commonUtil.CommonUtil;
import com.mvc.entity.ChartEntity;
import com.mvc.entity.CheckEntity;
import com.mvc.entity.QueryEntity;

@Component
public class CommonService {
	public static Log loger =LogFactory.getLog(CommonService.class);
	private static Sql2o sql2o;
	
    static{
        sql2o = new Sql2o("jdbc:sqlserver://192.168.150.67:1433;database=EAM", "EAM", "EAM");
    }

    
    public List<String> deviceMap(){
    	List<String> list = new ArrayList<String>() ;
    	list.add("HTT1");
    	list.add("HTT2");
    	list.add("CVD1");
    	list.add("CVD2");
    	list.add("CVD3");
    	list.add("CVD4");
    	list.add("IMP1");
    	list.add("CAB1");
    	list.add("PAINTROOM1");
    	list.add("PAINTROOM2");
    	list.add("AO1");
    	list.add("MIL1");
    	list.add("DSG1");
    	list.add("RVT");
    	list.add("ENGRAVE");
    	list.add("CMM");
    	return list ;
    }
    
    
	@SuppressWarnings("deprecation")
	@Transactional
	public Map<String,Integer> deviceStatus() throws ParseException{
		Map<String,Integer> parrms = new HashMap<String,Integer>() ;
		Map<String, String> readProperties = CommonUtil.readProperties("deviceNumberInfo.properties", this.deviceMap()) ;
		Set<Entry<String, String>> entrySet = readProperties.entrySet();
	    try(Connection con = sql2o.open()) {
	    	for (Entry<String, String> entry : entrySet) {
	    		String sql =" SELECT TOP 1 countobj   FROM func_deviceStatus('"+entry.getValue()+"') ORDER BY countobj DESC ";
	    		parrms.put(entry.getKey(), sql2o.createQuery(sql).executeScalar(Integer.class)) ;
			}
	    }
	    return parrms ;
	}
	
	
	@Transactional
	public List<Object> queryDeptInfo() throws ParseException{
		String sql ="SELECT MRC_CODE as code_ ,MRC_DESC as desc_ FROM R5MRCS  ";
		return this.queryListEntity(sql, QueryEntity.class) ;
	}
	
	@Transactional
	public List<Object> queryAspectInfo() throws ParseException{
		String sql ="SELECT ASP_CODE as code_,ASP_DESC as desc_ from R5ASPECTS WHERE ASP_NOTUSED <>'+'  ";
		return this.queryListEntity(sql, QueryEntity.class) ;
	}
	
	@Transactional
	public List<Object> queryMethodInfo() throws ParseException{
		String sql ="SELECT MTH_CODE as code_ ,MTH_DESC as desc_  FROM R5METHODS ";
		return this.queryListEntity(sql, QueryEntity.class) ;
	}
	
	
	@Transactional
	public List<Object> queryDeviceInfo() throws ParseException{
		String sql ="SELECT obj.obj_code AS code_,obj.OBJ_DESC AS desc_ FROM R5OBJECTS obj LEFT JOIN R5OBJECTASPECTS oba ON obj.OBJ_CODE = oba.OBA_OBJECT AND obj.OBJ_ORG = oba.OBA_OBJECT_ORG ";
		return this.queryListEntity(sql, QueryEntity.class) ;
	}
	
	
	@SuppressWarnings("deprecation")
	@Transactional
	public List<CheckEntity> queryCheckData(String obj_mrc,String asp_desc,String mth_desc,String obj_desc,String epo_aspect,String epo_object) throws ParseException {
		List<CheckEntity> parrms = new ArrayList<CheckEntity>();
		try (Connection con = sql2o.open()) {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT epo.EPO_CODE,")
			.append("obj.OBJ_MRC AS obj_mrc,")
			.append("epo.EPO_ASPECT AS epo_aspect,")
			.append("asp.ASP_DESC AS asp_desc,")
			.append("epo.EPO_OBJECT,")
			.append("obj.OBJ_DESC AS obj_desc,")
			.append("poi.POI_POINT,")
			.append("poi.POI_DESC,")
			.append("mth.MTH_DESC AS mth_desc,")
			.append("epo.EPO_EVENT,")
			.append("epo.EPO_DATE,")
			.append("epo.EPO_UOM,")
			.append("epo.EPO_VALUE,")
			.append("epo.EPO_FINDING,")
			.append("apo.APO_NOMINAL AS apo_nominal,")
			.append("epo.EPO_MIN,")
			.append("epo.EPO_MAX,")
			.append("epo.EPO_COMMENT ")
			//.append("'' AS aspect ")
			.append("FROM R5EVENTPOINTS epo ")
			.append("LEFT JOIN R5POINTS poi ON poi.POI_POINT = epo.EPO_POINT ")
			.append("AND poi.POI_POINTTYPE = epo.EPO_POINTTYPE ")
			.append("LEFT JOIN R5OBJECTS obj ON epo.EPO_OBJECT = obj.OBJ_CODE ")
			.append("AND epo.EPO_OBJECT_ORG = obj.OBJ_ORG ")
			.append("LEFT JOIN R5ASPECTS asp ON asp.ASP_CODE = epo.EPO_ASPECT ")
			.append("LEFT JOIN R5METHODS mth ON epo.EPO_METHOD = mth.MTH_CODE ")
			.append("LEFT JOIN R5ASPECTPOINTS apo ON epo.EPO_OBJECT = apo.APO_OBJECT ")
			.append("AND epo.EPO_ASPECT = apo.APO_ASPECT ")
			.append("AND epo.EPO_POINT = apo.APO_POINT ")
			.append("AND epo.EPO_UOM = apo.APO_UOM ")
			.append("WHERE 1 = 1 ");
			if(!CommonUtil.isEmpty(obj_mrc)){
				sql.append(" AND obj.OBJ_MRC = '").append(obj_mrc).append("' ");
			}
			if(!CommonUtil.isEmpty(asp_desc)){
				sql.append(" AND asp.ASP_CODE = '").append(asp_desc).append("' ");
			}
			if(!CommonUtil.isEmpty(epo_object)){
				sql.append(" AND epo.EPO_OBJECT = '").append(epo_object).append("' ");
			}
			if(!CommonUtil.isEmpty(epo_aspect)){
				sql.append(" AND epo.EPO_ASPECT = '").append(epo_aspect).append("' "); 
			}
			if(!CommonUtil.isEmpty(mth_desc)){
				sql.append(" AND  mth.MTH_CODE = '").append(mth_desc).append("' "); 
			}
			loger.info(sql);
			parrms = sql2o.createQuery(sql.toString()).executeAndFetch(CheckEntity.class);
		}
		return parrms;
	}
	
	
	@SuppressWarnings("deprecation")
	@Transactional
	public List<ChartEntity> queryChartsData(String objId,String aspect,String point,String startDate,String endDate) throws ParseException{
		StringBuffer sql = new StringBuffer();
		sql.append("select epo.EPO_VALUE,epo.EPO_FINDING,epo.EPO_DATE From R5EVENTPOINTS epo  ")
		.append("WHERE  1=1 ").append(" AND epo.EPO_EVENT IS NOT NULL AND  epo.EPO_DATE IS NOT NULL")
		.append(" AND epo.EPO_OBJECT = '").append(objId).append("' ")
		.append(" AND epo.EPO_ASPECT = '").append(aspect).append("' ")
		.append(" AND epo.EPO_POINT = '").append(point).append("' ")
		.append(" AND epo.EPO_DATE  >= '").append(startDate).append("' AND epo.EPO_DATE <= '").append(endDate).append("' ") 
		.append(" ORDER BY epo.EPO_DATE ASC ") ;
		List<ChartEntity> list = new ArrayList<ChartEntity>();
		try(Connection con = sql2o.open()) {
			list = sql2o.createQuery(sql.toString()).executeAndFetch(ChartEntity.class) ;
	    }
		return list;
	}
	
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public  List<Object> queryListEntity(String sql,Class<?> clazz){
		List<Object> parrms = new ArrayList<Object>();
		try(Connection con = sql2o.open()) {
			parrms = (List<Object>) sql2o.createQuery(sql).executeAndFetch(clazz);
		}
		return parrms ;
	}
	
	@SuppressWarnings("deprecation")
	public  List<QueryEntity> queryImages(String sql){
		List<QueryEntity> parrms = new ArrayList<QueryEntity>();
		try(Connection con = sql2o.open()) {
			parrms = sql2o.createQuery(sql).executeAndFetch(QueryEntity.class);
		}
		return parrms ;
	}
	
	
	
	
}
