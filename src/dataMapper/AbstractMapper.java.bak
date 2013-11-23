package dataMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import domain.DomainObject;

//general mapper all mappers inherit
public abstract class AbstractMapper {
	protected Map<String, DomainObject> loadedMap = new HashMap<String, DomainObject>(); 
	abstract protected String findStatement();
	
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
		connection.close();
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
		sshSession.getConnection().close();
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
	
	//specific load method that child must implement to create their domain object
	abstract protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException;
}
