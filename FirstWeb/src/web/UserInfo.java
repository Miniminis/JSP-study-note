package web;

import java.util.Date;

public class UserInfo {

	/* 1. beans Ŭ������ ������ private ó���Ѵ�! */
	/* form ������ input �±��� name �Ӽ��� ���� �����̸��� ����ؾ� �Ѵ�!!!! */
	private String id;
	private String pw;
	private String username;
	private String address;
	private String email;
	private Date regDate;

	/* 2. default �����ڴ� �ʼ�, �Ű����� �޴� �����ڴ� ����! */
	public UserInfo() {
		this.regDate = new Date(); //date���� date() ���� ��ü����
	}

	public UserInfo(String id, String pw, String username, String address, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.username = username;
		this.address = address;
		this.email = email;
		this.regDate = new Date(); //date���� date() ���� ��ü����
	}

	/*
	 * 3. setter�� getter ���� - setter - setVariable(value) :�� ���� ���� --> �ʱ�ȭ �ż����� �����ڸ�
	 * ���� ������ ����, ���� ������� ���� - getter - getVariable() - ���߿� EL ǥ������ ${�����̸�.�����̸�}
	 * ���·� ȣ���ϰ� �Ǵµ� �̋� �����̸��� private ���� �� ��ü�� �ƴ϶�, �ش� ������ ���� �ڵ����� �����Ǵ� get�����̸�()
	 * �ż����̴�. ���� �̸� ��Ģ�� ��Ȯ�ϰ� ������Ѵ�.
	 */

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String toString() {
		return id+pw+username+address+email+regDate;
	}
	
	
}
