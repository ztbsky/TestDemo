package cn.mldn.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.mldn.vo.Dept;

public interface IDeptService {
	
	public boolean add(Dept vo) throws Exception;
	
	public List<Dept> list() throws Exception;
	
	
	public Map<String, Object> listDetails() throws Exception;
	
	
	
	public Dept getEditPre(Integer id) throws Exception;
	
	
	public boolean edit(Dept vo) throws Exception;
	
	
	
	
	
	public boolean deleteBatch(Set<Integer> ids) throws Exception;
	
	
	
	
	
	
	
	
}
