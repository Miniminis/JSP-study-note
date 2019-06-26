package util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	// 1. cookie �����͵��� �ʿ� �����Ͽ� �����ϱ�� ��
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

	// 2. ������ �Լ�(request) �� ���ؼ� ��û�� ��Ű�� �޾ƿ� ��, �ʿ� �����ϱ�
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

	// 3. createCookie() ���δٸ� �Ű������� ���� �ٸ� Ÿ������ �����ϱ�
	
	//(1) �̸�, ������
	public static Cookie createCookie(String name, String value) {
		
		Cookie c = new Cookie(name, value);
		return c;
		/* return new Cookie(name, value); */
	}
	//(2) �̸�, ������, ��ȿ�ð�
	public static Cookie createCookie(String name, String value, int maxAge) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		return c;
	}
	
	//(3) �̸�, ������, ��ȿ�ð�, ���
	public static Cookie createCookie(String name, String value, int maxAge, String path) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		c.setPath(path);
		return c;
	}
	
	//(4) �̸�, ������, ��ȿ�ð�, ���, ������
	public static Cookie createCookie(String name, String value, int maxAge, String path, String domain) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		c.setPath(path);
		c.setDomain(domain);
		return c;
	}

	// 4. Cookie getCookie(name) - ��Ű ������ ��ȯ�ϴ� �ż��� ����
	public Cookie getCookie(String name) {
		return cookieMap.get(name); //name�� �ش��ϴ� ��Ű ��ü ��ȯ! Map<name, Object>
	}
	
	// 5. String getValue() - ��Ű�� ������ ��ȯ �ż���
	public String getValue(String name) {
		Cookie c = cookieMap.get(name);
		if(c == null) {
			return null; //���࿡ null ���̸� getValue() �Ұ��Ͽ� nullpointerexception �� �߻��ϰ� �ȴ�! 
		}
		return c.getValue();
	}

	// 6. exists() - ��Ű�� ���� ���θ� Ȯ�����ִ� �ż��� 
	public boolean exists(String name) {
		return cookieMap.get(name) != null;
		//�����ϸ� true, �������������� false �̹Ƿ� 
	}

}
