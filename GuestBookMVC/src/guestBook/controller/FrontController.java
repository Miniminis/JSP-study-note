package guestBook.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet(
		urlPatterns = { "/" }, 
		initParams = { 
				@WebInitParam(name = "config", value = "/WEB-INF/commandService.properties")
		})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
		
		String configfile = config.getInitParameter("config");  
		//서블릿 생성당시 지정한 초기 파라미터를 받아 value 값에 접근할 수 있도록 함
		
		Properties prop = new Properties(); //프로퍼티 인스턴스 생성
		FileInputStream fis = null; //FileNotFoundException 미리 예방 - 예외처리시 변수 사용하기 위해서 미리 초기화
		String configFilePath = config.getServletContext().getRealPath(configfile);
		
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);			
			
		} catch (FileNotFoundException e) { //매개변수로 전달한 경로에 파일이 존재하지 않을수 있음 
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Iterator itr = prop.keySet().iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	//do or post 두 방식 모두 process 매서드로 처리
	private void process(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * //1. 사용자 요청 분석 
		 * 		- 가능한 사용자 요청 목록  --> 사용자요청경로=내부서비스경로
		 * 		/guestWriteForm=WriteFormService --> view: 작성페이지
		 * 		/guestWrite=WriteMessageService --> view: 작성 완료 페이지
		 * 		/guestList=GetMessageListService --> view: 리스트 페이지
		 * 		/guestDelForm=DeleteFormService --> view: 비밀번호 입력 페이지
		 * 		/guestDel=DeleteMessageService --> view: 삭제처리완료 페이지
		 * 
		 * 		- 각 서비스의 실행 결과는 return viewpage 
		 * //2. 사용자 요청에 맞는 모델 실행 (서비스, DAO, 모델 실행 ) --> view 페이지 반환 
		 * //3. view 페이지로 포워딩
		 */		
		
	}


}
