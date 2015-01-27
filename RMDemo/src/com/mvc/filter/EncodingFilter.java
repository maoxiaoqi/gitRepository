package com.mvc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter  implements Filter {
	
	private String charset;
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//用init方法取得的charset覆盖被拦截下来的request对象的charset  
        request.setCharacterEncoding(this.charset);  
        //将请求移交给下一下过滤器，如果还有的情况下。  
        chain.doFilter(request, response); 
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		//从web.xml中的filter的配制信息中取得字符集  
        this.charset = config.getInitParameter("charset"); 
	}

}
