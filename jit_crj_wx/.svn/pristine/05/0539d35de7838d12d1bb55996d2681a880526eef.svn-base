package dogo.service;

import java.util.List;
import java.util.Map;

import dogo.model.Tuwen;

public interface TuwenService {

	//查询所有图文
	public List<Tuwen> selectAllTuwen(Map<String, Object> map);

	// 查询总数
	public int selectAllTuwenCount(Map<String, Object> map);

	public void insertTuwen(Tuwen tuwen);

	public void deleteTuwenById(String id);

	public void deleteTuwenByParentId(String id);

	public Tuwen selectParentTuwenById(String id);

	public void updateTuwen(Tuwen tuwen);

	public void deleteAllTuwenById(String string);

	public void deletePatentId(Tuwen tuwen);

	public int selectHasParentId(Tuwen tuwen);

	public int selectisNotkeyword(Map<String,Object> map);
	
	public List<Tuwen> selectAllTuwenBySign(String sign);
	
	public List<Tuwen> selectTuwenBykeyword_id(String keyword_id);
	
	
}
