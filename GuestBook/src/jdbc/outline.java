package jdbc;

public class outline {}

/* [guestBook project] Outline 
 * 메인 흐름: 사용자 -- jsp page (view or 간단한 process) -- service 클래스(사용자 요청 처리) -- dao 클래스 (DB관련 CRUD 처리)
 * 0. jdbc 
 * -  ConnectionProvider.java : 
 * 		- 서비스 내부에서 매 번 connection 객체를 별도로 생성할 경우, jdbc url 등 한 개의 항목이 바뀔 때,
 * 		전체 서비스 클래스들을 대상으로 수정 작업이 필요 --> 유지보수에 불편 
 * 		- 따라서 Connection 과 관련된 부분은 별도의 클래스로 생성하여 참조만 하도록 한다. 
 * - DBCPInit.java: 서버의 시작과 동시에 jdbc driver load + Connection pool에 등록 실행 
 * 					--> web.xml에 서블릿 등록함으로써 서버 시작과 동시에 해당 클래스를 읽을 수 있도록 함
 * - jdbcUtil.java: 
 * 		- DB 관련 객체의 종료 매서드들 : close(rs), close(stmt), close(conn)
 * 		- rollback(conn) --> conn.rollback();
 * 		 
 * 
 * 
 * 
 * 1. DTO 클래스 
 * (1) Message.java 
 * - 테이블의 컬럼과 메칭되는 데이터 관리 기능 클래스
 * - private 변수 : 데이터베이스의 컬럼 == 저장되는 항목
 * - getter & setter 메서드 : 데이터베이스에 저장 및 불러오기를 하게해주는 매서드
 * - hasPassword() : 삭제시 사용자 확인용 비밀번호 유효성 검사 - null 값 방지, 공백문자 방지
 * - matchPassword() : 삭제시에 본인 확인을 위한 비밀번호와 DB에서 가져와 Message 객체에 저장한 비밀번호를 비교  
 * 
 * (2) MessageListView.java 
 * - 게시글 보기 페이지에서 출력하기 위해 필요한 정보들을 게시글 단위로 묶음처리 
 * - 필요한 정보들: 
 * 		- a. 등록된 게시글 전체 리스트 : List<Message> --> 
 * 		- b. 전체 게시글 수  --> service 클래스  --> DAO 객체 --> selectCnt(conn) 매서드 호출 --> 쿼리문통해 DB에서 전체 게시글 개수 count 받아오기
 * 		- c. 전체 페이지 번호 --> 외부 정보 없이 클래스 내에서 구현할 수 있음 --> 매서드로 처리 후 생성자 생성시에 매서드 형태로 호출! 
 * 		- d. 현재 페이지 번호 --> formList.jsp 페이지에서 사용자가 클릭 입력한 page 번호를 service 페이지에 매개변수 형태로 전달 
 * 		- e. 페이지 당 게시글의 수 --> service 클래스에서 static 상수 3으로 정의 
 * 		- f. 페이지 내 첫번째 줄  
 * 		- g. 페이지 내 마지막 줄 
 * 
 * - 생성자를 통해 초기화 : c. 전체 페이지 번호의 경우 --> 미리 만들어 둔 매서드 호출 
 * - calculatePageTotalCnt() : 
 * 		- 만약 전체 게시글==0: 전체 페이지 번호 =0; 
 * 		- 만약 전체 게시글 >0: 
 * 			- c. 전체 페이지 번호: a/e 
 * 			- 만약에 나눗셈 결과 나머지가 있다면  c = a%e>0 --> c = c+1 
 * - 각 변수들의 getter 들 
 * - isEmpty()*** : 등록된 게시글 전체 리스트가 0개일때 전체 메시지의 개수도 0개  
 * 
 * 
 * 
 * 
 * 2. DAO 클래스 - MessageDao.java
 * - 조회, 추가, 수정, 삭제 기능을 담은 쿼리문들을 매서드화 
 * - 쿼리문 실행을 위해서 Connection 타입의 매개변수 필요
 * - 싱글톤 처리 : 클래스 당 한 개의 객체만 생성되도록 제약하는 구현 패턴
 * 		1. 외부 직접 참조 및 변경을 사전 차단 
 * 		2. 이 클래스는 기능클래스로 굳이 객체를 만들어서 참조할 필요가 없음 (참조해야할 특별한 변수가 없음)
 *			- 매번 객체를 만들어 참조하는 방법 보다는, getInstance() 매서드 호출만을 통해서 클래스에 접근할 수 있도록 한다. 
 * - insert(conn, message): 데이터 테이블에 message 객체에 담긴 데이터를 저장 
 * 		- conn --> sql, pstmt --> pstmt.setString or pstmt.setInt (index, message.getter)
 * 			--> resultCnt = pstmt.executeUpdate() --> return : resultCnt 
 * - selectCnt(conn) : 데이터테이블에서 전체 게시물 개수 받아오기 --> count(*) 이용  
 * 		- conn --> sql, stmt --> stmt.executeQuery(sql) --> return : resultCnt 
 * - selectList(conn, startRow, endRow) : 데이터테이블에서 페이지 당 게시물 개수만큼 테이블 출력하는 쿼리문 작성 및 실행 
 * 		- conn --> select sql, pstmt --> setInt (1, endRow), setInt(2, startRow) --> pstmt.executeQuery();
 * 		- while 문 : Message 객체 생성후, 해당 객체에 가져온 데이터리스트 컬럼별로(변수별로) 저장 --> list 배열에 저장 (3개의 게시글, 3개의 개시글, 3개의 게시글 ...)
 * 	- select(conn, mid) : message_id 를 통해 삭제하고자 하는 게시글 데이터 1개 가져오기 
 * 		- conn --> select sql where message_id=?, pstmt --> setInt(1, mid) --> pstmt.executeQuery();
 * 		- 반환 rs는 1개이므로 만약 DB에 message_id 값에 맞는 데이터가 있다면 --> Message 객체 생성 후, 해당 객체에 가져온 데이터 1행을 컬럼별로(변수별로) 저장 --> return : Message 타입 객체 
 * - deleteMessage(conn, mId) : 데이터테이블에서 mId 값에 맞는 행 삭제처리 
 * 		- conn --> delete sql where message_id=mId , pstmt --> setInt(1, mId) --> pstmt.executeQuery(); 
 * 		- resultCnt = 정상처리시 1, 비정상처리시 0반환  --> return: resultCnt 
 * 
 *  
 * 
 * 3. service 패키지 
 * - 사용자 요청에 맞는 흐름을 구성 : DAO 객체를 통해서/ + 트랜잭션 관리
 * - 사용자 요청별로 클래스를 나누어 처리
 * (1) WriteMessageService
 * - 사용자의 요청: 게시글 작성 <-- writeMessage.jsp로부터 객체 생성 및 매서드 호출됨
 * - write(message): 
 * 		1. 저장하고자하는 데이터 message 매개변수로 전달받음 
 * 		2. DB에 저장을 위해 Connection 객체 생성 - ConnectionProvider 객체 이용 
 * 		3. 쿼리문 실행을 위해 DAO 객체 참조 - MessageDao.getInstance() 
 * 		4. 해당 객체를 통해 dao 속의 insert() 매서드 실행 : 데이터 베이스 연결을 위한 conn, 저장하고자 하는 데이터 message 매개변수로 전달
 * 		5. insert() return resultCnt --> int resultCnt 변수에 담기 
 * 		6. write() return resultCnt 
 * (2) getMessageListView
 * - 사용자의 요청: 게시글 리스트 보기 <-- formList.jsp 첫 페이지에서 클릭으로 사용자 입력받은 결과 
 * - getMessageListView(pageNumber) : 
 * 		1. 보고싶은 페이지의 번호 입력: pageNumber 매개변수 전달받기 
 * 		2. DB 접근을 위해 Connection 객체 생성 - ConnectionProvider 객체 이용
 * 		3. 페이지별 게시글 리스트 표시를 위해 필요한 정보를 차례로 정의하기(a ~ e)  
 * 			- c. MessageListView 클래스 내부에서 객체 생성시 (생성자 초기화) 같이 매서드 형태로 호출되도록 처리함 
 * 			- d. 현재 페이지 번호 : 객체 호출시에 매개변수로 전달받음 <-- formList.jsp 페이지로부터 
 * 			- e. 한 페이지 당 게시글의 수 : MESSAGE_COUNT_PER_PAGE=3 --> 게시글의 수는 변하지 않고 고정되어있으므로 상수 처리 
 * 			- b. 전체 게시글 수 : DAO 객체 --> selectCnt(conn) 매서드 호출 --> 쿼리문통해 DB에서 전체 게시글 개수 count 받아오기
 * 		- 분기처리 : 만약 b.전체 게시글 수 > 0 
 *  		- f. 페이지 내 첫번째 줄 : (현재 페이지 번호-1)*페이지 당 게시물 개수 +1; 
 *  		- g. 페이지 내 마지막 줄 : 시작 줄 + 페이지 당 게시물 개수 -1;
 *   		- a. 등록된 게시글 전체 리스트 : DAO 객체 --> selectList(conn, startRow, endRow) 
 * 		- 분기처리 : else --> 현재 페이지 번호 =0, 전체 리스트 배열 =empty  
 * 		4. MessageListView 객체 생성을 위한 모든 변수가 정의 되었다면, 해당 변수들을 이용해서 MessageListView 타입 객체 생성 : return view 
 * (3) DeleteMessageService 
 * - 사용자의 요청: 게시글 삭제 
 * - deleteMessage(mId, pw): 
 * 		1. deleteConfirm 페이지로부터 삭제하고자 하는 게시글의 id, 및 사용자 확인용 password 를 매개변수로 전달받음 
 * 		2. DB 접근을 위해 Connection 객체 생성 - ConnectionProvider 객체 이용
 * 		3. 삭제 오류시를 대비한 트랜잭션 관리 시작 : conn.setAutocommit(false); + conn.commmit() 
 * 		4. 먼저 DB에서 삭제하고자하는 게시물 선택을 위해 DAO 객체 속 select(conn, mid) 메서드 호출 : DB접근을 위해 connection 객체, 삭제하고자 하는 게시물 선택을 위해 게시물 id 매개변수로 전달 --> select(conn, mid)
 * 		5. select(conn, mid)의 결과 return : 사용자 입력 message_id 에 맞는 Message 타입 객체 
 * 		6. 예외처리: 
 * 			- message 객체가 존재하지 않으면 --> MessageNotFoundException(mId+"번 메시지가 존재하지 않습니다.")
 * 			- message는 존재하는데 비밀번호 입력값이 없다면 --> InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.")
 * 			- message 도 존재하고, 비밀번호 입력값도 있는데, 일치하지 않는다면 --> InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.")
 * 		7. 비밀번호가 존재하고, 일치한다면 게시물 삭제 처리 진행 --> DAO 객체 속 deleteMessage(conn, mId) --> return: resultCnt 삭제 실행 결과 정상=1, 비정상=0;
 * 		8. conn.commit() 으로 트랜잭션 종료 
 * 		9. 예외처리시: 트랜잭션에 잘못된 정보가 처리되지 않도록 --> jdbcUtil.rollback(conn) 이용하여 마지막 커밋 위치로 이동시킴, 잘못된 실행과정을 commit 에 포함하지 않도록 
 * 		10. return: resultCnt 정상=1, 비정상=0; 
 * 
 * 
 * 
 * 4. jsp 페이지
 * (1) 게시글 쓰기 formList.jsp : 게시글을 입력하는 form 페이지 --> writeMessage.jsp 
 * (2) 게시글 등록 처리 페이지 writeMessage.jsp : 
 * 		1. 넘겨받은 데이터 Message 객체에 저장 : useBean 액션 태그 사용 
 * 		2. WriteMessageService 객체참조 : 해당 객체의 매서드 호출 + 매개변수 message : 해당 객체에 저장한 데이터(이름, 비번, 게시글)
 * 		3. 실행결과출력 : write() return resultCnt --> int cnt 변수에 저장
 * 		4. <body> 만약 cnt>0 --> 실행 성공 , cnt==0 --> 실행 실패 결과 출력 
 * (3) 게시글 리스트 보기 formList.jsp 페이지 하단에 출력 : 게시글 내용, 페이지 번호 표시 
 * 		0. 게시글 리스트 출력을 위해 Model 생성 : MessageListView.java   
 * 		1. 리스트를 불러오기 위한 클릭입력 처리를 위해 게시판의 페이지 번호 int pageNumber 변수 생성. 
 * 			- 파라미터 전달 오류를 대비해 1로 초기화 
 * 			- 향후 사용자의 클릭 입력에 따라 다른 파라미터값 가져옴 
 * 			- 해당 pageNumber를 service 클래스로 넘겨서 각 페이지에 맞는 리스트 객체 출력할 수 있도록 함.
 * 		2. 게시글 리스트 요청을 수행할 GetMessageListService 객체 참조 
 * 			: 해당 객체의 매서드 getMessageListView(매개변수 pageNumber) 호출
 * 				--> 리스트를 보기 위해서는 페이지 번호가 필요하므로 pageNumber 매개변수로 전달 
 * 				--> return MessageListView 타입의 객체 
 * 		3. 분기처리
 * 		- 만약 MessageListView 객체 isEmpty() --> 등록된 메시지가 없습니다. 
 * 		- 객체가 있다면 -->  MessageListView.getMessageList() 통해서 메시지 리스트 (3개의 메시지 씩 저장된 리스트) 받아와서 반복문  
 * 	(4) 게시글 삭제 confirmDeletion.jsp 
 * 		1. writeMessage.jsp 로부터 삭제하고자하는 게시글의 id 받아오기 : message_id
 * 		2. <body>에서는 파라미터로 받은 message_id 를 input: hidden 타입으로 다시  삭제 처리페이지 deleteMessage.jsp 로 보냄
 * 		3. input : password 를 통해 삭제시 비밀번호 한 번 더 컨펌하기 --> 해당 비밀번호를 name 값을 통해 역시 삭제 처리페이지 deleteMessage.jsp 로 보냄
 * (5) 게시글 삭제 deleteMessage.jsp 
 * 		1. confirmDeletion.jsp 에서 파라미터 통해서 받은 게시글 id 및 사용자 확인 비밀번호를 변수에 담기 
 * 		--> 이때, 게시글 id는 string type 이므로 데이터베이스에서 해당 값을 사용할 수 있도록 Integer 통해 int 타입으로 변환하여 처리한다. 
 * 		2. 실행결과 확인을 위한 int resultCnt 변수 및 boolean loginChk 변수를 초기화 
 * 		3. 사용자 요청 처리를 위해 service 객체 생성 후, deleteMessage(mid, password) 매서드 호출: 사용자의 요청이 담긴 게시글 id 및 비밀번호입력값을 역시 매개변수로 전달해준다. 
 * 		4. resultCnt 값 변수에 받고, loginChk 값을 true로 바꿈 
 * 		5. 예외처리 : SQLException, MessageNotFoundException, InvalidMessagePasswordException
 * 		6. <body>에서는 loginChk 값에 따라서 분기처리 : 
 * 			- loginChk : resultCnt 개의 행이 삭제되었습니다. 
 * 			- !loginChk : out.print(msg) - 각 예외에 맞는 메시지 출력 
 * 
 * 
 * 
 * */
