package dataMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

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
	
	//find address by a_id
	public Address find(long id) throws SQLException{
		return (Address) abstractFind(id);
	}
	
}
