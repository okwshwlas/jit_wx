package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.CrjJjywMapper;
import dogo.model.CrjJjyw;

@Service
public class CrjJjywServiceImpl implements CrjJjywServiceI{
//	private CrjJjywServiceI crjjjywServiceI;
	@Autowired
	private CrjJjywMapper crjjjywMapper;
	
	public void save(CrjJjyw crjjjyw) {
		crjjjywMapper.insert(crjjjyw);
	}

	public int update(CrjJjyw record) {
		return crjjjywMapper.update(record);
	}
	
	public List<CrjJjyw> selectByShjg(){
		return crjjjywMapper.selectByShjg();
	}
	
	public CrjJjyw selectById(String id){
		return crjjjywMapper.selectById(id);
	}

	public int insertSelective(CrjJjyw crjjjyw) {
		return crjjjywMapper.insert(crjjjyw);
	}
	
	public List<CrjJjyw> selectByOpenId(String openId){
	    return crjjjywMapper.selectByOpenId(openId);	
	}
	
}
