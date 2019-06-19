package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstWebServlet
 */

/* servlet 
 * 0. public class FirstWebServlet extends HttpServlet 
 * - httpservlet 상속하는 클래스 만들기 
 * *** tomcat 연결/등록 방법 2가지 
 * 1. annotation @WebServlet("/first")
 * 2. web.xml에 직접 연결 */

@WebServlet(name = "firstservlet",urlPatterns ="/first")
public class FirstWebServlet extends HttpServlet { //httpServelet을 상속을 해야 servlet class라고 인식됨
	//private static final long serialVersionUID = 1L;
       
    /*** @see HttpServlet#HttpServlet()*/
	/**  public FirstWebServlet() { //생성자 super(); } */

	/*** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)*/ 										
	protected void doGet(
			HttpServletRequest request, //request: 사용자의 요청정보를 담고있음 - 변수 <-- 매서드를 통해 해당 변수를 참조할 수 있다.
			HttpServletResponse response) //html의 응답정보를 response에 담아 apach server에 전달한다.
					throws ServletException, IOException { 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//request. //사용자의 요청
		response.setContentType("text/html; charset=utf-8"); //사용자의 요청에 대한 콘텐츠 타입설정, printwriter를 통해 출력
		
		PrintWriter out = response.getWriter(); 
		out.println("<html><head><title>first web</title></head>");
		out.println("<body><h1>시간: "+ new Date());
		out.println("</h1></body></html>");
	}

}
