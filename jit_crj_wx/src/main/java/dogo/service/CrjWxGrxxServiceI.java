package dogo.service;

import java.util.List;

import dogo.model.CrjPaylog;
import dogo.model.CrjWxGrxx;



public interface CrjWxGrxxServiceI {

	
	/**
	 * 保存
	 */
	void save(CrjWxGrxx crjwxgrxx);
	
	int insertSelective(CrjWxGrxx crjwxgrxx);
	/**
	 * 修改
	 */
	int update(CrjWxGrxx crjWxGrxx);
	/**
	 * 查询
	 */
	CrjWxGrxx selectByPrimaryKey(String openid);
}
