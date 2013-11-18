package domain;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import virtualProxy.VirtualList;


public class Order extends DomainObject{
	private int c_id;
	private double total;
	private Date date;
	private int status;
	private Address ship_address;
	private Address bill_address;
	private int payment_type;
	private String credit_number;
	
	//lazy load for all orderLines in the order
	private VirtualList<OrderLine> orderLines;
	
	public Order(long o_id, int c_id, double total, Date date, int status,
			Address ship_address, Address bill_address, int payment_type, String credit_number) {
		super(o_id);
		this.c_id = c_id;
		this.total = total;
		this.date = date;
		this.status = status;
		this.ship_address = ship_address;
		this.bill_address = bill_address;
		this.payment_type = payment_type;
		this.credit_number = credit_number;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Address getShip_address() {
		return ship_address;
	}

	public void setShip_address(Address ship_address) {
		this.ship_address = ship_address;
	}

	public Address getBill_address() {
		return bill_address;
	}

	public void setBill_address(Address bill_address) {
		this.bill_address = bill_address;
	}

	public int getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(int payment_type) {
		this.payment_type = payment_type;
	}

	public String getCredit_number() {
		return credit_number;
	}

	public void setCredit_number(String credit_number) {
		this.credit_number = credit_number;
	}

	public VirtualList<OrderLine> getOrderLines() {
		return orderLines;
	}

	public void setOrderLines(VirtualList<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}
}
