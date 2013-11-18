package domain;

import java.awt.Image;
import java.sql.Blob;
import java.util.Date;

public class Product extends DomainObject{
	private String p_desc;
	private int p_type;
	private Date p_release_date;
	private int p_rating;
	private Blob p_img;
	private int p_console;
	private int p_stock;
	private Double p_price;
	private Double p_user_rating;
	private int p_condition;
	private String p_title;
	private int p_category;
	
	public Product(long p_id, String p_desc, int p_type, Date p_release_date,
			int p_rating, Blob p_img, int p_console, int p_stock,
			Double p_price, Double p_user_rating, int p_condition,
			String p_title, int p_category) {
		super(p_id);
		this.p_desc = p_desc;
		this.p_type = p_type;
		this.p_release_date = p_release_date;
		this.p_rating = p_rating;
		this.p_img = p_img;
		this.p_console = p_console;
		this.p_stock = p_stock;
		this.p_price = p_price;
		this.p_user_rating = p_user_rating;
		this.p_condition = p_condition;
		this.p_title = p_title;
		this.p_category = p_category;
	}
	public Product(String p_desc, int p_type, int p_stock, int p_condition,
			String p_title, int p_category) {
		super();
		this.p_desc = p_desc;
		this.p_type = p_type;
		this.p_stock = p_stock;
		this.p_condition = p_condition;
		this.p_title = p_title;
		this.p_category = p_category;
	}
	public String getP_desc() {
		return p_desc;
	}
	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}
	public int getP_type() {
		return p_type;
	}
	public void setP_type(int p_type) {
		this.p_type = p_type;
	}
	public Date getP_release_date() {
		return p_release_date;
	}
	public void setP_release_date(Date p_release_date) {
		this.p_release_date = p_release_date;
	}
	public int getP_rating() {
		return p_rating;
	}
	public void setP_rating(int p_rating) {
		this.p_rating = p_rating;
	}
	public Blob getP_img() {
		return p_img;
	}
	public void setP_img(Blob p_img) {
		this.p_img = p_img;
	}
	public int getP_console() {
		return p_console;
	}
	public void setP_console(int p_console) {
		this.p_console = p_console;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public Double getP_price() {
		return p_price;
	}
	public void setP_price(Double p_price) {
		this.p_price = p_price;
	}
	public Double getP_user_rating() {
		return p_user_rating;
	}
	public void setP_user_rating(Double p_user_rating) {
		this.p_user_rating = p_user_rating;
	}
	public int getP_condition() {
		return p_condition;
	}
	public void setP_condition(int p_condition) {
		this.p_condition = p_condition;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
	}
	
	
}
