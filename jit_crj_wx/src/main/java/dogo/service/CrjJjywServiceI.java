package dogo.service;

import java.util.List;

import dogo.model.CrjJjyw;


public interface CrjJjywServiceI {

	
	/**
	 * 保存
	 */
	void save(CrjJjyw crjjjyw);
	
	int insertSelective(CrjJjyw crjjjyw);
	/**
	 * 修改
	 */
	int update(CrjJjyw record);
	/**
	 * 查看审批列表
	 */
	List<CrjJjyw> selectByShjg();
	/**
	 * 查看历史记录
	 */
	List<CrjJjyw> selectByOpenId(String openId);
	/**
	 * 查看审批单条
	 */
	CrjJjyw selectById(String id);
}
