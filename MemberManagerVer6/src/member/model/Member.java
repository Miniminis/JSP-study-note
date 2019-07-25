package member.model;

import java.util.Date;

public class Member {
	private int idx;
	private String userid;
	private String userpw;
	private String username;
	private String userphoto;
	private Date regdate;
	
	//default
	public Member() {}
	
	//생성자1
	public Member(String userid, String userpw, String username, String userphoto) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphoto = userphoto;
	}
	
	
	//생성자2
	public Member(int idx, String userid, String userpw, String username, String userphoto, Date regdate) {
		super();
		this.idx = idx;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphoto = userphoto;
		this.regdate = regdate;
	}

	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserphoto() {
		return userphoto;
	}

	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
	@Override
	public String toString() {
		return "Member [idx=" + idx + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", userphoto=" + userphoto + ", regdate=" + regdate + "]";
	}
}
