package guestBook.service;

import java.sql.Connection;
import java.util.Collections;
import java.util.List;

import guestBook.Model.Message;
import guestBook.Model.MessageListView;
import guestBook.dao.MessageDao;
import jdbc.ConnectionProvider;

public class GetMessageListService {
	
	//MessageListView를 생성해서 결과로 반환! 
	
	//싱글톤 패턴으로 생성자 생성
	private GetMessageListService () {}
	private static GetMessageListService service = new GetMessageListService();
	public static GetMessageListService getInstance() {
		return service;
	}
	
	//1. 한 페이지에 보여줄 게시글의 개수 
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	
	public MessageListView getMessageListView(int pageNumber) {
		
		//MessageListView 변수선언 
		MessageListView view = null;
				
		//2. 현재페이지 번호 
		int curretPageNumber = pageNumber;
		
		//connection
		Connection conn;
		
		
		try {
			//Connection
			conn = ConnectionProvider.getConnection();
			
			//DAO
			MessageDao dao = MessageDao.getInstance();
			
			//전체 게시물의 개수 
			int messageTotalCnt = dao.selectCnt(conn);
			
			//게시물 내용 리스트, DB 검색에 사용할 startRow, endrow
			List<Message> messageList = null;
			int startRow = 0;
			int endRow=0;
			
			if(messageTotalCnt >0) {
				
				startRow = (pageNumber -1)*MESSAGE_COUNT_PER_PAGE +1;
				endRow = startRow + MESSAGE_COUNT_PER_PAGE -1;
				
				messageList = dao.selectList(conn, startRow, endRow);
				
			} else {
				curretPageNumber = 0;
				messageList = Collections.emptyList();
			}
			
			view = new MessageListView(
					messageTotalCnt, 
					curretPageNumber, 
					messageList, 
					MESSAGE_COUNT_PER_PAGE, 
					startRow, 
					endRow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return view;
	}
}
