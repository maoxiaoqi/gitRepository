package com.mvc.commonUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

public class CommonUtil {
	
	public static boolean isEmpty(String obj){
		if("".equals(obj)||obj==null){
			return true ;
		}
		return false ;
	}
	
	
	public static Map<String,String> readProperties(String fileName,List<String> allNumbers){
		Map<String,String> mapValues = new HashMap<String,String>() ;
		Properties prop = new Properties();
		try {
			prop.load(CommonUtil.class.getClassLoader().getResourceAsStream(fileName));
			for (String deviceNumber : allNumbers) {
				mapValues.put(deviceNumber, prop.getProperty(deviceNumber));
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		return mapValues ;
	}
	
	
	
	public static void main(String[] args) {
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
		Map<String, String> readProperties = CommonUtil.readProperties("deviceNumberInfo.properties", list) ;
		Set<Entry<String, String>> entrySet = readProperties.entrySet();
		for (Entry<String, String> entry : entrySet) {
			System.out.println(entry.getKey()+"---------->>>"+entry.getValue());
		}
		
		
	}
	
	
}


