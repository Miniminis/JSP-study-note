<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	//String price = request.getParameter("price");
 	String region = request.getParameter("region");
 	
	//System.out.println(name+":"+price);
	System.out.println(name+":"+region);

	String str = "";
/* 
	if (name == null || price == null) {		
		str = "상품 이름 없음:가격 정보 없음";
	}else{
		str = name + ":" + price;		
	}
	
 */	
 	if (name == null || region == null) {		
		str = "이름 없음:지역 정보 없음";
	}else{
		str = name + ":" + region;		
	}

	out.print(str);
%>