package test;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/*@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "encoding", value = "utf-8")
		})*/
public class CharacterEncodingFilter implements Filter {
	
	//필터 클래스는 반드시 init(), doFilter(), destroy() 모두를 오버라이딩 해야한다. 
	
	private String encode = null;

	//default 생성자 
    public CharacterEncodingFilter() {
    }
    
    //
    public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding(encode);
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		encode = fConfig.getInitParameter("encoding");
		
		if(encode == null) {
			encode = "UTF-8";
		}
	}

}
