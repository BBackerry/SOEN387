package domain;

import java.util.Date;

public class Address extends DomainObject{
	private String street;
	private String postal_code;
	private int province;
	private int country;
	private String apt_suite_unit;
	private Date last_modified;
	private String city;

	public Address(long a_id, String street, String postal_code, int province,
			int country, String apt_suite_unit, Date last_modified, String city) {
		super(a_id);
		this.street = street;
		this.postal_code = postal_code;
		this.province = province;
		this.country = country;
		this.apt_suite_unit = apt_suite_unit;
		this.last_modified = last_modified;
		this.city = city;
	}

	public Address(String street, String postal_code, int province,
			int country, String apt_suite_unit, String city) {
		super();
		this.street = street;
		this.postal_code = postal_code;
		this.province = province;
		this.country = country;
		this.apt_suite_unit = apt_suite_unit;
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public int getProvince() {
		return province;
	}

	public void setProvince(int province) {
		this.province = province;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public String getApt_suite_unit() {
		return apt_suite_unit;
	}

	public void setApt_suite_unit(String apt_suite_unit) {
		this.apt_suite_unit = apt_suite_unit;
	}

	public Date getLast_modified() {
		return last_modified;
	}

	public void setLast_modified(Date last_modified) {
		this.last_modified = last_modified;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	
}
