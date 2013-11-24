package dataMapper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;


import domain.Customer;
import domain.DomainObject;
import domain.Product;


public class ProductMapper extends AbstractMapper{

	//collumns in the db table. 
	public static final String table="Product";
	public static final String COLUMNS = " p_id, p_category, p_title, p_release_date, p_type,p_condition, p_console, p_stock,"
			+ "p_price, p_desc, p_rating,  p_version";
	private final static String insertStatement = "INSERT INTO "+ table +" VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?)";
	private final static String lastIDStatement = "SELECT MAX(p_id) FROM "+ table;
	private final static String findByCategoryStatement = "SELECT * FROM "+ table +" WHERE p_category=?";
	private final static String updateStatement = "UPDATE "+ table +" SET p_category = ?, p_title = ?, p_type =?, p_condition =?,"
	                                              +" p_console =?, p_stock =?,p_price =?, p_version = ?  WHERE p_id = ? and p_version = ?";
	private final static String checkVersionStatement = "SELECT p_version"+ table +" WHERE p_id=?";

	//loads up the Product Object
	protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException {
		int p_category  = rs.getInt(2);
		String p_title = rs.getString(3);
		Timestamp p_release_date = rs.getTimestamp(4);
		int p_type = rs.getInt(5);
		int p_condition = rs.getInt(6);
		int p_console = rs.getInt(7);
		int p_stock = rs.getInt(8);
		Double p_price = rs.getDouble(9);
		String p_desc = rs.getString(10);
		int p_rating = rs.getInt(11);
		int p_version = rs.getInt(12);
		
		Product result = new Product(id, p_type, p_release_date, p_rating,  p_console, p_stock,
										p_price, p_condition, p_title, p_category,p_desc, p_version); 
		return result; 
	}

	//finds a product using the p_id
	public Product find(Long id) throws SQLException {
		return (Product) abstractFind(id);
	}
	
	public List<Product> findByProductCategory(int category){
		
		List<Product> productList = new ArrayList<Product>();

		if(DB==null) {
			//setConnection();
			SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();
			DB = ssHsession.getConnection();
			
		}
		
		PreparedStatement findStatement = null;
		try {
			
			findStatement = DB.prepareStatement(findByCategoryStatement);
			findStatement.setInt(1, category);
			
			ResultSet rs = findStatement.executeQuery();
			//System.out.println("OK ");
			//rs.next();
			//System.out.println("the user are found ,the id "+rs.getString(1));
			List<DomainObject> tempResult = loadAll(rs);
			
			for(int i=0;i<tempResult.size();i++){
				productList.add((Product)tempResult.get(i));
				
		
				
			}
			DB.close();

		
			} catch (SQLException e) {
				
			} 
		    //finally {
				//DB.cleanUp(findStatement);
			
			//}
				return productList;
		
		
	}
	
	public List<Product> findAllProducts() {
		List<Product> allProducts = new ArrayList<Product>();
		try {
			SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
			Connection connection = sshSession.getConnection();

			String findAllProductsSql = "SELECT " + COLUMNS + " FROM Product"; 
			PreparedStatement findAllProductsStatement = connection.prepareStatement(findAllProductsSql);
			ResultSet rs = findAllProductsStatement.executeQuery();
			
			while(rs.next()) {
				Long id = rs.getLong(1);
				int p_category  = rs.getInt(2);
				String p_title = rs.getString(3);
				Timestamp p_release_date = rs.getTimestamp(4);
				int p_type = rs.getInt(5);
				int p_condition = rs.getInt(6);
				int p_console = rs.getInt(7);
				int p_stock = rs.getInt(8);
				Double p_price = rs.getDouble(9);
				String p_desc = rs.getString(10);
				int p_rating = rs.getInt(11);
				int p_version = rs.getInt(12);
				
				allProducts.add(new Product(id, p_type, p_release_date, p_rating,  p_console, p_stock,
						p_price, p_condition, p_title, p_category,p_desc, p_version)); 
			}
			
			connection.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return allProducts;	
	}
	
	public List<String> findProductCondition(){
		
		return null;
	}
	

	
	public List<String> findProductConsole(){
		
		return null;
	}
	
	public Long insertProduct(Product p) throws ClassNotFoundException, SQLException{
		
		return insert(p);
	}

	@Override
	protected String insertStatement() {
		// TODO Auto-generated method stub
		return insertStatement;
	}

	@Override
	protected String lastIDStatement() {
		// TODO Auto-generated method stub
		return lastIDStatement;
	}

	@Override
	protected void doInsert(DomainObject abstractSubject,
			PreparedStatement stmt) throws SQLException {
		// TODO Auto-generated method stub
		
		Product subject = (Product) abstractSubject;
		stmt.setInt(2, subject.getP_category());
		stmt.setString(3, subject.getP_title());
		stmt.setTimestamp(4, subject.getP_release_date());
		stmt.setInt(5,subject.getP_type());
		stmt.setInt(6, subject.getP_condition());
		stmt.setInt(7, subject.getP_console());
		stmt.setInt(8, subject.getP_stock());
		stmt.setDouble(9, subject.getP_price());
		stmt.setString(10, subject.getP_desc());
		stmt.setInt(11, subject.getP_rating());
		stmt.setInt(12, subject.getP_version());
	
		
	}

	@Override
	protected String findStatement() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	protected String updateStatement() {
		// TODO Auto-generated method stub
		return updateStatement;
	}

	@Override
	protected void doUpdate(DomainObject abstractObject, PreparedStatement stmt)
			throws SQLException {
		// TODO Auto-generated method stub
		
		Product subject = (Product) abstractObject;
		stmt.setInt(1, subject.getP_category());
		stmt.setString(2, subject.getP_title());
		stmt.setInt(3, subject.getP_type());
		stmt.setInt(4, subject.getP_condition());
		stmt.setInt(5, subject.getP_console());
		stmt.setInt(6, subject.getP_stock());
		stmt.setDouble(7, subject.getP_price());
		stmt.setInt(8, subject.getP_version()+1);
		stmt.setLong(9, subject.getId());
		stmt.setInt(10, subject.getP_version());
		
		
	}


}
