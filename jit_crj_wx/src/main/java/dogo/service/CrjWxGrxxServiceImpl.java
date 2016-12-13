package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.CrjJjywMapper;
import dogo.dao.CrjWxGrxxMapper;
import dogo.model.CrjJjyw;
import dogo.model.CrjWxGrxx;

@Service
public class CrjWxGrxxServiceImpl implements CrjWxGrxxServiceI{
	@Autowired
	private CrjWxGrxxMapper crjwxgrxxMapper;
	@Override
	public void save(CrjWxGrxx crjwxgrxx) {
		crjwxgrxxMapper.insert(crjwxgrxx);
	}
	@Override
	public int update(CrjWxGrxx crjWxGrxx) {
		return crjwxgrxxMapper.update(crjWxGrxx);
	}
	@Override
	public int insertSelective(CrjWxGrxx crjwxgrxx) {
		return crjwxgrxxMapper.insert(crjwxgrxx);
	}
	@Override
	public CrjWxGrxx selectByPrimaryKey(String openid) {
		return crjwxgrxxMapper.selectByPrimaryKey(openid);
	}

	
}
