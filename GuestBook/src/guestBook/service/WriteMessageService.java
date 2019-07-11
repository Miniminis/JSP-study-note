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
		
		//1. Connection 생성
		//2. dao 생성 
		//3. insert 매서드 실행 
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao dao = MessageDao.getInstance();
			
			resultCnt = dao.insert(conn, message);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return resultCnt; 
		//write() 를 호출한 writeMessage.jsp 페이지로 resultCnt 값이 전달됨 
	}

}
