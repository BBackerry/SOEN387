package dataMapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import virtualProxy.VirtualList;
import virtualProxy.VirtualListLoader;
import domain.Customer;
import domain.DomainObject;
import domain.Order;


public class CustomerMapper extends AbstractMapper{


	//field in db table

	//OrderMapper since the customer would generally check only his own orders
	private OrderMapper om = new OrderMapper();
	
	//collumn in db table
	public static final String COLUMNS = " c_id, first_name, last_name, dob, email, last_modified, username, password,category";
	private final static String findByAccountStatement = "SELECT " + COLUMNS + " FROM Customer  WHERE UPPER(username) like UPPER(?) ORDER BY username";
	
	protected String findStatement(){
		return "SELECT " + COLUMNS + " FROM Customer" + " WHERE c_id = ?";
	}
	
	//loads a customer object. Defines lazy load of orders. 
	protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException {
		String f_name = rs.getString(2);
		String l_name = rs.getString(3);
		Date dob = rs.getDate(4);
		String email = rs.getString(5);
		Date last_modified = rs.getTimestamp(6);
		String username = rs.getString(7);
		String password = rs.getString(8);
		String category = rs.getString(9);
		Customer result = new Customer(id, f_name, l_name, dob, email, last_modified, username, password,category); 
		//lazy load of the orders
		result.setOrders(new VirtualList<Order>(new OrderLoader(id))); 
		return result; 
	}
	
	//find customer by c_id
	public Customer find(long id) throws Exception{
		return (Customer) abstractFind(id);
	}
	
	//find customer by username
	public Customer findByAccount(String username)  {
		// TODO Auto-generated method stub
		PreparedStatement findStatement = null; 
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		Connection connection = sshSession.getConnection();
		ResultSet rs = null;
		Customer result = null;
		try {
			findStatement = connection.prepareStatement(findByAccountStatement);
			findStatement.setString(1, username);
			System.out.println("user name is "+username);
			rs = findStatement.executeQuery(); 
			rs.next();
			
			Long id = new Long(rs.getLong(1)); 
			if (loadedMap.containsKey(id)) 
				return (Customer) loadedMap.get(id); 
			result = (Customer) doLoad(id, rs);
			loadedMap.put(id.toString(), result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	//lazy loader for the order
	public class OrderLoader implements VirtualListLoader<Order> { 
		private Long id; 
		
		public OrderLoader(Long id) { 
			this.id = id; 
		}
		//gets order using this method
		public List<Order> load() throws SQLException { 
			return om.getOrdersByCustomerID(id); 
		} 
	}


	@Override
	protected String insertStatement() {		
		return "INSERT INTO Customer (" + COLUMNS + ")" + " VALUES ( ? , ? , ? , ? , ? , ? , ? , ?, ? )";
	}

	@Override
	protected String lastIDStatement() {	
		return "SELECT MAX(c_id) FROM Customer";
	}

	@Override
	protected void doInsert(DomainObject abstractSubject, PreparedStatement stmt) throws SQLException {
		Customer subject = (Customer) abstractSubject;
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		stmt.setLong(1, subject.getId());
		stmt.setString(2, subject.getF_name());
		stmt.setString(3, subject.getL_name());
		stmt.setString(4, sdf.format(subject.getDob()).substring(0,10));
		stmt.setString(5, subject.getEmail());
		stmt.setString(6, sdf.format(Calendar.getInstance().getTime()));
		stmt.setString(7, subject.getUsername());
		stmt.setString(8, subject.getPassword());
		stmt.setString(9, subject.getCategory());
	}

	@Override
	protected String updateStatement() {
		return "UPDATE Customer SET email = ?, last_modified = ?, username = ?, password = ?, first_name = ?, last_name = ?, dob = ? WHERE c_id = ?";
	}

	@Override
	protected void doUpdate(DomainObject abstractSubject, PreparedStatement stmt) throws SQLException {
		Customer subject = (Customer) abstractSubject;
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		stmt.setString(1, subject.getEmail());
		stmt.setString(2, sdf.format(Calendar.getInstance().getTime()));
		stmt.setString(3, subject.getUsername());
		stmt.setString(4, subject.getPassword());
		stmt.setString(5, subject.getF_name());
		stmt.setString(6, subject.getL_name());
		stmt.setString(7, sdf.format(subject.getDob()).substring(0,10));
		stmt.setLong(8, subject.getId());
	}


	@Override
	protected String deleteStatement() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void doDelete(DomainObject object, PreparedStatement stmt)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}


}
