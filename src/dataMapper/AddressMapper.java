package dataMapper;
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


public class AddressMapper extends AbstractMapper{

	//field in db table
	public static final String COLUMNS = " a_id, street, postal_code, province, country, apt_suite_unit, last_modified, city";
	
	protected String findStatement(){
		return "SELECT " + COLUMNS + " FROM Address" + " WHERE a_id = ?";
	}
	
	//loads address object
	protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException {
		String street = rs.getString(2);
		String postal_code = rs.getString(3);
		int  province = rs.getInt(4);
		int country = rs.getInt(5);
		String apt_suite_unit = rs.getString(6);
		Date last_modified = rs.getTimestamp(7);
		String city = rs.getString(8);
		Address result = new Address(id, street, postal_code, province, country, apt_suite_unit, last_modified, city); 
		return result; 
	}
	
	//get all addresses of a customer 
	public List<Address> getAddressByCustomerID(Long id) throws SQLException {
		PreparedStatement findByCustomerStatement = null; 
		//setup connection
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		Connection connection = sshSession.getConnection();
		//setup query
		findByCustomerStatement = connection.prepareStatement(findByCustomerStatement()); 
		findByCustomerStatement.setLong(1, id.longValue()); 
		ResultSet rs = findByCustomerStatement.executeQuery(); 
		//create the list of orders. 
		ArrayList<Address> orderList = new ArrayList<Address>();
		while (rs.next()) {
			orderList.add((Address)load(rs));
        }
		connection.close();
		return orderList;	
	}
	
	public void doInsert(DomainObject abstractSubject,  PreparedStatement stmt) throws SQLException {
		Address subject = (Address) abstractSubject;
		stmt.setLong(1, subject.getId());
		stmt.setString(2, subject.getStreet());
		stmt.setString(3, subject.getPostal_code());
		stmt.setInt(4, subject.getProvince());
		stmt.setInt(5, subject.getCountry());
		stmt.setString(6, subject.getApt_suite_unit());
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		stmt.setString(7, sdf.format(Calendar.getInstance().getTime()));
		stmt.setString(8, subject.getCity());
	}
	
	protected String insertStatement() {
		return "INSERT INTO Address (" + COLUMNS + ")" + " VALUES ( ? , ? , ? , ? , ? , ? , ? , ? )";
	}

	protected String lastIDStatement() {
		return "SELECT MAX(a_id) FROM Address";
	}
	
	private String findByCustomerStatement() {
		return "SELECT " + "Address."+COLUMNS +
				" FROM Customer_Address INNER JOIN Address ON Customer_Address.a_id = Address.a_id " +
				" WHERE c_id = ?";
	}
		
	//find address by a_id
	public Address find(long id) throws SQLException{
		return (Address) abstractFind(id);
	}

	@Override
	protected String updateStatement() {
		return "UPDATE Address SET " +
				"street = ?, postal_code = ?, province = ?, country = ?, apt_suite_unit = ?, last_modified = ?, city = ?" +
				"WHERE a_id = ? ";
	}

	@Override
	protected void doUpdate(DomainObject abstractSubject, PreparedStatement stmt)
			throws SQLException {
		Address subject = (Address) abstractSubject;
		stmt.setString(1, subject.getStreet());
		stmt.setString(2, subject.getPostal_code());
		stmt.setInt(3, subject.getProvince());
		stmt.setInt(4, subject.getCountry());
		stmt.setString(5, subject.getApt_suite_unit());
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		stmt.setString(6, sdf.format(Calendar.getInstance().getTime()));
		stmt.setString(7, subject.getCity());
		stmt.setLong(8, subject.getId());
	}
	
	protected String deleteStatement() {
		return "DELETE FROM Address WHERE a_id = ? ";
	}
	
	@Override
	protected void doDelete(DomainObject abstractSubject, PreparedStatement stmt)
			throws SQLException {
		stmt.setLong(1, abstractSubject.getId());
	}
	
	public boolean insertCustomerAddress(long a_id, long c_id) throws SQLException{

		//if(DB==null) {
			//setConnection();
			SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

			DB = ssHsession.getConnection();
			
		//}
		PreparedStatement insertStatement = null;
		
		insertStatement = DB.prepareStatement(insertCustomerAddress());
		
		insertStatement.setLong(1, c_id);
		insertStatement.setLong(2, a_id);
		if(insertStatement.executeUpdate() == 1){
			//DB.close();
			return true;
		} else {
			//DB.close();
			return false;
		}
	}

	private String insertCustomerAddress() {
		return "INSERT INTO Customer_Address (c_id, a_id) VALUES ( ?, ?)";
	}
	

	public boolean deleteCustomerAddress(long a_id, long c_id) throws SQLException{

		//if(DB==null) {
			//setConnection();
			SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

			DB = ssHsession.getConnection();
			
		//}
		PreparedStatement insertStatement = null;
		
		insertStatement = DB.prepareStatement(deleteCustomerAddress());
		
		insertStatement.setLong(1, c_id);
		insertStatement.setLong(2, a_id);
		if(insertStatement.executeUpdate() == 1){
			//DB.close();
			return true;
		} else {
			//DB.close();
			return false;
		}
	}

	private String deleteCustomerAddress() {
		return "DELETE FROM Customer_Address c_id = ? AND a_id = ?";
	}
}
