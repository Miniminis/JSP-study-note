package dateShare.Model;

import java.util.Date;

public class Movie {
	
	private String m_title; //영화제목
	private String m_content; //영화내용
	private Date m_writedate; //영화리뷰작성일시
	private int m_like; //영화추천수
	private String m_path; //영화이미지 파일경로
	private int m_hits; //영화 게시물 조회수 
	private int m_star; //영화별점 

	public Movie() {}

	public Movie(String m_title, String m_content, Date m_writedate, int m_like, String m_path, int m_hits,
			int m_star) {
		this.m_title = m_title;
		this.m_content = m_content;
		this.m_writedate = m_writedate;
		this.m_like = m_like;
		this.m_path = m_path;
		this.m_hits = m_hits;
		this.m_star = m_star;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	public Date getM_writedate() {
		return m_writedate;
	}

	public void setM_writedate(Date m_writedate) {
		this.m_writedate = m_writedate;
	}

	public int getM_like() {
		return m_like;
	}

	public void setM_like(int m_like) {
		this.m_like = m_like;
	}

	public String getM_path() {
		return m_path;
	}

	public void setM_path(String m_path) {
		this.m_path = m_path;
	}

	public int getM_hits() {
		return m_hits;
	}

	public void setM_hits(int m_hits) {
		this.m_hits = m_hits;
	}

	public int getM_star() {
		return m_star;
	}

	public void setM_star(int m_star) {
		this.m_star = m_star;
	}

	@Override
	public String toString() {
		return "Movie [m_title=" + m_title + ", m_content=" + m_content + ", m_writedate=" + m_writedate + ", m_like="
				+ m_like + ", m_path=" + m_path + ", m_hits=" + m_hits + ", m_star=" + m_star + "]";
	}	

}
