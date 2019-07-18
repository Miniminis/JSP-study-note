package dateShare.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dateShare.Model.Movie;
import jdbc.ConnectionProvider;
import jdbc.jdbcUtil;

public class MovieDao {
	
	//1. 싱글톤처리 
	private MovieDao() {}
	
	private static MovieDao dao = new MovieDao();
	
	
	public static MovieDao getInstance() {
		return dao;
	}
	
	
	//1. 게시글 등록을 위한 insert() 
	public int insert(Connection conn, Movie movietext) {
	
		PreparedStatement pstmt = null;
		String sql = "insert into movie values (null, 2, ?, ?, default, default, ?, default, default)";
		//String sql = "insert into movie values (MOVIE_SEQ.nextval, 2, ?, ?, default, default, default, default, default)";
		int resultCnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, movietext.getM_title());
			pstmt.setString(2, movietext.getM_content());
			pstmt.setString(3, movietext.getM_path());

			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return resultCnt;
	}
	
	//2.전체 게시물의 개수 반환 : selectCnt()
	public int selectCnt(Connection conn) {
		
		//전체 개시물 개수 
		int totalCnt = 0;
		
		//sql 실행 결과
		ResultSet rs = null;
		
		String sql = "select count(*) from movie";
		Statement stmt;
		
		try {
			stmt = conn.createStatement();
			//count (*) 실행결과 
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return totalCnt;
	}
	
	//3. 게시글 리스트 출력을 위한 selectList() 
	public List<Movie> selectList(Connection conn) {
		
		//반환형: list 타입 반환 
		List<Movie> list = new ArrayList<Movie>();
		
		String sql = "select m_num, m_path, m_title, m_writedate, m_hits, m_like from movie order by m_num desc";
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Movie movie = new Movie();
				
				movie.setM_num(rs.getInt(1));
				movie.setM_path(rs.getString(2));
				movie.setM_title(rs.getString(3));
				movie.setM_writedate(rs.getDate(4));
				movie.setM_hits(rs.getInt(5));
				movie.setM_like(rs.getInt(6));
				
				list.add(movie);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//4. selectOne() - 사용자가 클릭한 한 개의 게시글 출력/ 특정 게시물 존재여부 확인 (삭제 혹은 수정시)
	public Movie selectOne(Connection conn, int articleNum) {
		
		Movie movie = null;
		ResultSet rs = null;
		
		String sql = "select m_num, m_path, m_title, m_writedate, m_like, m_hits, m_content, "
				+ " u_name, u_pw from dateuser join movie using(u_num) where m_num=?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, articleNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				movie = new Movie();
				
				movie.setM_num(rs.getInt(1));
				movie.setM_path(rs.getString(2));
				movie.setM_title(rs.getString(3));
				movie.setM_writedate(rs.getDate(4));
				movie.setM_like(rs.getInt(5));
				movie.setM_hits(rs.getInt(6));
				movie.setM_content(rs.getString(7));
				movie.setU_name(rs.getString(8));
				movie.setU_pw(rs.getString(9));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return movie;
		
	}
	
	//5. delete() 게시물 삭제 
	public int delete(Connection conn, int artnum) {
		int resultCnt = 0;
		
		String sql = "delete from movie where m_num = ?";
		PreparedStatement pstmt = null;
		
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, artnum);
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//다른 예외 구문은 Service 페이지에서 처리하므로 catch 구문은 삭제, 여기서는 throw 로 처리 
			jdbcUtil.close(pstmt);
		}

		return resultCnt;
	}
	
	//6. 조회수 업데이트를 위한 updateHit() 
	public int updateHit(Connection conn, int articleNum) {
		int resultCnt = 0;
		PreparedStatement pstmt;
		
		String sql = "update movie set m_hits = IFNULL(m_hits, 0) +1 where m_num=?";
		//Oracle 
		//String sql = "update movie set m_hits = NVL(m_hits, 0) + 1 where m_num=?";
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultCnt;
	}
	
	
	  //7. 게시글 수정을 위한 editArticle() 
	public int editArticle(Connection conn, Movie movietext, int aNum) { 
		int resultCnt = 0;
	  
	  PreparedStatement pstmt; 
	  String sql = "update movie set m_title = ?, m_path = ?, m_star = ?, m_content = ? where m_num = ? ";
	  
	  try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, movietext.getM_title());
		pstmt.setString(2, movietext.getM_path());
		pstmt.setInt(3, movietext.getM_star());
		pstmt.setString(4, movietext.getM_content());
		pstmt.setInt(5, aNum);
		
		resultCnt = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	  
	  return resultCnt; 
	}
	
}


/* 9개
 * 이름          널?       유형            
----------- -------- ------------- 
M_NUM       NOT NULL NUMBER        
U_NUM       NOT NULL NUMBER 1       
M_TITLE     NOT NULL VARCHAR2(50)  
M_CONTENT   NOT NULL LONG          
M_WRITEDATE NOT NULL DATE          
M_LIKE      NOT NULL NUMBER        
M_PATH      NOT NULL VARCHAR2(255) 
M_HITS      NOT NULL NUMBER        
M_STAR      NOT NULL NUMBER */


