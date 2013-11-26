package dataMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import domain.DomainObject;

//general mapper all mappers inherit
public abstract class AbstractMapper {
	protected Map<String, DomainObject> loadedMap = new HashMap<String, DomainObject>(); 
	protected Connection DB;
	
	protected abstract String findStatement();
	protected abstract String insertStatement();
	protected abstract String lastIDStatement();
	protected abstract String updateStatement();
	protected abstract String deleteStatement();
	
	abstract protected void doUpdate(DomainObject object, PreparedStatement stmt) throws SQLException;
    abstract protected void doDelete(DomainObject object, PreparedStatement stmt) throws SQLException;
	
	
	
	//general find method
	protected DomainObject abstractFind(Long id) throws SQLException {
		DomainObject result = (DomainObject) loadedMap.get(id);
		if (result != null) return result;
		PreparedStatement findStatement = null; 
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		Connection connection = sshSession.getConnection();
		
		findStatement = connection.prepareStatement(findStatement()); 
		findStatement.setLong(1, id.longValue()); 
		ResultSet rs = findStatement.executeQuery(); 
		
		rs.next();
		result = load(rs);
		//connection.close();
		return result;	
	}
	
	//advance find method that finds when there are multiple field making the primary id. 
	//string id is in the format id-id-id where id is a single attribute that is part of the primary id. 
	protected DomainObject abstractFind(String id) throws SQLException {
		DomainObject result = (DomainObject) loadedMap.get(id);
		if (result != null) return result;
		PreparedStatement findStatement = null; 
		SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
		
		findStatement = sshSession.getConnection().prepareStatement(findStatement()); 
		String[] multiId= id.split("-");
		for(int i = 1; i< multiId.length; i++){
			findStatement.setLong(i, Long.parseLong(multiId[i-1])); 
		}
		ResultSet rs = findStatement.executeQuery(); 
		rs.next();
		result = load(rs);
		//sshSession.getConnection().close();
		return result;		
	}
	
	//load the object to the map if it does not exist else use the object in the map
	protected DomainObject load(ResultSet rs) throws SQLException { 
		Long id = new Long(rs.getLong(1)); 
		if (loadedMap.containsKey(id)) return (DomainObject) loadedMap.get(id); 
		DomainObject result = doLoad(id, rs); 
		loadedMap.put(id.toString(), result); 
		return result; 
	}
	
	protected List<DomainObject> loadAll(ResultSet rs) throws SQLException {
		List<DomainObject> result=new ArrayList<DomainObject>();
		while(rs.next())
			result.add(load(rs));
		return result;
		
	}
	
	//specific load method that child must implement to create their domain object
	abstract protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException;
	abstract protected void doInsert(DomainObject subject, PreparedStatement insertStatement) throws SQLException;
	
	
	public Long insert(DomainObject subject) throws ClassNotFoundException, SQLException {
		
		//if(DB==null) {
			//setConnection();
			SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

			DB = ssHsession.getConnection();
			
		//}
		PreparedStatement insertStatement = null;
		
		insertStatement = DB.prepareStatement(insertStatement());
		subject.setId(findNextDatabaseId());
		insertStatement.setLong(1, subject.getId());
		doInsert(subject, insertStatement);
		insertStatement.execute();
		loadedMap.put(String.valueOf(subject.getId()), subject);
		//DB.close();
		return subject.getId();
	}
	
	
	
	public int delete(long id) {
		DomainObject deleteItem=loadedMap.get(String.valueOf(id));
		//if(DB==null) {
			//setConnection();
			SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();
			DB = ssHsession.getConnection();
		//}
		
		PreparedStatement stmt = null;
		int rowCount = 0;
		
		try {
			stmt = DB.prepareStatement(deleteStatement());
			stmt.setLong(3,id);
			doDelete(deleteItem,stmt);
			rowCount = stmt.executeUpdate();
			if (rowCount == 0) {
		          System.out.println("The delelte is failure");
			}else{
				
				loadedMap.remove(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rowCount;
	}

	private int findNextDatabaseId() throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub		
		if(DB==null) {
			//setConnection();
			SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();
			DB = ssHsession.getConnection();
		}
		PreparedStatement stmt = DB.prepareStatement(lastIDStatement());
		ResultSet rs = stmt.executeQuery();
		rs.next();		
		return rs.getInt(1) + 1;
	}
		
	
	
	 public int update(DomainObject object)throws Exception{
     	    	
			if(DB==null) {
				//setConnection();
				SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();
				DB = ssHsession.getConnection();	
			}
			
			PreparedStatement stmt = null;
			int rowCount = 0;
			
			try {
				
				
				stmt = DB.prepareStatement(updateStatement());
				doUpdate(object, stmt);
				System.out.println("The statement is " + stmt);
				rowCount = stmt.executeUpdate();
				if (rowCount == 0) {
			          throwConcurrencyException(object);
			
				}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			//loadedMap.put(object.getId(), object);
			return rowCount;
     
     }


	
   
     

	 protected void throwConcurrencyException(DomainObject object) {
			//Connection conn = null;
			
			if(DB==null) {
				//setConnection();
				SSHjdbcSession ssHsession = JdbcUtilViaSSH.getConnection();

				DB = ssHsession.getConnection();
				
			}
			
			System.out.println("There is concurrency problem for the record:  " + object.getId() );
				
		}
		
	
}
