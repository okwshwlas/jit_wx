package dogo.service;

import dogo.model.Huanying;
import dogo.model.HuanyingTuwen;

public interface HuanyingService {
	
	/**
	 * 按id查询
	 * @param id
	 * @return
	 * @ 
	 */
	Huanying selectHuanyingWenbenById(String id)  ;

	/**
	 * 非空修改
	 * @param huanying
	 * @ 
	 */
	void updateHuanyingById(Huanying huanying)  ;

	HuanyingTuwen selectAllHuanyingtuwenById(String id) ;
	
}
