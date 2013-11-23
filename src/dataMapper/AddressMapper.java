package dataMapper;
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
import enumTables.Country;


public class AddressMapper extends AbstractMapper{

	//field in db table
	public static final String COLUMNS = " Address.a_id, street, postal_code, province, country, apt_suite_unit, last_modified, city";
	
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
	
	public List<String> getAllCountries() throws SQLException {
		ArrayList<String> countryList = new ArrayList<String>();
		PreparedStatement findByCustomerStatement = null; 
		//setup connection
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		Connection connection = sshSession.getConnection();
		//setup query
		findByCustomerStatement = connection.prepareStatement("SELECT country_name FROM Country"); 
		ResultSet rs = findByCustomerStatement.executeQuery(); 
		//create the list of orders. 
		while (rs.next()) {
			countryList.add(rs.toString());
        }
		connection.close();
		return countryList;
	}
	
	private String findByCustomerStatement() {
		return "SELECT " + COLUMNS +
				" FROM Customer_Address INNER JOIN Address ON Customer_Address.a_id = Address.a_id " +
				" WHERE c_id = ?";
	}
		
	//find address by a_id
	public Address find(long id) throws SQLException{
		return (Address) abstractFind(id);
	}

	@Override
	protected String insertStatement() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String lastIDStatement() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void doInsert(DomainObject subject,
			PreparedStatement insertStatement) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}
