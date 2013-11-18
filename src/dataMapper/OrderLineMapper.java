package dataMapper;
import java.awt.Image;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import virtualProxy.VirtualList;
import virtualProxy.VirtualListLoader;
import domain.Address;
import domain.Customer;
import domain.DomainObject;
import domain.Order;
import domain.OrderLine;
import domain.Product;


public class OrderLineMapper extends AbstractMapper{
	
	//orderLine has a product so we use this to call db to get product. 
	ProductMapper pm = new ProductMapper();
	
	//collumns in db table
	public static final String COLUMNS = " o_id, p_id, quantity, p_price, line_total";
	
	protected String findStatement(){
		return "SELECT " + COLUMNS + " FROM Order_Line" + " WHERE o_id = ? AND p_id = ?";
	}
	
	//find all orderlines associated to a order.
	protected String findByOrderIdStatement(){
		return "SELECT " + COLUMNS + " FROM Order_Line" + " WHERE o_id = ?";
	}
	
	//load a order line object. Note it loads the product object at the same time since we need them both. 
	protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException {
		int p_id = rs.getInt(2);
		int quantity = rs.getInt(3);
		Double price = rs.getDouble(4);
		Double line_total = rs.getDouble(5);
		Product product = pm.find(Long.valueOf(p_id));
		
		OrderLine result = new OrderLine(id, p_id, quantity, price, line_total, product);
		return result; 
	}

	//get all order lines in a order. 
	public List<OrderLine> getOrderLinesByOrder(Long id) throws SQLException {
		PreparedStatement findByOrderIdStatement = null; 
		//setup connection
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		Connection connection = sshSession.getConnection();	
		//prepare statement
		findByOrderIdStatement = connection.prepareStatement(findByOrderIdStatement()); 
		findByOrderIdStatement.setLong(1, id.longValue()); 
		ResultSet rs = findByOrderIdStatement.executeQuery(); 
		//generate list of OrderLine
		ArrayList<OrderLine> orderLineList = new ArrayList<OrderLine>();
		while (rs.next()) {
			orderLineList.add((OrderLine)load(rs));
        }
		connection.close();
		return orderLineList;	
		
	}
	
}
