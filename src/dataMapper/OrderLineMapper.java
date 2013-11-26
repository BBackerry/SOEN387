package dataMapper;
import java.awt.Image;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
		return orderLineList;	
		
	}

	@Override 
	public Long insert(DomainObject subject) throws ClassNotFoundException, SQLException {
		

			//setConnection();
			SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

			DB = ssHsession.getConnection();
			
	
		PreparedStatement insertStatement = null;
		
		insertStatement = DB.prepareStatement(insertStatement());
		doInsert(subject, insertStatement);
		insertStatement.execute();
		loadedMap.put(String.valueOf(subject.getId()), subject);
		return subject.getId();
	}

	@Override
	protected String insertStatement() {
		return "INSERT INTO Order_Line ( "+COLUMNS+" ) VALUES ( ? , ? , ? , ? , ? )" ;
	}

	@Override
	protected String lastIDStatement() {
		return null;
	}



	@Override
	protected void doInsert(DomainObject abstractSubject,
			PreparedStatement stmt) throws SQLException {
		OrderLine subject = (OrderLine) abstractSubject;
		stmt.setInt(1, (int) subject.getId());
		stmt.setInt(2, subject.getP_id());
		stmt.setInt(3, subject.getQuantity());
		stmt.setDouble(4, subject.getPrice());
		stmt.setDouble(5, subject.getLine_total());
	}

	@Override
	protected void doUpdate(DomainObject object, PreparedStatement stmt)
			throws SQLException {
		// TODO Auto-generated method stub
		
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

	@Override
	protected String updateStatement() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
