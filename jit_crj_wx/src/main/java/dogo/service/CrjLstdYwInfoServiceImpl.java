package dogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dogo.dao.CrjLstdYwInfoMapper;
import dogo.model.CrjLstdYwInfo;

@Service
public class CrjLstdYwInfoServiceImpl implements CrjLstdYwInfoServiceI{
	
	@Autowired
	private CrjLstdYwInfoMapper crjLstdYwInfoMapper;
	
	@Override
	public int insertSelective(CrjLstdYwInfo crjLstdYwInfo) {
		return crjLstdYwInfoMapper.insert(crjLstdYwInfo);
	}

	@Override
	public CrjLstdYwInfo selectByOpenIdPD(String openid) {
		return crjLstdYwInfoMapper.selectByOpenIdPD(openid);
	}

	@Override
	public List<CrjLstdYwInfo> selectByOpenId(String openid) {
		return crjLstdYwInfoMapper.selectByOpenId(openid);
	}

	@Override
	public void save(CrjLstdYwInfo crjLstdYwInfo) {
		crjLstdYwInfoMapper.insert(crjLstdYwInfo);
		
	}

	@Override
	public CrjLstdYwInfo selectByYwbh(String ywbh) {
		return crjLstdYwInfoMapper.selectByYwbh(ywbh);
	}

	@Override
	public int updateById(CrjLstdYwInfo crjLstdYwInfo) {
		return crjLstdYwInfoMapper.updateById(crjLstdYwInfo);
	}

	@Override
	public int updateByYwbh(CrjLstdYwInfo crjLstdYwInfo) {
		return crjLstdYwInfoMapper.updateByYwbh(crjLstdYwInfo);
	}

}
