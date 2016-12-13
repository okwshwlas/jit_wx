package dogo.service;

import dogo.model.HuanyingTuwen;

public interface HuanyingTuwenService {
	
	public void updateHuanyingTuwenParentById(HuanyingTuwen huanyingTuwen);
	
	public HuanyingTuwen selectByPrimaryKey(String id);

	void addHuanyingTuwen(HuanyingTuwen huanyingTuwen);
}
