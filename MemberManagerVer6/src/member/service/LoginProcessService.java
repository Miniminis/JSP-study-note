package member.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.LoginInfo;

public class LoginProcessService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewpage = "/WEB-INF/member/loginProcess.jsp";
		
		//한글값 처리를 위한 encoding 과정
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		//로그인 폼에서 정보 받아오기 
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		LoginInfo loginMember = null;
		boolean chk = false;//DB에 사용자 정보 일치 결과 여부 
		
		//사용자 입력정보와 DB에 저장된 사용자 정보 비교
		Connection conn;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MemberDao dao = MemberDao.getInstance();
			loginMember = dao.selectOne(conn, userid, userpw);
			
			if(loginMember == null) {
				chk = false;
				//System.out.println("5");
			} else {
				chk = true;
				//System.out.println("6");				
				
				HttpSession session = request.getSession(false); //기존에 있던 session 을 가져옴 
							
				session.setAttribute("LoginInfo", loginMember); //현재 세션에 로그인 정보 저장 				 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		request.setAttribute("chk", chk);
		
		return viewpage;
	}	
}
