package member;

public class LoginInfo {
	
	private String id;
	private String name;
	private String photo; 
	private String nicname;
	private int grade; 
	private String pNum;
	
	public LoginInfo(String id) {
		//ȸ������ ���� ���� ����� �����͵��� �����Ƿ� ���ǰ� �־ ��ü ����
		this.id = id;
		this.name = "�÷���";
		this.photo = "noimg";
		this.nicname = "Speedy";
		this.grade = 1;
		this.pNum = "010-0000-0000";
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhoto() {
		return photo;
	}

	public String getNicname() {
		return nicname;
	}

	public int getGrade() {
		return grade;
	}

	public String getpNum() {
		return pNum;
	}

	
}
