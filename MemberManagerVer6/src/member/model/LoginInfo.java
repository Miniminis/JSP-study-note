package member.model;

import java.util.Date;

public class LoginInfo {
	
	private String userid;
	private String userpw;
	private String username;
	private  String userphoto;
	private Date regdate;
	
	public LoginInfo () {}

	public LoginInfo(String userid, String userpw, String username,  String userphoto, Date regdate) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphoto =  userphoto;
		this.regdate = regdate;
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
		return "LoginInfo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", userphoto="
				+ userphoto + ", regdate=" + regdate + "]";
	}


	
}
