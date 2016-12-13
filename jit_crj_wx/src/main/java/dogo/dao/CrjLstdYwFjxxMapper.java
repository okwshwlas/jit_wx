package dogo.dao;

import java.util.List;

import dogo.model.CrjLstdYwFjxx;

public interface CrjLstdYwFjxxMapper {

	int insert(CrjLstdYwFjxx crjLstdYwFjxx);
	
	int insertSelective(CrjLstdYwFjxx crjLstdYwFjxx);
	
	List<CrjLstdYwFjxx> selectByYwbh(String ywbh);
}
