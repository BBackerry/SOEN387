package common;

import java.sql.SQLException;

public class ApplicationException extends Exception {
	
	private static final long serialVersionUID = 1L;

	public ApplicationException(SQLException e)   {
	       super(e);
	   }

	   public ApplicationException(String msg, Throwable th){
	       super(msg, th);
	   }

}
