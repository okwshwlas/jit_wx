package dogo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.model.CrjPaylog;

@Service
public interface CrjWxQzPayServicel {
	@Autowired
	 int deleteByPrimaryKey(String id);
	@Autowired
	    int insert(CrjPaylog record);
	@Autowired
	    int insertSelective(CrjPaylog record);
	@Autowired
	    CrjPaylog selectByPrimaryKey(String id);
	@Autowired
	    CrjPaylog selectByBizNo(String bizNo);
	@Autowired
	    int updateByPrimaryKeySelective(CrjPaylog record);
	@Autowired
	    int updateByPrimaryKey(CrjPaylog record);
	
}
