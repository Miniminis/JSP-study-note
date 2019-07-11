package jdbc;

public class outline {}

/* [guestBook project] Outline 
 * 메인 흐름: 사용자 -- jsp page (view or process) -- service 클래스 -- dao 클래스 
 * 1. DTO 클래스 - Message.java 
 * - 데이터베이스의 데이터를 가져와 저장 
 * - private 변수 : 데이터베이스의 컬럼 값들 받아오기 
 * - getter & setter 메서드 
 * - hasPassword() : 비밀번호 유효성 검사 - null 값 방지, 공백문자 방지
 * - matchPassword() : 삭제시에 본인 확인을 위한 비밀번호 비교  
 * 
 * 2. DAO 클래스 - MessageDao.java
 * - 조회, 추가, 수정, 삭제 기능을 담은 쿼리문들을 매서드화 
 * - 외부 참조 및 변경 불가능하도록 싱글톤 처리! 
 * - insert()
 * - delete()
 * - edit()
 * - search()   
 * 
 * 
 * 
 * */
