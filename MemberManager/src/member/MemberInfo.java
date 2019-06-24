package member;

import java.io.File;

public class MemberInfo {
	/* form 내부의 input 태그의 name 속성과 같은 변수이름을 사용해야 한다!!!! */
	private String userid;
	private String userpw;
	private String username;
	//private File uphoto;
	
	public MemberInfo() {
		
	}

	public MemberInfo(String userid, String userpw, String username) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		//this.uphoto = new File();
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

	@Override
	public String toString() {
		return "MemberInfo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + "]";
	}


}
