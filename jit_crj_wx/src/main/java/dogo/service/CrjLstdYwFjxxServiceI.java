package dogo.service;

import java.util.List;

import dogo.model.CrjLstdYwFjxx;

public interface CrjLstdYwFjxxServiceI {

	void save(CrjLstdYwFjxx crjLstdYwFjxx);
	
	int insertSelective(CrjLstdYwFjxx crjLstdYwFjxx);
	
	List<CrjLstdYwFjxx> selectByYwbh(String ywbh);
}
