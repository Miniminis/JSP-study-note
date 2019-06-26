package member;

import java.io.File;

public class MemberInfo {
	/* form ������ input �±��� name �Ӽ��� ���� �����̸��� ����ؾ� �Ѵ�!!!! */
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
	
	//MemberInfo ��ü���� LoginIngo ��ü�� ��ȯ
	public LoginInfo toLoginInfo() {
		LoginInfo loginInfo = new LoginInfo(userid, username,uphoto);
		
		return loginInfo;
	}


}
