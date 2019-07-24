package guestBook.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormService implements GuestBookService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewpage = "/WEB-INF/view/p01writeForm.jsp";
		
		return viewpage;
	}

}
