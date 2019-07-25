package guestBook.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestBook.Model.Message;
import guestBook.dao.MessageDao;
import guestBook.exception.InvalidMessagePasswordException;
import guestBook.exception.MessageNotFoundException;
import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;

public class DeleteMessageService implements GuestBookService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewname = "/WEB-INF/view/p05delResult.jsp"; //결과 반환할 뷰 정의 
		
		//1. delForm 에서 받아온 데이터 인코딩 + 게시글 번호 파라미터로 받기 
		int messageId = Integer.parseInt(request.getParameter("messageId"));
		String password = request.getParameter("passwordConfirm");
		
		int resultCnt = 0; //삭제 실행 결과담을 변수 설정 
		boolean chk = false; //비밀번호 유효성 검사 결과 담은 체크 결과 담을 변수 설정  
		String msg = ""; //삭제 실행 결과에 따라 다른 메시지 출력 
		
		
		//핵심처리 
		//2. 미리 정의해놓은 deleteMessage(mid, pw) 매서드 호출
		try {
			resultCnt = deleteMessage(messageId, password);
			chk = true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			msg = e.getMessage();
		} catch (MessageNotFoundException e) {
			e.printStackTrace();
			msg = e.getMessage();
		} catch (InvalidMessagePasswordException e) {
			e.printStackTrace();
			msg = e.getMessage();
		}		
		
		//3. resultCnt, msg 등 결과데이터 반환 --> 파라미터 페이지로 전달     
		request.setAttribute("chk", chk); 
		request.setAttribute("resultCnt", resultCnt);
		request.setAttribute("msg", msg);
		
		return viewname;
	}
	
	
	
	
	/*
	//DAO 매서드 호출 
	//1. select - 특정 게시물을 선택하여 
	//2. delete - 삭제처리 
	
	//JSP 로 전달: int 실행결과 : 0 or 1
	
	
	//싱글톤 처리하여 불필요없는 객체 생성방지, 외부 직접참조 방지
	private DeleteMessageService () {}
	private static DeleteMessageService deleteService = new DeleteMessageService();
	public static DeleteMessageService getInstance() {
		return deleteService;
	}*/
	
	public int deleteMessage(int mId, String pw) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		
		int resultCnt = 0;
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//트랜잭션 시작
			conn.setAutoCommit(false);
			
			//1. 전달받은 게시물 아이디 mId로 게시물 확인
			//- MessageDao 필요 --> 원하는 게시물 선택 select() 
			MessageDao dao = MessageDao.getInstance();
			Message message = dao.select(conn, mId);
			
			//2. 게시물이 존재하지 않으면 예외처리 
			if(message == null) {
				throw new MessageNotFoundException(mId+"번 메시지가 존재하지 않습니다.");
			}
			
			//3. 게시물이 존재하면 비밀번호 확인 (존재 여부 있다, 없다 ) --> 없으면 예외처리  
			//4. 비밀번호가 존재하면 --> 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린 경우에 대해 예외처리
			if(!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			
			//비밀번호 비교
			if(!message.matchPassword(pw)) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			 
			
			//5. 비밀번호가 존재하고 일치한다면 --> 정상처리 commit 
			resultCnt = dao.deleteMessage(conn, mId);
			
			//트랜잭션 종료 : 정상처리
			conn.commit(); 
			
		} catch (SQLException e) {
			//트랜잭션의 롤백: 마지막 커밋 위치로 이동 
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (MessageNotFoundException e) {
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (InvalidMessagePasswordException e) {
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}  
		
		
		return resultCnt;
		
	}

}
