package cn.mldn.dao;

import java.sql.SQLException;

import cn.mldn.util.dao.IBaseDAO;
import cn.mldn.vo.Emp;

public interface IEmpDAO extends IBaseDAO<Integer, Emp> {
	
	public boolean doRemoveByDeptno(Integer deptno) throws SQLException;
	
}
