package member.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class RegMemberService implements MemberService{

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewpage="/WEB-INF/member/memberReg.jsp";
		
		//파라미터 받기 전 인코딩 
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//회원폼으로부터 파라미터 전달받기 
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String userphoto = request.getParameter("userphoto");
		
		System.out.println("1번 "+userid+"::"+userpw+":"+username+":"+userphoto);
		
		//DB저장을 위해 Connection 객체 생성, DAO 호출, insert() 호출 
		Connection conn;
		
		
		//실행결과 반환 
		int resultCnt =0;
		Member member = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			member = new Member(userid, userpw, username, userphoto);
			
			System.out.println("2번 "+member.getUserid());
			
			MemberDao dao = MemberDao.getInstance();
			resultCnt = dao.insert(conn, member);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("resultCnt", resultCnt);
		request.setAttribute("member", member);
		
		return viewpage;
	}

}
