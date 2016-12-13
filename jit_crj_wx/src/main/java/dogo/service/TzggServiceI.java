package dogo.service;

import java.util.List;

import dogo.model.Tzgg;

public interface TzggServiceI {

	
	/**
	 * 查询个人的通知公告根据状态
	 * @param tzgg
	 * @return
	 */
	List<Tzgg> selectAllTzggByIdcardAndstatue(Tzgg tzgg);
	
	/**
	 * 根据ID查询
	 * @param id
	 * @return
	 */
	Tzgg selectById(String id);
}
