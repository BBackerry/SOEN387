package virtualProxy;
import java.sql.SQLException;
import java.util.List;

//generic virtualList that is the used in lazy load. 
public class VirtualList<E> {
	private List<E> source;
	private VirtualListLoader<E> loader; 
	public VirtualList(VirtualListLoader<E> loader) {
		this.loader = loader; 
	} 
	//get the lazy loaded list if it does not exist
	public List<E> getSource() throws SQLException {
		if (source == null) source = loader.load();
		return source; 
	}
}
