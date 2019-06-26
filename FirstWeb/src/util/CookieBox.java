package util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	// 1. cookie 데이터들을 맵에 저장하여 관리하기로 함
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

	// 2. 생성자 함수(request) 를 통해서 요청된 쿠키값 받아온 뒤, 맵에 저장하기
	public CookieBox(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {

				Cookie c = cookies[i]; 
				cookieMap.put(c.getName(), c);
				/* cookieMap.put(cookies[i].getName(), cookies[i]); */
				 
			}
		}
	}

	// 3. createCookie() 서로다른 매개변수에 따라 다른 타입으로 정의하기
	
	//(1) 이름, 데이터
	public static Cookie createCookie(String name, String value) {
		
		Cookie c = new Cookie(name, value);
		return c;
		/* return new Cookie(name, value); */
	}
	//(2) 이름, 데이터, 유효시간
	public static Cookie createCookie(String name, String value, int maxAge) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		return c;
	}
	
	//(3) 이름, 데이터, 유효시간, 경로
	public static Cookie createCookie(String name, String value, int maxAge, String path) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		c.setPath(path);
		return c;
	}
	
	//(4) 이름, 데이터, 유효시간, 경로, 도메인
	public static Cookie createCookie(String name, String value, int maxAge, String path, String domain) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		c.setPath(path);
		c.setDomain(domain);
		return c;
	}

	// 4. Cookie getCookie(name) - 쿠키 정보를 반환하는 매서드 정의
	public Cookie getCookie(String name) {
		return cookieMap.get(name); //name에 해당하는 쿠키 객체 반환! Map<name, Object>
	}
	
	// 5. String getValue() - 쿠키에 데이터 반환 매서드
	public String getValue(String name) {
		Cookie c = cookieMap.get(name);
		if(c == null) {
			return null; //만약에 null 값이면 getValue() 불가하여 nullpointerexception 이 발생하게 된다! 
		}
		return c.getValue();
	}

	// 6. exists() - 쿠키의 존재 여부를 확인해주는 매서드 
	public boolean exists(String name) {
		return cookieMap.get(name) != null;
		//존재하면 true, 존재하지않으면 false 이므로 
	}

}
