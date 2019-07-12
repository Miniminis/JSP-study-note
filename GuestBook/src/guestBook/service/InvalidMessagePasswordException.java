package guestBook.service;

public class InvalidMessagePasswordException extends Exception {

	public InvalidMessagePasswordException(String message) {
		super(message);
	}

}
