package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.CrjLstdYwFjxxMapper;
import dogo.model.CrjLstdYwFjxx;

@Service
public class CrjLstdYwFjxxServiceImpl implements CrjLstdYwFjxxServiceI{
	
	@Autowired
	private CrjLstdYwFjxxMapper crjLstdYwFjxxMapper;
	
	@Override
	public void save(CrjLstdYwFjxx crjLstdYwFjxx) {
		crjLstdYwFjxxMapper.insert(crjLstdYwFjxx);
	}

	@Override
	public int insertSelective(CrjLstdYwFjxx crjLstdYwFjxx) {
		return crjLstdYwFjxxMapper.insert(crjLstdYwFjxx);
	}

	@Override
	public List<CrjLstdYwFjxx> selectByYwbh(String ywbh) {
		return crjLstdYwFjxxMapper.selectByYwbh(ywbh);
	}

}
