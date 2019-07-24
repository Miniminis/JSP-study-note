package guestBook.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormService implements GuestBookService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewname = "/WEB-INF/view/p04delForm.jsp";
		
		
		return viewname;
	}
}
