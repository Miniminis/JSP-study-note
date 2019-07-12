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
	
	/* 정의해야하는 MessageListView.jsp 변수들 
	 * private int messageTotalCnt; //전체 등록된 방명록의 수 --> 4. DAO selectCnt(conn) 통해 가져오기
	 * private int currentPageNumber; //현재 페이지 번호 --> 3. getMessageListView(pageNumber) 로 전달받은 매개변수
	 * private List<Message> messageList; //등록된 메시지 리스트 --> 7. DAO selectList(conn, startRow, endRow) 
	 * private int pageTotalCnt; //전체 페이지의 수  --> 1. MessageListView.jsp 페이지에서 이미 처리
	 * private int messageCountPerPage; //페이지 별 방명록의 수 --> 2. 기획안에 따라 3으로 상수 선언  
	 * private int startRow; //페이지의 제일 첫번째 줄 --> 5. 
	 * private int endRow; //페이지의 제일 마지막 줄   --> 6. 
	 */	
	
	
	//1. 페이지 별 방명록의 수 : 기획안에 따라 3으로 상수  선언 
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
			
			//게시물 내용 리스트, DB 검색에 사용할 startRow, endRow
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
