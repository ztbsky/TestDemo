package cn.mldn.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.mldn.dao.IDeptDAO;
import cn.mldn.dao.IEmpDAO;
import cn.mldn.service.IDeptService;
import cn.mldn.util.factory.Factory;
import cn.mldn.vo.Dept;

public class DeptServiceImpl implements IDeptService {

	@Override
	public boolean add(Dept vo) throws Exception {
		if (vo==null) {
			return false;
		}
		IDeptDAO deptDao =Factory.getDAOInstance("dept.dao");
		if (deptDao.findById(vo.getDeptno())==null) {
			return deptDao.doCreate(vo);
		}
		return false;
	}

	@Override
	public List<Dept> list() throws Exception {
		IDeptDAO deptDao =Factory.getDAOInstance("dept.dao");
		return 	deptDao.findAll();
	}

	@Override
	public Map<String, Object> listDetails() throws Exception {
		IDeptDAO deptDao =Factory.getDAOInstance("dept.dao");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("allDepts", deptDao.findAll());
		map.put("deptStats", deptDao.findAllStat());
		return map;
	}

	@Override
	public Dept getEditPre(Integer id) throws Exception {
		IDeptDAO deptDao =Factory.getDAOInstance("dept.dao");
		return deptDao.findById(id);
	}

	@Override
	public boolean edit(Dept vo) throws Exception {
		IDeptDAO deptDao =Factory.getDAOInstance("dept.dao");
		return deptDao.doUpdate(vo);
	}

	@Override
	public boolean deleteBatch(Set<Integer> ids) throws Exception {
		IEmpDAO empDao =Factory.getDAOInstance("emp.dao");
		Iterator<Integer> iter =ids.iterator();
		while (iter.hasNext()) {
			empDao.doRemoveByDeptno(iter.next());
		}
		
		IDeptDAO deptDao =Factory.getDAOInstance("dept.dao");
		return deptDao.doRemoveBatch(ids);
	}

}
