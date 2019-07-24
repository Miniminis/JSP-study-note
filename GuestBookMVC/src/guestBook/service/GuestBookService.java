package guestBook.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GuestBookService {
	
	String getViewName(HttpServletRequest request, HttpServletResponse response);	
	
	//각 서비스 페이지에서 구현할 getViewName 추상매서드로 정의
	
}
