package guestBook.Model;

import java.util.List;

public class MessageListView {
	
	//변수 설정은 이곳에서, 각 변수들의 로직은 GetMessageListService.java 에서 구상 
	
	private int messageTotalCnt;  //전체 등록된 방명록의 수 
	private int currentPageNumber; //현재 페이지 번호 
	private List<Message> messageList; //등록된 메시지 리스트 
	private int pageTotalCnt; //전체 페이지의 수 
	private int messageCountPerPage; //페이지 별 방명록의 수 
	private int startRow; //페이지의 제일 첫번째 줄 
	private int endRow;   //페이지의 제일 마지막 줄
	
	//생성자
	public MessageListView(
			int messageTotalCnt, 
			int currentPageNumber, 
			List<Message> messageList,
			int messageCountPerPage, 
			int startRow, 
			int endRow) {

		this.messageTotalCnt = messageTotalCnt;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerPage = messageCountPerPage;
		this.startRow = startRow;
		this.endRow = endRow;
		calculatePageTotalCnt(); //pageTotalCnt 
	}

	//페이지 번호 매서드 
	private void calculatePageTotalCnt() {
		
		//	7/3 = 2 + (7%3 >0 이면 1);
		if(messageTotalCnt==0) {
			pageTotalCnt=0;
		} else {
			pageTotalCnt = messageTotalCnt / messageCountPerPage;
			if(messageTotalCnt % messageCountPerPage >0) {
				pageTotalCnt = pageTotalCnt + 1;
			}
		}	
	}
	
	//getters
	public int getMessageTotalCnt() {
		return messageTotalCnt;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public int getPageTotalCnt() {
		return pageTotalCnt;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	
	//메시지 
	public boolean isEmpty() {
		return messageTotalCnt ==0; 
	}
}
