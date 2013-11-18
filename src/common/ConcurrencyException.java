package common;

import java.sql.SQLException;

public class ConcurrencyException extends Exception {
	
	private static final long serialVersionUID = 1L;

	public ConcurrencyException(SQLException e)   {
	       super(e);
	   }

	   public ConcurrencyException(String msg, Throwable th){
	       super(msg, th);
	   }

	public ConcurrencyException(String msg) {
		// TODO Auto-generated constructor stub
		super(msg);
	}

}
