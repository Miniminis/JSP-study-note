package member;

import java.util.Date;

public class LoginInfo {
	
	/* form ������ input �±��� name �Ӽ��� ���� �����̸��� ����ؾ� �Ѵ�!!!! */
	private String userid;
	private String username;
	private String uphoto;
	private Date regDate;


	public LoginInfo(String userid, String username, String uphoto, Date regDate) {
		this.userid = userid;
		this.username = username;
		this.uphoto = uphoto;
		this.regDate = regDate;
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
	
	
	
	public Date getRegDate() {
		return regDate;
	}



	@Override
	public String toString() {
		return "LoginInfo [userid=" + userid + ", username=" + username + ", uphoto=" + uphoto + ", regDate=" + regDate
				+ "]";
	}

	
}
