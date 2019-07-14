package jdbc;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Loader
 */
//��� 1. annotation�� ���ؼ� jdbc ����̹� �ε��ϱ� 
//��� 2. web.xml �̿��Ͽ� jdbc ����̹� �ε��ϱ� 
/*
 * @WebServlet(urlPatterns = { "/Loader" }, initParams = {
 * 
 * @WebInitParam(name = "jdbcdriver", value = "oracle.jdbc.driver.OracleDriver",
 * description = "oraclejdbc") })
 */
public class Loader extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		
		String drivers = config.getInitParameter("jdbcDriver");
		StringTokenizer st = new StringTokenizer(drivers, ",");
		
		while(st.hasMoreTokens()) {
			String driver = st.nextToken();
			
			//������ ��ū���� 
			try {
				Class.forName(driver);
				System.out.println("JDBC ����̹��� ���������� �ε�Ǿ����ϴ�. "+driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	/*
	 * private static final long serialVersionUID = 1L;
	 * 
	 *//**
		 * @see HttpServlet#HttpServlet()
		 *//*
			 * public Loader() { super(); // TODO Auto-generated constructor stub }
			 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 * 
	 *//**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
		 *      response)
		 *//*
			 * protected void doPost(HttpServletRequest request, HttpServletResponse
			 * response) throws ServletException, IOException { // TODO Auto-generated
			 * method stub doGet(request, response); }
			 */

}
