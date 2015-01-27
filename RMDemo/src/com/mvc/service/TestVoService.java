package com.mvc.service;


public class TestVoService {
	public void excute(){
		QueryService service = new QueryService() ;
		service.updateEventStatusWithR();
		service.updateEventStatusWithA();
	}
}
