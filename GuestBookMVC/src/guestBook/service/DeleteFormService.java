package guestBook.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormService implements GuestBookService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewname = "/WEB-INF/view/p04delForm.jsp";
		
		String messageId = request.getParameter("messageId");
		request.setAttribute("messageId", messageId); //view page 로 파라미터 전달 
		
		return viewname;
	}
}
