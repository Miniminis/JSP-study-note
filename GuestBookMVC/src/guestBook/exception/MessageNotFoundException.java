package guestBook.exception;

public class MessageNotFoundException extends Exception {
	
	
	//예외클래스 --> Exception 상속하여 생성한다.
	
	public MessageNotFoundException(String message) {
		super(message);
	}

}
