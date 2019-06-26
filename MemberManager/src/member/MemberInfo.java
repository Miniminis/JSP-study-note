package member;

import java.io.File;

public class MemberInfo {
	/* form 내부의 input 태그의 name 속성과 같은 변수이름을 사용해야 한다!!!! */
	private String userid;
	private String userpw;
	private String username;
	private String uphoto;
	
	public MemberInfo() {
		
	}

	public MemberInfo(String userid, String userpw, String username, String uphoto) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.uphoto = uphoto;
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

	public String getUphoto() {
		return uphoto;
	}

	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}

	@Override
	public String toString() {
		return "MemberInfo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + "]";
	}
	
	//MemberInfo 객체에서 LoginIngo 객체로 반환
	public LoginInfo toLoginInfo() {
		LoginInfo loginInfo = new LoginInfo(userid, username,uphoto);
		
		return loginInfo;
	}


}
