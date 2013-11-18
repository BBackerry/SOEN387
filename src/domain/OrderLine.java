package domain;


public class OrderLine extends DomainObject{
	private int p_id;
	private int quantity;
	private double price;
	private double line_total;
	private Product product;
	
	public OrderLine(long o_id, int p_id, int quantity, double price, double line_total,
			Product product) {
		super(o_id);
		this.p_id = p_id;
		this.quantity = quantity;
		this.price = price;
		this.line_total = line_total;
		this.product = product;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getLine_total() {
		return line_total;
	}

	public void setLine_total(double line_total) {
		this.line_total = line_total;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
