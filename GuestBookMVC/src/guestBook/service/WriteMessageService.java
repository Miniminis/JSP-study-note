package guestBook.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestBook.Model.Message;
import guestBook.dao.MessageDao;
import jdbc.ConnectionProvider;

public class WriteMessageService implements GuestBookService {
	
	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
	//1. 응답 view 지정 
	String viewpage = "/WEB-INF/view/p02writeMessage.jsp";
	
	//응답 view 로 전달할 결과 데이터 
	//데이터 베이스에 데이터 저장
	//데이터를 받기 
	
	//1. 사용자 입력데이터 받기 
	try { //추상매서드 오버라이딩의 경우에는 원래 가지고 있는것보다 예외처리가 많으면 안됨 --> throw 로 예외처리 불가 
		request.setCharacterEncoding("utf-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	String gname = request.getParameter("gname");
	String gpassword = request.getParameter("gpassword");
	String gmessage = request.getParameter("gmessage");
	
	System.out.println("입력폼에서 서비스클래스까지 넘어옴 : "+gname);
	
	//2. Message 객체 생성
	Message message = new Message(10, gname, gpassword, gmessage);
	
	System.out.println("message객체에 잘 저장되었나 확인 : "+ message.getGname()+"||"+message.getGpassword()+"||"+message.getGmessage());
	
	//3. DAO 생성, Connection 생성 
	MessageDao dao = MessageDao.getInstance();	
	Connection conn; //DAO 실행을 위한 connection 객체 생성 
	
	int resultCnt = 0; //실행결과 반환
	
	try {
		conn = ConnectionProvider.getConnection();
		
		//4. insert() 실행 
		resultCnt = dao.insert(conn, message);
		
		System.out.println("인코딩확인 : "+gname);

	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	//5. 결과 데이터 request 속성에 저장 
	request.setAttribute("resultCnt", resultCnt);
	
	return viewpage;
}
	
	//COMMAND PATTERN 에서는 싱글톤 처리하면 안됨!!!! 
	/*//싱글톤 처리 
	//1. private 생성자 
	private WriteMessageService () {}
	
	//2. private static 객체 생성 
	//private: 외부 참조 후 수정을 방지 
	//static: private 생성자이므로 객체생성이 불가함 --> static 으로 객체생성 없이 참조할 수 있도록 함
	private static WriteMessageService wrtService = new WriteMessageService();
	
	//3. 생성된 객체를 외부에서 이용할 getter 
	public static WriteMessageService getInstance() {
		return wrtService;
	}
	
	
	public int write(Message message) {
		int resultCnt = 0;
		
		//1. DB 접근을 위한 Connection 객체 생성
		//2. 쿼리문 실행을 위한 dao 객체 생성 
		//3. insert 매서드 실행 
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection(); //DB 연결 
			
			//입력 2. Message 클래스에만 저장된 게시글 등록 정보를 dao를 통해서 DB에 저장하기 위해 
			//dao 객체 생성, insert 매서드 호출 (message 객체 매개변수로 전달)
			MessageDao dao = MessageDao.getInstance(); //쿼리문 실행을 위해 싱글톤처리된 MessageDao 참조
			
			resultCnt = dao.insert(conn, message); //참조변수 dao 통해서 insert 매서드 호출 : 
													//--> 쿼리문 실행을 위해 conn과 등록할 데이터 message 매개변수로 전달
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//메시지 저장 성공 --> 1, 저장실패 --> 0 반환 
		return resultCnt; 
		//write() 를 호출한 writeMessage.jsp 페이지로 resultCnt 값이 전달됨 
	}*/

	

}
