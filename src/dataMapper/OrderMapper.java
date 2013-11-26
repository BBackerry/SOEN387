package dataMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.net.ssl.SSLEngineResult.Status;

import virtualProxy.VirtualList;
import virtualProxy.VirtualListLoader;
import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import virtualProxy.VirtualList;
import virtualProxy.VirtualListLoader;
import domain.Address;
import domain.DomainObject;
import domain.Order;
import domain.OrderLine;
import domain.Product;

public class OrderMapper extends AbstractMapper{
	
	//order has billing and shipping addresses so the address mapper was used to get them.
	private AddressMapper am = new AddressMapper();
	//order has order lines so the order line mapper was used to get them. 
	private OrderLineMapper olm = new OrderLineMapper();
	
	//collumn of the db table. 
	public static final String COLUMNS = " o_id, c_id, total, date, status, shipping_address, billing_address, payment_type, credit_number";
	private final static String updateStatement = "UPDATE  Store_Order SET c_id = ?, total =?, date =?,"
            +" status =?, shipping_address =?, billing_address =?, payment_type = ?, credit_number=?  WHERE o_id = ?";
	
	//get all orders that are made by a customer 
	public List<Order> getOrdersByCustomerID(Long id) throws SQLException {
		PreparedStatement findByCustomerStatement = null; 
		//setup connection
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		Connection connection = sshSession.getConnection();
		//setup query
		findByCustomerStatement = connection.prepareStatement(findByCustomerStatement()); 
		findByCustomerStatement.setLong(1, id.longValue()); 
		ResultSet rs = findByCustomerStatement.executeQuery(); 
		//create the list of orders. 
		ArrayList<Order> orderList = new ArrayList<Order>();
		while (rs.next()) {
			orderList.add((Order)load(rs));
        }
		//connection.close();
		return orderList;	
	}

	
	//get all orders that are made 
		public List<Order> getAllOrders() throws SQLException {
			PreparedStatement findAllOrdersStatement = null; 
			//setup connection
			SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
			Connection connection = sshSession.getConnection();
			//setup query
			findAllOrdersStatement = connection.prepareStatement(findAllOrders());  
			ResultSet rs = findAllOrdersStatement.executeQuery(); 
			//create the list of orders. 
			ArrayList<Order> orderList = new ArrayList<Order>();
			while (rs.next()) {
				orderList.add((Order)load(rs));
	        }
			//connection.close();
			return orderList;	
		}
	protected String findAllOrders(){
		return "SELECT " + COLUMNS + " FROM Store_Order";
	}
	
	protected String findStatement(){
		return "SELECT " + COLUMNS + " FROM Store_Order" + " WHERE o_id = ?";
	}
	
	//statement to find all orders made by a customer.
	protected String findByCustomerStatement(){
		return "SELECT " + COLUMNS + " FROM Store_Order" + " WHERE c_id = ?";
	}
	
	@Override
	//loads the Order object. Has a Lazy load for its orderLines
	protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException {
		int c_id = rs.getInt(2);
		Double total = rs.getDouble(3);
		Timestamp date = rs.getTimestamp(4);
		int status = rs.getInt(5);
		Address shipping_address = am.find(Long.valueOf(rs.getInt(6)));
		Address billing_address = am.find(Long.valueOf(rs.getInt(7)));
		int payment_type = rs.getInt(8);
		String credit_number = rs.getString(9);
		
		Order result = new Order(id, c_id, total, date, status, shipping_address, billing_address, payment_type, credit_number);
		//lazy load for the order lines. 
		result.setOrderLines(new VirtualList<OrderLine>(new OrderLineLoader(id))); 
		return result; 
	}
	
	//lazy loader for order lines
	public class OrderLineLoader implements VirtualListLoader<OrderLine> { 
		private Long id; 
		
		public OrderLineLoader(Long id) { 
			this.id = id; 
		}
		//load up the Order Lines for an order. 
		public List<OrderLine> load() throws SQLException { 
			return olm.getOrderLinesByOrder(id); 
		} 
	}

	
	@Override
	protected String insertStatement() {
		return "INSERT INTO Store_Order ("+COLUMNS +") VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? )";
	}

	@Override
	protected String lastIDStatement() {
		return "SELECT MAX(o_id) FROM Store_Order ";
	}

	@Override
	protected String updateStatement() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void doInsert(DomainObject abstractSubject,
			PreparedStatement stmt) throws SQLException {
		Order subject = (Order) abstractSubject;

		stmt.setLong(1, subject.getId());
		stmt.setLong(2, subject.getC_id());
		stmt.setDouble(3, subject.getTotal());
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		stmt.setString(4, sdf.format(Calendar.getInstance().getTime()));
		stmt.setInt(5, enumTables.Status.valueOf("PENDING").ordinal()+1);
		stmt.setInt(6, (int)subject.getShip_address().getId());
		stmt.setInt(7, (int)subject.getBill_address().getId());
		stmt.setInt(8, subject.getPayment_type());
		stmt.setString(9, subject.getCredit_number());
		
	}

	@Override
	protected void doUpdate(DomainObject object, PreparedStatement stmt)
			throws SQLException {
		Order o = (Order) object;
		stmt.setInt(1, o.getC_id());
		stmt.setDouble(2, o.getTotal());
		stmt.setTimestamp(3,(Timestamp) o.getDate());
		stmt.setInt(4, o.getStatus());
		stmt.setLong(5, Long.valueOf(o.getShip_address().getId()));
		stmt.setLong(6, Long.valueOf(o.getBill_address().getId()));
		stmt.setDouble(7, o.getPayment_type());
		stmt.setString(8, o.getCredit_number());
		stmt.setLong(9, o.getId());
		
		
		
		
	}
	
	public Order find(long id) throws SQLException{
		return (Order) abstractFind(id);
	}

	@Override
	protected String deleteStatement() {
		return "UPDATE Store_Order SET status='2' WHERE o_id=?";
	}

	@Override
	protected void doDelete(DomainObject object, PreparedStatement stmt)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public long deleteOrder(long id) throws SQLException {
		PreparedStatement deleteOrderStatement = null; 
		//setup connection
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		Connection connection = sshSession.getConnection();
		//setup query
		deleteOrderStatement = connection.prepareStatement(deleteStatement()); 
		deleteOrderStatement.setLong(1, id); 
		deleteOrderStatement.executeUpdate();
		return id; 
	
	}

}
