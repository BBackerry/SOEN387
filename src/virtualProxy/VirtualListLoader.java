package virtualProxy;
import java.sql.SQLException;
import java.util.List;

//generic interface for the lazy load's list to call to load the list. 
public interface VirtualListLoader<E> {
	List<E> load() throws SQLException;
}
