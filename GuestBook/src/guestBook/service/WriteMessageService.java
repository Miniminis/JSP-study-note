package guestBook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestBook.Model.Message;
import guestBook.dao.MessageDao;
import jdbc.ConnectionProvider;

public class WriteMessageService {
	
	//싱글톤 처리 
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
		
		
		return resultCnt; 
		//write() 를 호출한 writeMessage.jsp 페이지로 resultCnt 값이 전달됨 
	}

}
