package com.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import com.mvc.entity.QueryBeanEntity;


@Component
public class QueryService {
	public static Log loger =LogFactory.getLog(QueryService.class);
	private static Sql2o sql2o;
	
    static{
        sql2o = new Sql2o("jdbc:sqlserver://192.168.150.67:1433;database=EAM", "EAM", "EAM");
    }
    
    //R状态的工单符合条件的关闭
    public  void updateEventStatusWithR(){
    	//查询到所有满足条件的工单单号
    	String sql = "SELECT EVT_CODE as code FROM R5EVENTS WHERE 1=1 AND EVT_RSTATUS='R' AND  EVT_DATE <(CONVERT(VARCHAR(33),GETDATE(),111)+' 00:00:00') AND EVT_PPM LIKE 'INSP-D1-%'" ;
    	List<QueryBeanEntity> evtCodes = queryListEntity(sql, QueryBeanEntity.class) ;
    	for (QueryBeanEntity bean : evtCodes) {
			List<QueryBeanEntity> epoDates = queryListEntity("SELECT EPO_DATE as code FROM R5EVENTPOINTS WHERE 1=1 AND EPO_EVENT = '"+bean.getCode()+"'", QueryBeanEntity.class) ;
			int size = epoDates.size() ;
			int complete = 0 ,no_complete=0;
			for (QueryBeanEntity object : epoDates) {
				if(object.getCode()==null||"".equals(object.getCode())){
					no_complete ++ ;
				}
				if(object.getCode()!=null&&!"".equals(object.getCode())){
					complete ++ ;
				}
			}
			if(size==complete){
				//更新为全部完成
				updateEventStatus(bean.getCode(), "C", "C", "点检工作全部完成");
			}else if(size==no_complete){
				//更新为全部没有完成
				updateEventStatus(bean.getCode(), "CLOS", "C", "点检工作未执行");
			}else{
				//更新为部分完成
				updateEventStatus(bean.getCode(), "C", "C", "点检工作部分完成");
			}
		}
    }
    
    //更新工单状态公用方法
    private  void updateEventStatus(String eventCode,String status,String rstatus,String desc){
    	String updateSql = "UPDATE R5EVENTS SET EVT_STATUS=:status,EVT_RSTATUS=:rstatus,EVT_UDFCHAR05=:desc WHERE 1=1 AND EVT_CODE=:codes" ;
    	try (Connection con = sql2o.open()) {
    	    con.createQuery(updateSql)
    		    .addParameter("status", status)
    		    .addParameter("rstatus", rstatus)
    		    .addParameter("desc", desc)
    		    .addParameter("codes", eventCode)
    		    .executeUpdate();
    	}
    }
    
    
    //修改状态为A的PPM为R状态
    public  void updateEventStatusWithA(){
		String sql = "SELECT EVT_CODE as code FROM R5EVENTS WHERE 1=1 AND EVT_RSTATUS='A' AND EVT_PPM LIKE 'INSP-D1-%'" ;
    	List<QueryBeanEntity> evtCodes = queryListEntity(sql, QueryBeanEntity.class);
		for (QueryBeanEntity bean : evtCodes) {
			updateEventStatus(bean.getCode(), "R", "R", "");
		}
    }
    
    @SuppressWarnings({ "deprecation", "unchecked" })
	private   List<QueryBeanEntity> queryListEntity(String sql,Class<?> clazz){
		List<QueryBeanEntity> parrms = new ArrayList<QueryBeanEntity>();
		try(Connection con = sql2o.open()) {
			parrms = (List<QueryBeanEntity>) sql2o.createQuery(sql).executeAndFetch(clazz);
		}
		return parrms ;
	}
    
}
