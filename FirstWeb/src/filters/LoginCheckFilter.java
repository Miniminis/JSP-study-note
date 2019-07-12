package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter("/c18Filter/mypage/*")
//c19Filter/mypage 뒤쪽으로 처리되는 모든 페이지에 대해서 이 Filter 통해서 로그인 체크 처리를 해준다. 
public class LoginCheckFilter implements Filter {	
	
	
	public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    } 

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession(false); //기존에 있던 session 을 가져옴 
		HttpServletResponse resp = (HttpServletResponse)response;
		
		boolean loginChk = false;
		
		if(session != null && session.getAttribute("LOGININFO") != null) {
			loginChk = true;
		} 
		
		if(loginChk) { 
			// pass the request along the filter chain
			chain.doFilter(request, response);
		} else {
			//resp.sendRedirect(req.getContextPath()+"/c18Filter/member/loginForm.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/c18Filter/member/loginForm.jsp");
			dispatcher.forward(request, response);
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
