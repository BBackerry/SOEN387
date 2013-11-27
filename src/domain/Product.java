package domain;

import java.sql.Timestamp;

public class Product extends DomainObject{
	
	private int p_category;
	private String p_title;
	private Timestamp p_release_date;

	private int p_type;
	private int p_condition;
	private int p_console;
	private int p_stock;
	private Double p_price;
	private String p_status;
	private int p_rating;
	private int p_version;
	
	public Product(long p_id,  int p_type, Timestamp p_release_date,
			int p_rating, int p_console, int p_stock,
			Double p_price, int p_condition,
			String p_title, int p_category,String p_desc,int p_version) {
		super(p_id);
		this.p_status = p_desc;
		this.p_type = p_type;
		this.p_release_date = p_release_date;
		this.p_rating = p_rating;
		this.p_console = p_console;
		this.p_stock = p_stock;
		this.p_price = p_price;
		this.p_condition = p_condition;
		this.p_title = p_title;
		this.p_category = p_category;
		this.p_version =p_version;
	}
	public Product(int p_category ,String p_title,Timestamp p_release_date, int p_type,  int p_condition, int p_console, 
			int p_qty, double p_price) {
		super();
		this.p_category = p_category;
		this.p_title = p_title;
		this.p_release_date = p_release_date;
		this.p_type = p_type;
		this.p_console = p_console;
		this.p_condition = p_condition;
		this.p_stock = p_qty;
		this.p_price = p_price;
		this.p_version = 1;
		this.p_status = "ACTIVE";
	
	}
	public Product(long id, String productName, Integer category,
			Integer type, Integer condition, Integer console,
			Integer quantity, Double price, String releaseDate, Integer version) {
		// TODO Auto-generated constructor stub
		super(id);	
		p_title = productName;
		p_category = category;
		p_type= type;
		p_condition = condition;
		p_console = console;
		p_stock = quantity;
		p_price = price;
		p_version = version;	
	}
	
	

	public int getP_type() {
		return p_type;
	}
	public void setP_type(int p_type) {
		this.p_type = p_type;
	}
	public Timestamp getP_release_date() {
		return p_release_date;
	}
	public void setP_release_date(Timestamp p_release_date) {
		this.p_release_date = p_release_date;
	}
	public int getP_rating() {
		return p_rating;
	}
	public void setP_rating(int p_rating) {
		this.p_rating = p_rating;
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
	public int getP_version() {
		return p_version;
	}
	public void setP_version(int p_version) {
		this.p_version = p_version;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	
	 
    protected void markNew(UnitOfWork UnitOfWork)
    {
        UnitOfWork.addNewObject(this);
    }
    
    protected void markDirty(UnitOfWork UnitOfWork)
    {
        UnitOfWork.addDirtyObject(this);
    }
    
    protected void markClean(UnitOfWork UnitOfWork)
    {
        UnitOfWork.addCleanObject(this);
    }
    
	
}
