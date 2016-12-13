package dogo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.TuwenMapper;
import dogo.dao.WenbenMapper;
import dogo.model.Tuwen;
import dogo.modeljson.AjaxJson;
@Service("tuwenService")
public class TuwenServiceImpl implements TuwenService {
	
	private TuwenMapper tuwenMapper;
	
	private WenbenMapper wenbenMapper;
	
	public WenbenMapper getWenbenMapper() {
		return wenbenMapper;
	}
	@Resource
	public void setWenbenMapper(WenbenMapper wenbenMapper) {
		this.wenbenMapper = wenbenMapper;
	}
	public TuwenMapper getTuwenMapper() {
		return tuwenMapper;
	}
	@Autowired
	public void setTuwenMapper(TuwenMapper tuwenMapper) {
		this.tuwenMapper = tuwenMapper;
	}

	public List<Tuwen> selectAllTuwen(Map<String, Object> map) {
		return tuwenMapper.selectAllTuwenByPage(map);
	}

	public int selectAllTuwenCount(Map<String, Object> map) {
		return tuwenMapper.selectAllCount(map);
	}
	public void insertTuwen(Tuwen tuwen) {
		tuwenMapper.insertTuwen(tuwen);
	}
	public void deleteAllTuwenById(String id) {
		tuwenMapper.deleteTuwenById(id);
		tuwenMapper.deleteTuwenByParentId(id);
	}
	public void deleteTuwenByParentId(String id) {
		tuwenMapper.deleteTuwenByParentId(id);
	}
	public Tuwen selectParentTuwenById(String id) {
		Tuwen tuwen = tuwenMapper.selectByPrimaryKey(id);
		Map<String,Object> par = new HashMap<String, Object>();
		if(tuwen != null){
			par.put("id", tuwen.getId());
			List<Tuwen> list = tuwenMapper.selectByPatentId(par);
			tuwen.setChildList(list);
		}
		return tuwen;
	}
	public void updateTuwen(Tuwen tuwen) {
		String id = tuwen.getId();
		String parentId = tuwen.getParentId(); 
		Tuwen oldtuwen = tuwenMapper.selectByPrimaryKey(id);//获取图文
		String oldParentId = oldtuwen.getParentId();
		if(null != oldParentId&&!"".equals(oldParentId)){//拼接图文的parentid,以逗号隔开
			oldParentId += "," + parentId;
		}else{
			oldParentId = parentId;
		}
		tuwen.setParentId(oldParentId);
		tuwenMapper.updateByPrimaryKeySelective(tuwen);//修改图文的parentid
	}
	public void deleteTuwenById(String id) {
		tuwenMapper.deleteTuwenById(id);
	}
	public void deletePatentId(Tuwen tuwen) {
		String id = tuwen.getId();
		String parentId = tuwen.getParentId();
		tuwen = tuwenMapper.selectByPrimaryKey(id);//获取图文
		String oldParentId = tuwen.getParentId();
		List<String> list = new ArrayList<String>();
		
		if(null!=oldParentId&&!"".equals(oldParentId)){
			String[] parent = oldParentId.split(",");
			for(String str:parent){
				list.add(str);
			}
		}
		list.remove(parentId);
		String newParentIds="";
		for(int i = 0;i<list.size();i++){
			if(i == list.size()-1){
				newParentIds += list.get(i);
			}else{
				newParentIds += list.get(i)+",";
			}
		}
		tuwen.setParentId(newParentIds);
		tuwenMapper.updateParentIdByPrimaryKey(tuwen);
	}
	public int selectHasParentId(Tuwen tuwen) {
		int count = tuwenMapper.selectHasParentId(tuwen);
		return count;
	}
	public int selectisNotkeyword(Map<String,Object> map) {
		
		int tuwenCount = tuwenMapper.selectisNotkeyword(map)+wenbenMapper.selectisNotkeyword(map);
		
		return tuwenCount;
	}
	public List<Tuwen> selectAllTuwenBySign(String sign) {
		return tuwenMapper.selectAllTuwenBySign(sign);
	}
	public List<Tuwen> selectTuwenBykeyword_id(String keyword_id) {
		return tuwenMapper.selectTuwenBykeyword_id(keyword_id);
	}
	

}
