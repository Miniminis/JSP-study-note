package member;

import java.util.Date;

public class LoginInfo {
	
	/* form ������ input �±��� name �Ӽ��� ���� �����̸��� ����ؾ� �Ѵ�!!!! */
	private String userid;
	private String userpw;
	private String uphoto;
	//private String regDate;


	public LoginInfo(String userid, String userpw, String uphoto) {
		this.userid = userid;
		this.userpw = userpw;
		this.uphoto = uphoto;
		//this.regDate = regDate;
	}


	public String getUserid() {
		return userid;
	}


	public String getUsername() {
		return username;
	}


	public String getUphoto() {
		return uphoto;
	}

	//public String getRegDate() {
		//return regDate;
	//}



	@Override
	public String toString() {
		return "LoginInfo [userid=" + userid + ", username=" + username + ", uphoto=" + uphoto + "]";
	}

	
}
