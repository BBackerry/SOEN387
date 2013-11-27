package dataMapper;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author A
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import domain.Product;

public class MapperRegistry {
	public static final String table="Product";  
	private final static String insertStatement = "INSERT INTO "+ table +" VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?)";
	private final static String updateStatement = "UPDATE "+ table +" SET p_category = ?, p_title = ?, p_type =?, p_condition =?,"
	                                              +" p_console =?, p_stock =?,p_price =?, p_version = ?  WHERE p_id = ? and p_version = ?";
	private final static String deleteStatement = "UPDATE "+ table +" SET p_status = ?,p_version=?  WHERE p_id = ? and p_version = ?"; 
	
    public void addProduct(Product product) {
        
       
  

                try {
		SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

		// Get sql connection from sshSession
		Connection connection = ssHsession.getConnection();
                
                
		Statement statement = connection.createStatement();

		ResultSet resultSet = statement.executeQuery(insertStatement);

		JdbcUtilViaSSH.close(resultSet, statement, ssHsession);

                }
                
                catch(Exception e){
                System.out.println("<h5>SQL CONNECTION ERROR</h5>");
                }
    }
	
    
    public void editProduct(Product product) {
        


                try {
		SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

		// Get sql connection from sshSession
		Connection connection = ssHsession.getConnection();
                
                
		Statement statement = connection.createStatement();

		ResultSet resultSet = statement.executeQuery(updateStatement );

		JdbcUtilViaSSH.close(resultSet, statement, ssHsession);

                }
                
                catch(Exception e){
                System.out.println("<h5>SQL CONNECTION ERROR</h5>");
                }
    }
    
    public void deleteProduct(Product product) {
        


                try {
		SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

		// Get sql connection from sshSession
		Connection connection = ssHsession.getConnection();
                
                
		Statement statement = connection.createStatement();

		ResultSet resultSet = statement.executeQuery(deleteStatement);

		JdbcUtilViaSSH.close(resultSet, statement, ssHsession);

                }
                
                catch(Exception e){
                System.out.println("<h5>SQL CONNECTION ERROR</h5>");
                }
    }
}
