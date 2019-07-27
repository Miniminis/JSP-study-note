<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MVC PATTERN OUTLINE
1. 사용자의 요청 uri 
- 사용자 요청 uri - 이에 맞는 내부 클래스 경로 : key=value 형태로 외부 설정파일에 지정 

2. FrontController 로 이동 : 이곳에서 모든 요청 처리 return viewpage 
- init(config): 프로그램 시작시 init() 매서드 실행
	- 외부 설정파일인 commandsService.properties 를 읽어들여서 <key, value> 형태로 저장 
- doGet(), doPost() : 둘다 process(request, response) 호출 
- process(request, response) : 요청에 맞는 서비스 클래스로 이동 

3. 요청에 맞는 서비스 클래스로 이동 
- 각 서비스 클래스는 중심 Service 인터페이스를 implements 해야함 

4. 서비스 클래스에서 요청에 맞는 DAO 호출 및 결과 반환 : return 뷰페이지 + parameter를 request 속성에 저장해서 같이 보냄 
5. 뷰페이지가 다시 사용자에게 보여짐 

-->