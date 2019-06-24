package web;

import java.util.Date;

public class UserInfo {

	/* 1. beans 클래스의 변수는 private 처리한다! */
	/* form 내부의 input 태그의 name 속성과 같은 변수이름을 사용해야 한다!!!! */
	private String id;
	private String pw;
	private String username;
	private String address;
	private String email;
	private Date regDate;

	/* 2. default 생성자는 필수, 매개변수 받는 생성자는 선택! */
	public UserInfo() {
		this.regDate = new Date(); //date값은 date() 에서 객체생성
	}

	public UserInfo(String id, String pw, String username, String address, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.username = username;
		this.address = address;
		this.email = email;
		this.regDate = new Date(); //date값은 date() 에서 객체생성
	}

	/*
	 * 3. setter와 getter 정의 - setter - setVariable(value) :는 없을 수도 --> 초기화 매서드인 생성자를
	 * 통해 데이터 세팅, 거의 사용하지 않음 - getter - getVariable() - 나중에 EL 표현언어에서 ${빈즈이름.변수이름}
	 * 형태로 호출하게 되는데 이떄 변수이름은 private 변수 그 자체가 아니라, 해당 변수를 통해 자동으로 생성되는 get변수이름()
	 * 매서드이다. 따라서 이름 규칙을 명확하게 따라야한다.
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
