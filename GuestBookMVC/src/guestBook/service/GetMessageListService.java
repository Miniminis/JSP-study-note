package guestBook.service;

import java.sql.Connection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestBook.Model.Message;
import guestBook.Model.MessageListView;
import guestBook.dao.MessageDao;
import jdbc.ConnectionProvider;

public class GetMessageListService implements GuestBookService {
	
	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		String viewname = "/WEB-INF/view/p03List.jsp";
		
		//사용자의 요청받기 --> 초기 페이지 1로 설정
		int pageNumber = 1; 
		
		String pagenum = request.getParameter("page");
		if(pagenum != null) {
			pageNumber = Integer.parseInt(pagenum);
		}
		
		MessageListView list = getMessageListView(pageNumber);
		
		request.setAttribute("list", list);
		
		return viewname;
	}
	
	//MessageListView를 생성해서 결과로 반환! 
	//1. 페이지 별 방명록의 수 : 기획안에 따라 3으로 상수  선언 
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	//MessageListView을 출력하는 매서드 
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
				
				//파라미터로 넘겨받은 pageNumber 에 따라서 게시판 리스트의 시작로우와 끝 로우가 정해진다.
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
					endRow
					);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return view;
	}
	

}
