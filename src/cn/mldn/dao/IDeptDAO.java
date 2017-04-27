package cn.mldn.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import cn.mldn.util.dao.IBaseDAO;
import cn.mldn.vo.Dept;

public interface IDeptDAO extends IBaseDAO<Integer, Dept> {
	
	
	public Map<Integer, Map<String,Object> > findAllStat()  throws SQLException;
	
	
	
}
