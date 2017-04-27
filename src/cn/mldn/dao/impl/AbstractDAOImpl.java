package cn.mldn.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Set;

import cn.mldn.util.dbc.DatabaseConnection;

public abstract class AbstractDAOImpl {
	
	
	public boolean handleDeleteForInt(String tableName,String pkColumnName,Set<Integer> ids) throws SQLException{
		StringBuffer sql =new StringBuffer();
		sql.append("delete from ").append(tableName).append(" where ").append(pkColumnName).append(" in ( ");
		Iterator<Integer> iter = ids.iterator();
		while(iter.hasNext()){
			sql.append(iter.next()).append(",");
		}
		sql.delete(sql.length()-1, sql.length()).append(" )");
		PreparedStatement pstmt =DatabaseConnection.getConnection().prepareStatement(sql.toString());
		
		return pstmt.executeUpdate()>0;
	}
}
