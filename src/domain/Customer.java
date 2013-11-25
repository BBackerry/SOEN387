package domain;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import virtualProxy.VirtualList;


public class Customer extends DomainObject{
	
	//lazy load for orders
	private VirtualList<Order> orders;
	
	private String f_name;
	private String l_name;
	private Date dob;
	private String email;
	private Date last_modified;
	private String username;
	private String password;
	private String category;
	
	public Customer(long c_id, String f_name,String l_name, Date dob, String email, Date last_modified, String username, String password, String category) {
		super(c_id);
		this.f_name = f_name;
		this.l_name = l_name;
		this.dob = dob;
		this.email = email;
		this.last_modified = last_modified;
		this.username = username;
		this.password = password;
		this.category = category;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getLast_modified() {
		return last_modified;
	}

	public void setLast_modified(Date last_modified) {
		this.last_modified = last_modified;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public VirtualList<Order> getOrders() {
		return orders;
	}

	public void setOrders(VirtualList<Order> virtualList) {
		orders = virtualList;	
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}


}
