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
 * - httpservlet ����ϴ� Ŭ���� ����� 
 * *** tomcat ����/��� ��� 2���� 
 * 1. annotation @WebServlet("/first")
 * 2. web.xml�� ���� ���� */

@WebServlet(name = "firstservlet",urlPatterns ="/first")
public class FirstWebServlet extends HttpServlet { //httpServelet�� ����� �ؾ� servlet class��� �νĵ�
	//private static final long serialVersionUID = 1L;

	/*** @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)*/ 										
	protected void doGet(
			HttpServletRequest request, //request: ������� ��û������ ������� - ���� <-- �ż��带 ���� �ش� ������ ������ �� �ִ�.
			HttpServletResponse response) //html�� ���������� response�� ��� apach server�� �����Ѵ�.
					throws ServletException, IOException { 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//request. //������� ��û
		response.setContentType("text/html; charset=utf-8"); //������� ��û�� ���� ������ Ÿ�Լ���, printwriter�� ���� ���
		
		PrintWriter out = response.getWriter(); 
		out.println("<html><head><title>first web</title></head>");
		out.println("<body><h1>�ð�: "+ new Date());
		out.println("</h1></body></html>");
	}

}
