package dataMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import virtualProxy.VirtualList;
import virtualProxy.VirtualListLoader;
import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import domain.Address;
import domain.DomainObject;
import domain.Order;
import domain.OrderLine;
import dataMapper.CustomerMapper.OrderLoader;

public class OrderMapper extends AbstractMapper{
	
	//order has billing and shipping addresses so the address mapper was used to get them.
	private AddressMapper am = new AddressMapper();
	//order has order lines so the order line mapper was used to get them. 
	private OrderLineMapper olm = new OrderLineMapper();
	
	//collumn of the db table. 
	public static final String COLUMNS = " o_id, c_id, total, date, status, shipping_address, billing_address, payment_type, credit_number";
	
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
		connection.close();
		return orderList;	
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
		Date date = rs.getTimestamp(4);
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

}
