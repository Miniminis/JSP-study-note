package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DateService;
import service.GreetingService;
import service.OtherService;
import service.Service;

public class FrontController extends HttpServlet {
	
	Map<String, Service> commands = new HashMap<String, Service>();
	
		
	@Override
	//프로그램의 시작과 동시에 init() 실행
	//config 매개변수
	public void init(ServletConfig config) throws ServletException { 
		String configFile = config.getInitParameter("config");  
		//web.xml에서 등록된 서블릿 실행 //파라미터 name 통해서  value값 commandService.properties 값들 가져오기
		Properties prop = new Properties(); //프로퍼티 객체 생성 	
		FileInputStream fis = null; //외부파일은 반드시 inputstream 통해서만 받을 수 있음 
		
		String configFilePath = config.getServletContext().getRealPath(configFile);
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis); //프로퍼티 파일을 로드 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServletException(e);
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		Iterator keyItr = prop.keySet().iterator();		
		while(keyItr.hasNext()) {
			String command = (String) keyItr.next(); //key 값 설정 
			String serviceClassName = prop.getProperty(command); //value값 설정
			
			try {
				Class serviceClass = Class.forName(serviceClassName); //클래스 객체 만들어줌 
				Service serviceInstance = (Service) serviceClass.newInstance();
				commands.put(command, serviceInstance); //<사용자 요청경로, 서비스 경로> map형태로 저장 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


	public FrontController() {
		// /, /greeting, /now/date 
		/*
		 * commands.put("/", new GreetingService()); 
		 * commands.put("/greeting", new GreetingService()); 
		 * commands.put("/now/date", new DateService());
		 * commands.put("/board/list", new DateService()); 
		 * commands.put("/board/write", new DateService());
		 */
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청파악 : prameter 의 값으로 사용자 요청을 분석/구분
		//String command = request.getParameter("type");
		
		String command = request.getRequestURI();
		
		System.out.println("사용자 요청 URI : " + command);
		
		if(command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		System.out.println("command : " + command);
		
		// 응답결과
		String resultObj = "";
		String viewpage = "";
		
		// 요청에 맞는 기능 수행 : Model 처리 ( Service + Dao + 기능 Clss ) -> 결과 데이터 반환
		// view 지정
		/*
		 * if(command == null || command.equals("/greeting") || command.equals("/")) {
		 * viewpage = new GreetingService().getViewPage(request); 
		 * } else if (command.equals("/now/date")) { 
		 * viewpage = new DateService().getViewPage(request); 
		 * } else { viewpage = new OtherService().getViewPage(request); 
		 * }
		 */
		
		 Service service = commands.get(command);
		 if(service == null) {
			 service = new OtherService();
		 }
		 viewpage = service.getViewPage(request);
		 
		
		
		// 결과 데이터를 request 또는 session 영역에 속성으로 저장 : view 로 데이터 전달, 공유		
		//request.setAttribute("result", resultObj);
		
		// forwarding
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
