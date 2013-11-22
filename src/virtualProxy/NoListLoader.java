package virtualProxy;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.OrderLine;

public class NoListLoader<E> implements VirtualListLoader<E> { 

	public NoListLoader() {
	}
	public List<E> load() throws SQLException{
		return new ArrayList<E>();
	}
	 
}
