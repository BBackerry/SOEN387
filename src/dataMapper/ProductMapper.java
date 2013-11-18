package dataMapper;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import domain.DomainObject;
import domain.Product;


public class ProductMapper extends AbstractMapper{

	//collumns in the db table. 
	public static final String COLUMNS = " p_id, p_desc, p_type, p_release_date, p_rating, p_img, p_console, p_stock,"
			+ "p_price, p_user_rating, p_condition, p_title, p_category";
	
	protected String findStatement(){
		return "SELECT " + COLUMNS + " FROM Product" + " WHERE p_id = ?";
	}
	
	//loads up the Product Object
	protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException {
		String p_desc = rs.getString(2);
		int p_type = rs.getInt(3);
		Date p_release_date = rs.getDate(4);
		int p_rating = rs.getInt(5);
		Blob p_img = rs.getBlob(6);
		int p_console = rs.getInt(7);
		int p_stock = rs.getInt(8);
		Double p_price = rs.getDouble(9);
		Double p_user_rating = rs.getDouble(10);
		int p_condition = rs.getInt(11);
		String p_title = rs.getString(12);
		int p_category = rs.getInt(13);
		
		Product result = new Product(id, p_desc, p_type, p_release_date, p_rating, p_img, p_console, p_stock,
										p_price, p_user_rating, p_condition, p_title, p_category); 
		return result; 
	}

	//finds a product using the p_id
	public Product find(Long id) throws SQLException {
		return (Product) abstractFind(id);
	}
	
	public List<String> findProductCondition(){
		
		return null;
	}
	

	
	public List<String> findProductConsole(){
		
		return null;
	}
}
