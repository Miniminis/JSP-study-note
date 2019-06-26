package member;

public class LoginInfo {
	
	/* form ������ input �±��� name �Ӽ��� ���� �����̸��� ����ؾ� �Ѵ�!!!! */
	private String userid;
	private String username;
	private String uphoto;


	public LoginInfo(String userid, String username, String uphoto) {
		this.userid = userid;
		this.username = username;
		this.uphoto = uphoto;
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


	@Override
	public String toString() {
		return "LoginInfo [userid=" + userid + ", username=" + username + ", uphoto=" + uphoto + "]";
	}

	
}
